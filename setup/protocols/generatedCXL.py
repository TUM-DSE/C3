from m5.objects import *
import math




class L1Cache(L1Cache_Controller):
    _version = 0

    @classmethod
    def versionCount(cls):
        cls._version += 1  # Use count for this particular type
        return cls._version - 1

    def dcache(self):
        return self.cache


    def __init__(self, system, ruby_system, cpu, cluster_id):
        """CPUs are needed to grab the clock domain and system is needed for
        the cache block size.
        """
        super().__init__()

        self.version = self.versionCount()
        self.cache = RubyCache(
            size="128kB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=False
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


        self.fwdTo = MessageBuffer(ordered=True)
        self.fwdTo.in_port = ruby_system.network.out_port

        self.fwdFrom = MessageBuffer(ordered=True)
        self.fwdFrom.out_port = ruby_system.network.in_port

        self.respTo = MessageBuffer(ordered=True)
        self.respTo.in_port = ruby_system.network.out_port

        self.respFrom = MessageBuffer(ordered=True)
        self.respFrom.out_port = ruby_system.network.in_port

        self.reqTo = MessageBuffer(ordered=True)
        self.reqTo.in_port = ruby_system.network.out_port

        self.reqFrom = MessageBuffer(ordered=True)
        self.reqFrom.out_port = ruby_system.network.in_port


class L0Cache(L0Cache_Controller):
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
        self.cache = RubyCache(
            size="4MB", assoc=8, start_index_bit=self.getBlockSizeBits(system), is_icache=False
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

        self.bisnpTo = MessageBuffer(ordered=True)
        self.bisnpTo.in_port = ruby_system.network.out_port
        self.bisnpFrom = MessageBuffer(ordered=True)
        self.bisnpFrom.out_port = ruby_system.network.in_port
        self.birspTo = MessageBuffer(ordered=True)
        self.birspTo.in_port = ruby_system.network.out_port
        self.birspFrom = MessageBuffer(ordered=True)
        self.birspFrom.out_port = ruby_system.network.in_port


        self.ndrTo = MessageBuffer(ordered=True)
        self.ndrTo.in_port = ruby_system.network.out_port
        self.ndrFrom = MessageBuffer(ordered=True)
        self.ndrFrom.out_port = ruby_system.network.in_port
        self.drsTo = MessageBuffer(ordered=True)
        self.drsTo.in_port = ruby_system.network.out_port
        self.drsFrom = MessageBuffer(ordered=True)
        self.drsFrom.out_port = ruby_system.network.in_port

        self.req2To = MessageBuffer(ordered=True)
        self.req2To.in_port = ruby_system.network.out_port
        self.req2From = MessageBuffer(ordered=True)
        self.req2From.out_port = ruby_system.network.in_port
        self.rwdTo = MessageBuffer(ordered=True)
        self.rwdTo.in_port = ruby_system.network.out_port
        self.rwdFrom = MessageBuffer(ordered=True)
        self.rwdFrom.out_port = ruby_system.network.in_port

        self.fwdTo = MessageBuffer(ordered=True)
        self.fwdTo.in_port = ruby_system.network.out_port

        self.fwdFrom = MessageBuffer(ordered=True)
        self.fwdFrom.out_port = ruby_system.network.in_port

        self.respTo = MessageBuffer(ordered=True)
        self.respTo.in_port = ruby_system.network.out_port

        self.respFrom = MessageBuffer(ordered=True)
        self.respFrom.out_port = ruby_system.network.in_port

        self.reqTo = MessageBuffer(ordered=True)
        self.reqTo.in_port = ruby_system.network.out_port

        self.reqFrom = MessageBuffer(ordered=True)
        self.reqFrom.out_port = ruby_system.network.in_port

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

        self.fwdTo = MessageBuffer(ordered=True)
        self.fwdTo.in_port = ruby_system.network.out_port

        self.fwdFrom = MessageBuffer(ordered=True)
        self.fwdFrom.out_port = ruby_system.network.in_port

        self.respTo = MessageBuffer(ordered=True)
        self.respTo.in_port = ruby_system.network.out_port

        self.respFrom = MessageBuffer(ordered=True)
        self.respFrom.out_port = ruby_system.network.in_port

        self.reqTo = MessageBuffer(ordered=True)
        self.reqTo.in_port = ruby_system.network.out_port

        self.reqFrom = MessageBuffer(ordered=True)
        self.reqFrom.out_port = ruby_system.network.in_port

        self.bisnpTo = MessageBuffer(ordered=True)
        self.bisnpTo.in_port = ruby_system.network.out_port
        self.bisnpFrom = MessageBuffer(ordered=True)
        self.bisnpFrom.out_port = ruby_system.network.in_port
        self.birspTo = MessageBuffer(ordered=True)
        self.birspTo.in_port = ruby_system.network.out_port
        self.birspFrom = MessageBuffer(ordered=True)
        self.birspFrom.out_port = ruby_system.network.in_port


        self.ndrTo = MessageBuffer(ordered=True)
        self.ndrTo.in_port = ruby_system.network.out_port
        self.ndrFrom = MessageBuffer(ordered=True)
        self.ndrFrom.out_port = ruby_system.network.in_port
        self.drsTo = MessageBuffer(ordered=True)
        self.drsTo.in_port = ruby_system.network.out_port
        self.drsFrom = MessageBuffer(ordered=True)
        self.drsFrom.out_port = ruby_system.network.in_port

        self.req2To = MessageBuffer(ordered=True)
        self.req2To.in_port = ruby_system.network.out_port
        self.req2From = MessageBuffer(ordered=True)
        self.req2From.out_port = ruby_system.network.in_port
        self.rwdTo = MessageBuffer(ordered=True)
        self.rwdTo.in_port = ruby_system.network.out_port
        self.rwdFrom = MessageBuffer(ordered=True)
        self.rwdFrom.out_port = ruby_system.network.in_port

def make_l1_cache(system, ruby_system, cpu, cluster_id):
    return L1Cache(system, ruby_system, cpu, cluster_id)

def make_l2_cache(system, ruby_system):
    return L0Cache(system, ruby_system)

def make_dir(ruby_system, range, mem_ctrl):
    return DirController(ruby_system, [range], mem_ctrl)

def has_l2_cache() -> bool:
    return True