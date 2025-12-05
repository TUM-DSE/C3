#!/usr/bin/env python3


import m5
from m5.objects import *
import argparse
import math
import os


m5.util.addToPath("/gem5/configs")

parser = argparse.ArgumentParser(description="Unified gem5 setup for C-3 Artifact")

parser.add_argument("-c", "--cores", help="Number of cores", type=int, required=True)
parser.add_argument('-ro', "--redirect-output", help="redirect the output", action='store_true') 
parser.add_argument('-ri', "--redirect-input", help="redirect the input", action='store_true') 
parser.add_argument('-rm', "--remote-memory", help="use remote memory", action='store_true')
parser.add_argument("--switched", help="Switch cluster_id behavior for hetero protocols", action='store_true')
parser.add_argument("--remote-latency", type=int, default=140, help="Remote latency value (default: 140)")
parser.add_argument("--cpu-config", type=str, default="x86", 
                    choices=["x86", "arm_arm", "arm_tso", "tso_tso"],
                    help="CPU configuration: x86 (default), arm_arm, arm_tso, tso_tso")
parser.add_argument("cmd", nargs=argparse.REMAINDER)
args = parser.parse_args()

remote_latency = 140




print(f"{buildEnv['PROTOCOL']}")
if buildEnv["PROTOCOL"] == "MESI_unord":
    from protocols.generated import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "MESI_unord_CXL":
    from protocols.generatedCXL import make_l1_cache, make_dir, make_l2_cache, has_l2_cache  
elif buildEnv["PROTOCOL"] == "MESI_CXL_MOESI":
    if args.switched:
        from protocols.generatedCXLheteroS import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
    else:
        from protocols.generatedCXLhetero import make_l1_cache, make_dir, make_l2_cache, has_l2_cache  
elif buildEnv["PROTOCOL"] == "MESI_CXL_MESIF":
    if args.switched:
        from protocols.generatedCXLheteroS import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
    else:
        from protocols.generatedCXLhetero import make_l1_cache, make_dir, make_l2_cache, has_l2_cache  
else:
    fatal("unsupported cache protocol")

def split_in_half(iter):
    array = list(iter)
    return array[:(len(array) // 2)], array[(len(array) // 2):]

class MyNetwork(GarnetNetwork):
    def __init__(self, ruby_system):
        super().__init__()
        self.netifs = []
        self.routers = []
        self.ext_links = []
        self.int_links = []
        self.ruby_system = ruby_system
        self.ni_flit_size = 72        

    def create_router(self):
        id = len(self.routers)
        router = GarnetRouter(router_id=id)
        self.routers.append(router)
        return router
    
    def connect_controller(self, router, controller, latency = 8):
        self.ext_links.append(GarnetExtLink(link_id=len(self.ext_links), ext_node=controller, int_node=router, latency=latency))

    def connect_routers(self, routers, latency=8,  weight=1):
        for ri in routers:
            for rj in routers:
                if ri == rj:
                    continue  # Don't connect a router to itself!
                self.int_links.append(
                    GarnetIntLink(link_id=len(self.int_links), src_node=ri, dst_node=rj, latency=latency, weight=weight)
                )

    def setup_buffers(self):
        self.netifs = [GarnetNetworkInterface(id=i) for (i,n) in enumerate(self.ext_links)]

system = System()

system.clk_domain = SrcClockDomain()
system.clk_domain.clock = "2GHz"
system.clk_domain.voltage_domain = VoltageDomain()

ruby_system = RubySystem()
system.caches = ruby_system
network = MyNetwork(ruby_system)
ruby_system.network = network


ruby_system.number_of_virtual_networks = 9
ruby_system.network.number_of_virtual_networks = 9


mem_range = AddrRange("8GB")
component_latency = 10
local_latency = 10

remote_addr_vaddr = 0x20000000
remote_addr_range = AddrRange(
    start=2**40,
    size=2**23
)

mem_ctrl = MemCtrl()
mem_ctrl.dram = DDR5_4400_4x8()
mem_ctrl.dram.range = mem_range

dir = make_dir(ruby_system, mem_range, mem_ctrl)
ruby_system.dir_cntrl = dir
dir_rounter = network.create_router()
network.connect_controller(dir_rounter, dir)

if args.remote_memory:
    remote_mem_ctrl = MemCtrl()
    remote_mem_ctrl.dram = DDR5_4400_4x8()
    remote_mem_ctrl.dram.range = remote_addr_range

    remote_dir = make_dir(ruby_system, remote_addr_range, remote_mem_ctrl)
    ruby_system.remote_dir_cntrl = remote_dir
    remote_dir_rounter = network.create_router()
    network.connect_controller(remote_dir_rounter, remote_dir)

cluster_routers = []
sequencers = []
cpus = []

def create_cpu(cpu_id, cluster_id, cpu_config):
    """Create CPU based on configuration.
    
    cpu_config options:
    - x86: X86O3CPU for all cores
    - arm_arm: ArmO3CPU for all cores (relaxed memory model)
    - arm_tso: Cluster 0 uses ArmO3CPU, Cluster 1 uses ArmO3CPU_TSO_En
    - tso_tso: ArmO3CPU_TSO_En for all cores (TSO memory model)
    """
    if cpu_config == "x86":
        return X86O3CPU(cpu_id=cpu_id)
    elif cpu_config == "arm_arm":
        return ArmO3CPU(cpu_id=cpu_id)
    elif cpu_config == "arm_tso":
        if cluster_id == 0:
            return ArmO3CPU(cpu_id=cpu_id)
        else:
            return ArmO3CPU_TSO_En(cpu_id=cpu_id)
    elif cpu_config == "tso_tso":
        return ArmO3CPU_TSO_En(cpu_id=cpu_id)
    else:
        fatal(f"Unknown cpu_config: {cpu_config}")


for cluster_id, cluster in enumerate(split_in_half(range(args.cores))):
    cluster_router = network.create_router()
    if args.remote_memory:
        network.connect_routers([dir_rounter, cluster_router], local_latency)
        network.connect_routers([remote_dir_rounter, cluster_router], remote_latency)
    else:
        network.connect_routers([dir_rounter, cluster_router], remote_latency, weight=1)

    local_routers = [cluster_router]

    if has_l2_cache():
        l2_cache = make_l2_cache(system, ruby_system, cluster_id)
        exec("ruby_system.l2_cntrl%d = l2_cache" % cluster_id)
        l2_router = network.create_router()
        network.connect_controller(l2_router, l2_cache, component_latency)
        local_routers.append(l2_router)
    

    for cpu_id in cluster:
        cpu = create_cpu(cpu_id, cluster_id, args.cpu_config)
        cpu.createInterruptController()
        cpus.append(cpu)
        l1cache = make_l1_cache(system, ruby_system, cpu, cluster_id)
        exec("ruby_system.l1_cntrl%d = l1cache" % cpu_id)
        l1router = network.create_router()
        network.connect_controller(l1router, l1cache, component_latency)
        local_routers.append(l1router)

        sequencer = RubySequencer(
            version=cpu_id,
            dcache=l1cache.dcache(),
            clk_domain=l1cache.clk_domain,
            ruby_system=ruby_system,
        )
        l1cache.sequencer = sequencer
        sequencer.connectCpuPorts(cpu)
        sequencers.append(sequencer)
    
    network.connect_routers(local_routers, local_latency)



system.cpu = cpus
system.mem_mode = "timing"  
system.mem_ranges = [mem_range]  
system.mem_ctrl = mem_ctrl
if args.remote_memory:
    system.remote_mem_ctrl = remote_mem_ctrl

ruby_system.num_of_sequencers = len(sequencers)

network.setup_buffers()
ruby_system.sys_port_proxy = RubyPortProxy()
system.system_port = ruby_system.sys_port_proxy.in_ports


# argparse.REMAINDER preserves a leading '--' token when present.
# If users call the script as: gem5.opt setup.py [opts] -- program args
# then args.cmd will start with '--'. Strip it so the program path is the
# first element.
if args.cmd and args.cmd[0] == "--":
    args.cmd = args.cmd[1:]

if not args.cmd:
    fatal("No workload/binary specified. Expect: -- <binary> [args...]")


binary_path = args.cmd[0]
binary_abs = os.path.abspath(binary_path)


def find_run_directory(binary_path):
    """Find the 'run/' directory for PARSEC/Phoenix benchmarks."""
    path_parts = binary_path.split(os.sep)
    
    if 'inst' in path_parts:
        inst_idx = path_parts.index('inst')
        run_path = os.sep.join(path_parts[:inst_idx] + ['run'])
        if os.path.isdir(run_path):
            return run_path
    
    return os.path.dirname(binary_path)

run_dir = find_run_directory(binary_abs)
print(f"Working directory set to: {run_dir}")

system.workload = SEWorkload.init_compatible(args.cmd[0])

process = Process()
process.cwd = run_dir  

if args.redirect_output:
    process.output = "output.txt"

if args.redirect_input:
    process.input = "./m5out/input.txt"

process.cmd = args.cmd
process.env = [f"MAPRED_NPROCESSORS={len(cpus) - 1}"]

for cpu in system.cpu:
    cpu.workload = process
    cpu.createThreads()



root = Root(full_system=False, system=system)
m5.instantiate()

print(f"Beginning simulation!")
exit_event = m5.simulate()
print(f"Exiting @ tick {m5.curTick()} because {exit_event.getCause()}")
