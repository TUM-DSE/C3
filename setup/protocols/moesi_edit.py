from m5.objects import *
import math

if buildEnv["PROTOCOL"] != "MOESI_CMP_directory_edit":
    print("Current protocol:", buildEnv["PROTOCOL"])
    fatal("This system assumes MOESI_CMP_directory_edit!")

class L1Cache(L1Cache_Controller):
    _version = 0

    @classmethod
    def versionCount(cls):
        cls._version += 1  # Use count for this particular type
        return cls._version - 1

    def dcache(self):
        return self.L1Dcache
    
    def icache(self):
        return self.L1Icache

    def __init__(self, system, ruby_system, cpu, cluster_id):
        """CPUs are needed to grab the clock domain and system is needed for
        the cache block size.
        """
        super().__init__()

        self.version = self.versionCount()
        # This is the cache memory object that stores the cache data and tags
        self.L1Icache = RubyCache(
            size="64kB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=True
        )
        self.L1Dcache = RubyCache(
            size="64kB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=False
        )
        self.l2_id = cluster_id
        self.clk_domain = cpu.clk_domain
        self.send_evictions = self.sendEvicts(cpu)
        self.ruby_system = ruby_system
        # self.enable_prefetch = False
        # self.prefetcher = RubyPrefetcher()
        self.connectQueues(ruby_system)

    def getBlockSizeBits(self, system):
        bits = int(math.log(system.cache_line_size, 2))
        if 2**bits != system.cache_line_size.value:
            panic("Cache line size not a power of 2!")
        return bits

    def sendEvicts(self, cpu):
        """True if the CPU model or ISA requires sending evictions from caches
        to the CPU. Two scenarios warrant forwarding evictions to the CPU:
        1. The O3 model must keep the LSQ coherent with the caches
        2. The x86 mwait instruction is built on top of coherence
        3. The local exclusive monitor in ARM systems

        As this is an X86 simulation we return True.
        """
        return True

    def connectQueues(self, ruby_system):
        """Connect all of the queues for this controller."""
        self.mandatoryQueue = MessageBuffer()
        self.triggerQueue = MessageBuffer(ordered=True)


        self.requestFromL1Cache = MessageBuffer()
        self.requestFromL1Cache.out_port = ruby_system.network.in_port

        self.responseFromL1Cache = MessageBuffer()
        self.responseFromL1Cache.out_port = ruby_system.network.in_port

       
        self.requestToL1Cache = MessageBuffer()
        self.requestToL1Cache.in_port = ruby_system.network.out_port

        self.responseToL1Cache = MessageBuffer()
        self.responseToL1Cache.in_port = ruby_system.network.out_port


class L2Cache(L2Cache_Controller):
    _version = 0

    @classmethod
    def versionCount(cls):
        cls._version += 1  # Use count for this particular type
        return cls._version - 1

    def __init__(self, system, ruby_system):
        """CPUs are needed to grab the clock domain and system is needed for
        the cache block size.
        """
        super().__init__()

        self.version = self.versionCount()
        # This is the cache memory object that stores the cache data and tags
        self.L2cache = RubyCache(
            size="2MB", assoc=8, start_index_bit=self.getBlockSizeBits(system)
        )
        self.ruby_system = ruby_system
        self.connectQueues(ruby_system)

    def getBlockSizeBits(self, system):
        bits = int(math.log(system.cache_line_size, 2))
        if 2**bits != system.cache_line_size.value:
            panic("Cache line size not a power of 2!")
        return bits

    def sendEvicts(self, cpu):
        """True if the CPU model or ISA requires sending evictions from caches
        to the CPU. Two scenarios warrant forwarding evictions to the CPU:
        1. The O3 model must keep the LSQ coherent with the caches
        2. The x86 mwait instruction is built on top of coherence
        3. The local exclusive monitor in ARM systems

        As this is an X86 simulation we return True.
        """
        return True

    def connectQueues(self, ruby_system):
        """Connect all of the queues for this controller."""
        self.triggerQueue = MessageBuffer(ordered=True)

        self.GlobalRequestFromL2Cache = MessageBuffer()
        self.GlobalRequestFromL2Cache.out_port = ruby_system.network.in_port
        self.L1RequestFromL2Cache = MessageBuffer()
        self.L1RequestFromL2Cache.out_port = ruby_system.network.in_port
        self.responseFromL2Cache = MessageBuffer()
        self.responseFromL2Cache.out_port = ruby_system.network.in_port

        self.GlobalRequestToL2Cache = MessageBuffer()
        self.GlobalRequestToL2Cache.in_port = ruby_system.network.out_port
        self.L1RequestToL2Cache = MessageBuffer()
        self.L1RequestToL2Cache.in_port = ruby_system.network.out_port
        self.responseToL2Cache = MessageBuffer()
        self.responseToL2Cache.in_port = ruby_system.network.out_port


class DirController(Directory_Controller):
    _version = 0

    @classmethod
    def versionCount(cls):
        cls._version += 1  # Use count for this particular type
        return cls._version - 1

    def __init__(self, ruby_system, ranges, mem_ctrl):
        """ranges are the memory ranges assigned to this controller."""
        super().__init__()
        self.version = self.versionCount()
        self.addr_ranges = ranges
        self.ruby_system = ruby_system
        self.directory = RubyDirectoryMemory()
        # Connect this directory to the memory side.
        # self.memory = mem_ctrls[0].port
        self.memory_out_port = mem_ctrl.port
        self.connectQueues(ruby_system)

    def connectQueues(self, ruby_system):
        self.requestToMemory = MessageBuffer()
        self.responseFromMemory = MessageBuffer()
        self.triggerQueue = MessageBuffer(ordered=True)

        self.responseFromDir = MessageBuffer()
        self.responseFromDir.out_port = ruby_system.network.in_port
        self.forwardFromDir = MessageBuffer()
        self.forwardFromDir.out_port = ruby_system.network.in_port

        self.requestToDir = MessageBuffer()
        self.requestToDir.in_port = ruby_system.network.out_port
        self.responseToDir = MessageBuffer()
        self.responseToDir.in_port = ruby_system.network.out_port

def make_l1_cache(system, ruby_system, cpu, cluster_id):
    return L1Cache(system, ruby_system, cpu, cluster_id)

def make_l2_cache(system, ruby_system):
    return L2Cache(system, ruby_system)

def make_dir(ruby_system, range, mem_ctrl):
    return DirController(ruby_system, [range], mem_ctrl)

def has_l2_cache() -> bool:
    return True