FROM ghcr.io/gem5/ubuntu-24.04_all-dependencies:v25-0

RUN apt -y update && apt -y upgrade && apt -y install \
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

RUN apt -y update && apt -y upgrade && apt -y install \
    python3-pandas python3-numpy python3-matplotlib python3-seaborn
