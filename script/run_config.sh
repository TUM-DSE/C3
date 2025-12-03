#!/bin/bash

# Simulation Configuration
# ------------------------

# Protocols to test
PROTOCOLS=(
    "MESI_unord_CXL"
    # "MESI_CXL_MOESI"
    # "MESI_CXL_MESIF"
    "MESI_unord"
)

# Paths to gem5 for each protocol
PATHS=(
    "/gem5/build/X86_MESI_unord_CXL/gem5.opt"
    # /gem5/build/X86_MESI_CXL_MOESI/gem5.opt
    # /gem5/build/X86_MESI_CXL_MESIF/gem5.opt
    "/gem5/build/X86_MESI_unord/gem5.opt"

)

# Latency values to test
LATENCIES=(
    "140"
    # "10"
)

# Number of processors for PHOENIX
PROCESSORS=8

# Benchmark flags (true/false)
RUN_SPLASH=true
RUN_PHOENIX=true
RUN_PARSEC=true