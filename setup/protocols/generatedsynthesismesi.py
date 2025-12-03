from m5.objects import *
import math




class L1Cache(L1Cache_Controller):
    _version = 0

    @classmethod
    def versionCount(cls):
        cls._version += 1  # Use count for this particular type
        return cls._version - 1

    def dcache(self):
        return self.L1Dcache


    def __init__(self, system, ruby_system, cpu, cluster_id):
        """CPUs are needed to grab the clock domain and system is needed for
        the cache block size.
        """
        super().__init__()
        

        self.version = self.versionCount()
        self.L1Dcache = RubyCache(
            size="16kB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=False
        )
        self.L1Icache = RubyCache(
            size="32kB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=True
        )
        self.l2_select_num_bits = int(math.log(1, 2))
        # self.block_size_bits = int(math.log(options.cacheline_size, 2))

        self.clk_domain = cpu.clk_domain
        self.send_evictions = self.sendEvicts(cpu)
        self.ruby_system = ruby_system
        self.enable_prefetch = False
        self.prefetcher = RubyPrefetcher()
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
        self.requestFromL1Cache = MessageBuffer()
        self.requestFromL1Cache.out_port = ruby_system.network.in_port
        self.responseFromL1Cache = MessageBuffer()
        self.responseFromL1Cache.out_port = ruby_system.network.in_port
        self.unblockFromL1Cache = MessageBuffer()
        self.unblockFromL1Cache.out_port = ruby_system.network.in_port

        self.optionalQueue = MessageBuffer()

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
            size="512kB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=False
        )
        self.ruby_system = ruby_system
        self.connectQueues(ruby_system)

    def getBlockSizeBits(self, system):
        bits = int(math.log(system.cache_line_size, 2))
        if 2**bits != system.cache_line_size.value:
            panic("Cache line size not a power of 2!")
        return bits

    def connectQueues(self, ruby_system):
        """Connect all of the queues for this controller."""
        
        self.DirRequestFromL2Cache = MessageBuffer()
        self.DirRequestFromL2Cache.out_port = ruby_system.network.in_port
        self.L1RequestFromL2Cache = MessageBuffer()
        self.L1RequestFromL2Cache.out_port = ruby_system.network.in_port
        self.responseFromL2Cache = MessageBuffer()
        self.responseFromL2Cache.out_port = ruby_system.network.in_port

        self.unblockToL2Cache = MessageBuffer()
        self.unblockToL2Cache.in_port = ruby_system.network.out_port
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
        self.requestToDir = MessageBuffer()
        self.requestToDir.in_port = ruby_system.network.out_port
        self.responseToDir = MessageBuffer()
        self.responseToDir.in_port = ruby_system.network.out_port
        self.responseFromDir = MessageBuffer()
        self.responseFromDir.out_port = ruby_system.network.in_port
        self.requestToMemory = MessageBuffer()
        self.responseFromMemory = MessageBuffer()

def make_l1_cache(system, ruby_system, cpu, cluster_id):
    return L1Cache(system, ruby_system, cpu, 0)

def make_l2_cache(system, ruby_system):
    return L2Cache(system, ruby_system)

def make_dir(ruby_system, range, mem_ctrl):
    return DirController(ruby_system, [range], mem_ctrl)

def has_l2_cache() -> bool:
    return True