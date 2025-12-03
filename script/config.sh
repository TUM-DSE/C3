#!/bin/bash

# Simulation Configuration
# ------------------------

# Protocols to test
PROTOCOLS=(
    # "MSI_unord"
    # "MESI_unord"
    # "nicolo-MESI_unord"
    "MOESI_CMP_directory_edit"
    # "MESI_unord_CXL"
    # "MSI_unord_CXL"
    # "MOESI_unord_CXL"
    # "MESI_unord_two_level_synth"
    # "MESI_unord_three_level_synth"
    "MOESI_unord_two_level_synth"
)

# Paths to gem5 for each protocol
PATHS=(
    # "/gem5/build/X86_MSI_unord/gem5.opt"
    # "/gem5/build/X86_nicolo-MESI_unord/gem5.opt"
    "/gem5/build/X86_MESI_unord/gem5.opt"
    "/gem5/build/X86_MOESI_CMP_directory_edit/gem5.opt"
    # "/gem5/build/X86_MESI_unord_CXL/gem5.opt"
    # "/gem5/build/X86_MSI_unord_CXL/gem5.opt"
    # "/gem5/build/X86_MOESI_unord_CXL/gem5.opt"
    # "/gem5/build/X86_MESI_two_level_synth/gem5.opt"
    # "/gem5/build/X86_MESI_three_level_synth/gem5.opt"
    "/gem5/build/X86_MOESI_two_level_synth/gem5.opt"


)

# Latency values to test
LATENCIES=(
    # "140"
    "10"
)

# Number of processors for PHOENIX
PROCESSORS=8

# Benchmark flags (true/false)
RUN_SPLASH=false
RUN_PHOENIX=true
RUN_PARSEC=false