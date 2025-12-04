import m5
from m5.objects import *
import argparse
import math

m5.util.addToPath("/gem5/configs")
from common.FileSystemConfig import config_filesystem
from common import Options

parser = argparse.ArgumentParser()

parser.add_argument("-c", "--cores", help="Number of cores", type=int, default=2)
parser.add_argument('-ro', "--redirect-output", help="redirect the output", action='store_true') 
parser.add_argument('-ri', "--redirect-input", help="redirect the input", action='store_true') 
parser.add_argument('-rm', "--remote-memory", help="use remote memory", action='store_true') 
parser.add_argument("cmd", nargs=argparse.REMAINDER)
parser.add_argument("--remote-latency", type=int, default=10, help="Remote latency value")
# parser.add_argument("--interp-dir", help="Directory for dynamic linker/interpreter")
args = parser.parse_args()
remote_latency = args.remote_latency

print(f"PROTOCOL: {buildEnv['PROTOCOL']}")
if buildEnv["PROTOCOL"] == "MSI_unord":
    from protocols.generated import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "MESI_unord":
    from protocols.generated import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "nicolo-MSI_unord":
    from protocols.generatedsetup import make_l1_cache, make_dir, make_l2_cache, make_l2_private_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "MESI_Two_Level":
    from protocols.mesi import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "MESI_unord_CXL":
    from protocols.generatedCXL import make_l1_cache, make_dir, make_l2_cache, has_l2_cache 
elif buildEnv["PROTOCOL"] == "MESI_unord_CXL_ARM":
    from protocols.generatedCXL import make_l1_cache, make_dir, make_l2_cache, has_l2_cache   
elif buildEnv["PROTOCOL"] == "MOESI_unord_CXL":
    from protocols.generatedCXL import make_l1_cache, make_dir, make_l2_cache, has_l2_cache  
elif buildEnv["PROTOCOL"] == "MSI_unord_CXL":
    from protocols.generatedCXL import make_l1_cache, make_dir, make_l2_cache, has_l2_cache   
elif buildEnv["PROTOCOL"] == "MOESI_CMP_directory":
    from protocols.moesi import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "MOESI_CMP_directory_edit":
    from protocols.moesi_edit import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
elif buildEnv["PROTOCOL"] == "GENERATED":
    from protocols.generated import make_l1_cache, make_dir, make_l2_cache, has_l2_cache
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
## data_msg_size. Changed from default value 64 to 8. 
        self.ni_flit_size = 256        

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
component_latency = 1
local_latency = 1
# cluster_latency = 140

remote_addr_vaddr = 0x20000000
remote_addr_range = AddrRange(
    start=2**40,
    size=2**23
)

mem_ctrl = MemCtrl()
mem_ctrl.dram = DDR3_1600_8x8()
mem_ctrl.dram.range = mem_range

dir = make_dir(ruby_system, mem_range, mem_ctrl)
ruby_system.dir_cntrl = dir
dir_rounter = network.create_router()
network.connect_controller(dir_rounter, dir)

if args.remote_memory:
    remote_mem_ctrl = MemCtrl()
    remote_mem_ctrl.dram = DDR3_1600_8x8()
    remote_mem_ctrl.dram.range = remote_addr_range

    remote_dir = make_dir(ruby_system, remote_addr_range, remote_mem_ctrl)
    ruby_system.remote_dir_cntrl = remote_dir
    remote_dir_rounter = network.create_router()
    network.connect_controller(remote_dir_rounter, remote_dir)

cluster_routers = []
sequencers = []
cpus = []
for cluster_id, cluster in enumerate(split_in_half(range(args.cores))):
    cluster_router = network.create_router()
    if args.remote_memory:
        network.connect_routers([dir_rounter, cluster_router], local_latency)
        network.connect_routers([remote_dir_rounter, cluster_router], remote_latency)
    else:
        network.connect_routers([dir_rounter, cluster_router], remote_latency, weight=1)
        # cluster_routers.append(cluster_router)

    # network.connect_routers(cluster_routers, remote_latency, weight=1)

    local_routers = [cluster_router]

    if has_l2_cache():
        l2_cache = make_l2_cache(system, ruby_system)
        exec("ruby_system.l2_cntrl%d = l2_cache" % cluster_id)
        l2_router = network.create_router()
        network.connect_controller(l2_router, l2_cache, component_latency)
        local_routers.append(l2_router)
    

    for cpu_id in cluster:
        # cpu = ArmO3CPU_TSO_En(cpu_id=cpu_id)
        # cpu = ArmO3CPU(cpu_id=cpu_id)
        if cluster_id == 0:
            cpu = ArmO3CPU_TSO_En(cpu_id=cpu_id)
        else:
            cpu = ArmO3CPU(cpu_id=cpu_id)
            # cpu = O3CheckerCPU(cpu_id=cpu_id)
            # cpu = O3SimpleCPU(cpu_id=cpu_id)  
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
            # deadlock_threshold = 3e8
        )
        l1cache.sequencer = sequencer
        sequencer.connectCpuPorts(cpu)
        sequencers.append(sequencer)
    
    network.connect_routers(local_routers, local_latency)

system.cpu = cpus
system.mem_mode = "timing"  # Use timing accesses
system.mem_ranges = [mem_range]  # Create an address range
system.mem_ctrl = mem_ctrl
if args.remote_memory:
    system.remote_mem_ctrl = remote_mem_ctrl

ruby_system.num_of_sequencers = len(sequencers)

network.setup_buffers()
# Set up a proxy port for the system_port. Used for load binaries and other functional-only things.
ruby_system.sys_port_proxy = RubyPortProxy()
system.system_port = ruby_system.sys_port_proxy.in_ports


system.workload = SEWorkload.init_compatible(args.cmd[0])

process = Process()

if args.redirect_output:
    process.output = "output.txt"

if args.redirect_input:
    process.input = "./m5out/input.txt"

process.cmd = args.cmd #[binary, "-p2", "-m10", "-o"]
process.env = [f"MAPRED_NPROCESSORS={len(cpus) - 1}"]

# Set the cpu to use the process as its workload and create thread contexts
for cpu in system.cpu:
    cpu.workload = process
    cpu.createThreads()


# Set up the pseudo file system for the threads function above
config_filesystem(system)

root = Root(full_system=False, system=system)
m5.instantiate()
#process.map(remote_addr_vaddr, remote_addr_range.start, remote_addr_range.size())
print(f"Beginning simulation!")
exit_event = m5.simulate()
print(f"Exiting @ tick {m5.curTick()} because {exit_event.getCause()}")