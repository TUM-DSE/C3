FROM ghcr.io/gem5/ubuntu-24.04_all-dependencies:v25-0 AS base

RUN apt -y update && apt -y install \
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
    g++-aarch64-linux-gnu \
    python3-pandas python3-numpy python3-matplotlib python3-seaborn \
    && rm -rf /var/lib/apt/lists/*

FROM base AS builder

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]
RUN git clone https://github.com/TUM-DSE/C3 /c3-artifact
RUN cd /c3-artifact && ./script/build-gem5.sh
RUN cd /c3-artifact && ./script/build-benchmark.sh all

FROM base

COPY --from=builder /c3-artifact/gem5 /c3-artifact/benchmarks /
