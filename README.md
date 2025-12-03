# C<sup>3</sup>: CXL Coherence Controllers for Heterogeneous Architectures

<!-- <p align="left">
    <a href="https://github.com/YOUR_USERNAME/C-3-Artifact/blob/main/LICENSE">
        <img alt="License" src="https://img.shields.io/badge/License-MIT-yellow.svg">
    </a>
</p> -->

Artifact for "C3: CXL Coherence Controllers for Heterogeneous Architectures", HPCA '26

This repository contains the models and workloads for evaluating CXL-based cache coherence protocols using the gem5 simulator. The evaluated protocols are:

- **MESI-MESI**: Baseline MESI protocol
- **MESI-CXL-MESI**
- **MESI-CXL-MOESI**
- **MESI-CXL-MESIF**

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Install Dependencies](#install-dependencies)
- [Repository Structure](#repository-structure)
- [Build gem5](#build-gem5)
- [Build Benchmarks](#build-benchmarks)
- [Run Experiments](#run-experiments)
  - [Figure 10: Execution Time Comparison](#figure-10-execution-time-comparison)
  - [Figure 11: Miss Latency Breakdown](#figure-11-miss-latency-breakdown)

---

## Prerequisites

* **OS**: Ubuntu 22.04 LTS
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
    libgettextpo-dev
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
│   ├── parsec-benchmark/    # PARSEC 3.0
│   ├── Splash-4/            # Splash-4
│   └── phoenix/             # Phoenix
├── script/                  # Build and run scripts
│   ├── build-gem5.sh        # Build gem5 with all protocols
│   ├── build-benchmark.sh   # Build all benchmarks
│   ├── create-conf.sh       # Generate experiment configurations
│   ├── run-fig10.sh         # Run Figure 10 experiments
│   ├── extract-stats.sh     # Extract statistics from results
│   └── plot_fig10.py        # Generate Figure 10 plot
├── setup/                   # Protocol setup scripts
└── data/                    # Output directory (created at runtime)
   
```

---

## Build gem5

First, build the gem5 simulator with all four cache coherence protocols:

```bash
cd C-3-Artifact
./script/build-gem5.sh
```

This builds gem5 for each protocol:
- `gem5/build/X86_MESI_unord/gem5.opt`
- `gem5/build/X86_MESI_unord_CXL/gem5.opt`
- `gem5/build/X86_MESI_CXL_MOESI/gem5.opt`
- `gem5/build/X86_MESI_CXL_MESIF/gem5.opt`

> **Tip**: To build a specific protocol only:
> ```bash
> ./script/build-gem5.sh MESI_unord
> ```

> **Tip**: To specify the number of parallel jobs:
> ```bash
> ./script/build-gem5.sh 8          # All protocols with 8 jobs
> ./script/build-gem5.sh MESI_unord 4   # Single protocol with 4 jobs
> ```

**Expected build time**: ~30-60 minutes (depending on CPU and parallelism).

---

## Build Benchmarks

Build all three benchmark suites:

```bash
./script/build-benchmark.sh all
```

Or build individual suites:

```bash
./script/build-benchmark.sh parsec   # PARSEC 3.0
./script/build-benchmark.sh splash   # Splash-4
./script/build-benchmark.sh phoenix  # Phoenix
```

The script automatically:
1. Builds each benchmark with the appropriate configuration
2. Extracts input files to the correct directories

**Expected build time**: ~10-20 minutes

---

## Run Experiments

### Figure 10: Execution Time Comparison

Figure 10 compares execution time across all protocols for PARSEC, Splash-4, and Phoenix benchmarks.

**Step 1**: Generate configuration files:

```bash
./script/create-conf.sh
```

**Step 2**: Run experiments:

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

### Figure 11: Miss Latency Breakdown

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

>>>>>>> aebcaad0 (added README)
