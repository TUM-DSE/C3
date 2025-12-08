# C<sup>3</sup>: CXL Coherence Controllers for Heterogeneous Architectures

<!-- <p align="left">
    <a href="https://github.com/YOUR_USERNAME/C-3-Artifact/blob/main/LICENSE">
        <img alt="License" src="https://img.shields.io/badge/License-MIT-yellow.svg">
    </a>
</p> -->

Artifact for "C3: CXL Coherence Controllers for Heterogeneous Architectures", HPCA '26

This repository contains the models and workloads for evaluating CXL-based cache coherence protocols using the gem5 simulator. The evaluated protocols are:

- **MESI-MESI-MESI**: Baseline MESI protocol
- **MESI-CXL-MESI**: Two MESI cluster connected through CXL coherence
- **MESI-CXL-MOESI**: MESI & MOESI clusters connected through CXL coherence
- **MESI-CXL-MESIF**: MESI & MESIF clusters connected through CXL coherence

---

## Table of Contents

- [Quick Start](#Quick-Start)
- [Prerequisites](#prerequisites)
- [Install Dependencies](#install-dependencies)
- [Repository Structure](#repository-structure)
- [Build gem5](#build-gem5)
- [Build Benchmarks](#build-benchmarks)
- [Functional Validation](#functional-validation)
- [Generate Workload Configurations](#generate-workload-configurations)
- [Run Experiments](#run-experiments)
  - [Figure 9: ARM Heterogeneous MCM](#figure-9-arm-heterogeneous-mcm)
  - [Figure 10: Execution Time Comparison](#figure-10-execution-time-comparison)
  - [Figure 11: Miss Latency Breakdown](#figure-11-miss-latency-breakdown)
  - [Litmus Tests](#litmus-tests)

---

## Quick Start

For simplicity, we provide Docker images:

- **Option 1: [Prebuilt](https://hub.docker.com/r/gingerbreadz/c3-artifact-prebuilt) image**:

```bash
$ just docker-prebuilt
```

Ready to run experiments -- includes pre-compiled gem5 models for C3 and pre-compiled workloads.

Then follow from: [Functional Validation](#functional-validation)

- **Option 2: [Base](https://hub.docker.com/r/gingerbreadz/c3-artifact-base) image**:

```bash
$ just docker-base
```

Ready to compile gem5 models and the workloads -- includes system dependencies.

Then follow from: [Build gem5](#build-gem5)

- **Option 3: Manual set-up**

Follow the next steps to manually set up the environment

---

## Prerequisites

* **OS**: Ubuntu 22.04 LTS or 24.04 LTS
* **Compiler**: GCC 11.4.0
* **Python**: 3.10+
* **SCons**: 4.0+

---

## Install Dependencies

### System Dependencies

```bash
sudo apt-get update && sudo apt-get install -y \
    build-essential \
    cmake \
    g++ \
    git \
    python3 \
    python3-pip \
    python3-venv \
    scons \
    zlib1g-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libgoogle-perftools-dev \
    libboost-all-dev \
    libhdf5-serial-dev \
    libpng-dev \
    libjemalloc-dev \
    pkg-config \
    wget \
    m4 \
    libtbb-dev \
    gettext \
    libgettextpo-dev \
    libglw1-mesa-dev \
    libxext-dev \
    libx11-dev \
    libxmu-dev \
    libglut-dev \
    libxi-dev \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu
```

### Python Dependencies (for plotting)

```bash
pip3 install pandas numpy matplotlib seaborn
```

---

## Repository Structure

```
C-3-Artifact/
├── gem5/                    # gem5 simulator source
├── slicc/                   # SLICC protocol definitions
├── benchmarks/              # Benchmark suites
│   ├── parsec-benchmark/    # PARSEC 3.0 (X86)
│   ├── Splash-4/            # Splash-4 (X86)
│   ├── phoenix/             # Phoenix (X86)
│   ├── parsec-benchmark-arm/# PARSEC 3.0 (ARM)
│   ├── Splash-4-arm/        # Splash-4 (ARM)
│   └── phoenix-arm/         # Phoenix (ARM)
├── script/                  # Build and run scripts
│   ├── build-gem5.sh            # Build gem5 for X86 and ARM
│   ├── build-benchmark.sh       # Build all benchmarks (X86 + ARM)
│   ├── build-benchmark-x86.sh   # Build X86 benchmarks only
│   ├── build-benchmark-arm.sh   # Build ARM benchmarks only
│   ├── run-functional.sh        # Functional validation
│   ├── create-configurations.sh # Generate all configurations
│   ├── create-conf-x86.sh       # Generate X86 configurations
│   ├── create-conf-arm.sh       # Generate ARM configurations
│   ├── create-conf-litmus.sh    # Generate Litmus configurations
│   ├── run-all-fig.sh           # Run all experiments (Fig 9, 10, 11)
│   ├── run-fig9.sh              # Run Figure 9 experiments (ARM MCM)
│   ├── run-fig10.sh             # Run Figure 10 experiments (X86)
│   ├── run-fig11.sh             # Run Figure 11 experiments
│   ├── run-litmus.sh            # Run ARM litmus tests
│   ├── extract-stats.sh         # Extract X86 statistics
│   ├── extract-stats-arm.sh     # Extract ARM statistics
│   ├── plot_fig9.py             # Generate Figure 9 plot
│   ├── plot_fig10.py            # Generate Figure 10 plot
│   └── plot_fig11.py            # Generate Figure 11 plot
├── setup/                   # Protocol setup scripts
└── data/                    # Output directory (created at runtime)
```

---

## Build gem5

Build the gem5 simulator with all cache coherence protocols for both X86 and ARM architectures:

```bash
./script/build-gem5.sh
```

This builds gem5 for each protocol and architecture:

**X86 builds:**
- `gem5/build/X86_MESI_unord/gem5.opt`
- `gem5/build/X86_MESI_unord_CXL/gem5.opt`
- `gem5/build/X86_MESI_CXL_MOESI/gem5.opt`
- `gem5/build/X86_MESI_CXL_MESIF/gem5.opt`

**ARM builds:**
- `gem5/build/ARM_MESI_unord/gem5.opt`
- `gem5/build/ARM_MESI_unord_CXL/gem5.opt`
- `gem5/build/ARM_MESI_CXL_MOESI/gem5.opt`
- `gem5/build/ARM_MESI_CXL_MESIF/gem5.opt`


**Expected build time**: ~30-60 minutes per architecture (depending on CPU and parallelism).

---

## Build Benchmarks

Build all three benchmark suites (PARSEC, SPLASH-4, Phoenix) for both X86 and ARM:

```bash
./script/build-benchmark.sh
```

This script internally calls both `build-benchmark-x86.sh` and `build-benchmark-arm.sh`.

To build for a specific architecture only:

```bash
./script/build-benchmark-x86.sh   # Build X86 benchmarks only
./script/build-benchmark-arm.sh   # Build ARM benchmarks only
```

**Expected build time**: ~10-20 minutes per architecture

---

## Functional Validation (Optional)

Before running the full experiments, you can validate that gem5 and benchmarks are working correctly:

```bash
./script/run-functional.sh x86    # Validate X86 (Figure 10 protocols)
./script/run-functional.sh arm    # Validate ARM (Figure 9 protocols)
./script/run-functional.sh all    # Validate both X86 and ARM
```

This runs a deterministic benchmark (kmeans) and compares the simulated output against native execution.

---

## Generate Workload Configurations

Before running experiments, generate the configuration files that define each simulation:

```bash
./script/create-configurations.sh
```

This generates all configuration files at once. Alternatively, generate them individually:

```bash
./script/create-conf-x86.sh       # Generate X86 configurations (for Figure 10)
./script/create-conf-arm.sh       # Generate ARM configurations (for Figure 9)
./script/create-conf-litmus.sh    # Generate Litmus test configurations
```

**Generated files:**
- `benchmarks/configuration/commands.conf` - X86 experiment commands
- `benchmarks/configuration/commands-arm.conf` - ARM experiment commands
- `benchmarks/configuration/commands-litmus.conf` - Litmus test commands

---

## Run Experiments

### Run All Figures

To run all experiments at once (Figure 9, 10, 11):

```bash
./script/run-all-fig.sh
```

This runs `run-fig9.sh`, `run-fig10.sh`, and `run-fig11.sh` sequentially.

### Run Individual Figures

#### Figure 9: ARM Heterogeneous MCM

Figure 9 evaluates heterogeneous memory consistency models (MCM) on ARM architecture, comparing three configurations:

- **ARM-ARM**: Both clusters use ARM relaxed memory model
- **ARM-TSO**: One cluster uses ARM, another uses TSO-enforced
- **TSO-TSO**: Both clusters use TSO-enforced memory model

```bash
./script/run-fig9.sh
```

**Filtering options**:
```bash
./script/run-fig9.sh splash                    # Run Splash-4 only
./script/run-fig9.sh splash barnes             # Run single application
./script/run-fig9.sh splash barnes arm_arm     # Run specific MCM config
```

**Output**:
```
data/fig_9/
├── gem5.output/           # Raw simulation outputs
│   └── {suite}/{app}/{protocol}/{mcm}/
├── summary/               # Extracted statistics (CSV)
└── plot/
    └── fig9_arm_mcm.pdf
```

**Manual plot regeneration**:
```bash
./script/extract-stats-arm.sh
python3 ./script/plot_fig9.py
```

---

#### Figure 10: Execution Time Comparison

Figure 10 compares execution time across all protocols for PARSEC, Splash-4, and Phoenix benchmarks.

```bash
./script/run-fig10.sh
```

The script runs all experiments in parallel, showing progress every 30 seconds. Upon completion, it automatically extracts statistics and generates the plot.

**Filtering options**:
```bash
./script/run-fig10.sh parsec                          # Run PARSEC only
./script/run-fig10.sh parsec blackscholes             # Run single application
./script/run-fig10.sh parsec blackscholes MESI_unord  # Run specific configuration
```



**Output**:
```
data/fig_10/
├── gem5.output/           # Raw simulation outputs
│   ├── parsec/
│   │   ├── blackscholes/
│   │   │   ├── MESI_unord/
│   │   │   ├── MESI_unord_CXL/
│   │   │   ├── MESI_CXL_MOESI/
│   │   │   └── MESI_CXL_MESIF/
│   │   └── ...
│   ├── splash/
│   └── phoenix/
├── summary/               # Extracted statistics (CSV)
│   ├── MESI_unord/
│   │   ├── parsec.csv
│   │   ├── splash.csv
│   │   └── phoenix.csv
│   └── ...
└── plot/
    └── fig10_execution_time.pdf
```

**Manual plot regeneration**:
```bash
./script/extract-stats.sh
python3 ./script/plot_fig10.py
```

---

#### Figure 11: Miss Latency Breakdown

Figure 11 shows the miss latency breakdown for 4 representative applications (Barnes, LU-Ncont, Histogram, Vips).

> **Note**: Figure 11 uses the same simulation data from Figure 10. Run Figure 10 experiments first.

**Generate the plot**:
```bash
./script/run-fig11.sh
```

**Output**:
```
data/fig_11/
└── plot/
    └── fig11_miss_latency.pdf
```

---

### Litmus Tests

Litmus tests validate the correctness of memory consistency model implementations on ARM.

```bash
./script/run-litmus.sh
```

**Run a specific test**:

```bash
./script/run-litmus.sh IRIW_atomic
./script/run-litmus.sh MP_dmb.sys
./script/run-litmus.sh SB_dmb.sy_po
```

**List available tests**:

```bash
./script/run-litmus.sh --list
```

**Output**:
```
data/litmus/
├── gem5.output/           # Raw simulation outputs per test
│   ├── IRIW_atomic/
│   ├── MP_dmb.sys/
│   └── ...
└── logs/                  # Execution logs
    ├── IRIW_atomic.log
    └── ...
```

---
