#!/usr/bin/env bash
#
# build-benchmark-arm.sh - Build ARM benchmarks for cross-compilation
#
# This script builds PARSEC, SPLASH-4, and Phoenix benchmarks for ARM (aarch64)
# architecture using cross-compilation. Requires aarch64-linux-gnu-gcc toolchain.
#
# Usage: ./script/build-benchmark-arm.sh [parsec|splash|phoenix|all]
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BENCHMARKS_DIR="${REPO_ROOT}/benchmarks"

JOBS="${JOBS:-$(nproc)}"

# Check for ARM cross-compiler
check_arm_toolchain() {
    if ! command -v aarch64-linux-gnu-gcc &> /dev/null; then
        echo "ERROR: aarch64-linux-gnu-gcc not found!"
        echo "Please install the ARM cross-compiler:"
        echo "  Ubuntu/Debian: sudo apt-get install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu"
        exit 1
    fi
    echo "ARM toolchain: $(aarch64-linux-gnu-gcc --version | head -1)"
}

fix_permissions() {
    local dir="$1"
    find "${dir}" -type f -exec sh -c 'head -1 "$1" 2>/dev/null | grep -q "^#!" && chmod +x "$1"' _ {} \; 2>/dev/null || true
}

build_parsec_arm() {
    local PAR_DIR="${BENCHMARKS_DIR}/parsec-benchmark-arm"
    
    # Only the apps we need for the experiments (from results)
    local PARSEC_APPS=(
        "blackscholes"
        "bodytrack"
        "canneal"
        "facesim"
        "ferret"
        "fluidanimate"
        "freqmine"
        "streamcluster"
        "swaptions"
    )
    
    echo "==> Building PARSEC for ARM..."
    fix_permissions "${PAR_DIR}"
    chmod +x "${PAR_DIR}/bin/"* 2>/dev/null || true
    
    cd "${PAR_DIR}"
    export PARSECDIR="${PAR_DIR}"
    export PATH="${PAR_DIR}/bin:${PATH}"
    
    # Build dependencies first (for ferret)
    echo "    Building dependencies (gsl, libjpeg)..."
    parsecmgmt -a build -p gsl -c gcc || true
    parsecmgmt -a build -p libjpeg -c gcc || true
    
    # Build the apps
    for app in "${PARSEC_APPS[@]}"; do
        echo "    Building ${app}..."
        # freqmine uses openmp by default
        if [[ "$app" == "freqmine" ]]; then
            parsecmgmt -a build -p "${app}" -c gcc-openmp || echo "Warning: ${app} build may have issues"
        else
            parsecmgmt -a build -p "${app}" -c gcc-pthreads || echo "Warning: ${app} build may have issues"
        fi
    done
    
    echo "==> Extracting PARSEC ARM inputs..."
    extract_parsec_inputs_arm
    
    echo "==> PARSEC ARM build complete"
    
    # Verify binaries are ARM
    echo "==> Verifying ARM binaries..."
    for app in "${PARSEC_APPS[@]}"; do
        local bin_path
        if [[ -f "${PAR_DIR}/pkgs/apps/${app}/inst/amd64-linux.gcc/bin/${app}" ]]; then
            bin_path="${PAR_DIR}/pkgs/apps/${app}/inst/amd64-linux.gcc/bin/${app}"
        elif [[ -f "${PAR_DIR}/pkgs/kernels/${app}/inst/amd64-linux.gcc/bin/${app}" ]]; then
            bin_path="${PAR_DIR}/pkgs/kernels/${app}/inst/amd64-linux.gcc/bin/${app}"
        fi
        
        if [[ -n "$bin_path" && -f "$bin_path" ]]; then
            # Use readelf instead of file command (more reliable in cross-compile environments)
            if aarch64-linux-gnu-readelf -h "$bin_path" 2>/dev/null | grep -q "AArch64"; then
                echo "    ✓ ${app}: ARM binary"
            else
                echo "    ✗ ${app}: NOT ARM binary!"
            fi
        else
            echo "    ⚠ ${app}: binary not found"
        fi
    done
}

extract_parsec_inputs_arm() {
    local PAR_DIR="${BENCHMARKS_DIR}/parsec-benchmark-arm"
    local INPUT_SIZE="${PARSEC_INPUT_SIZE:-test}"
    
    echo "    Using input size: ${INPUT_SIZE}"
    
    for pkg_type in apps kernels; do
        for app_dir in "${PAR_DIR}/pkgs/${pkg_type}/"*/; do
            [[ -d "$app_dir" ]] || continue
            
            local app_name=$(basename "$app_dir")
            local input_dir="${app_dir}inputs"
            local bin_dir="${app_dir}inst/amd64-linux.gcc/bin"
            local run_dir="${app_dir}inst/amd64-linux.gcc/run"
            
            [[ -d "$input_dir" ]] || continue
            
            local input_tar="${input_dir}/input_${INPUT_SIZE}.tar"
            [[ -f "$input_tar" ]] || continue
            
            mkdir -p "$run_dir"
            echo "    Extracting ${app_name} (${INPUT_SIZE})..."
            tar -xf "$input_tar" -C "$run_dir"
            
            if [[ -d "$bin_dir" ]]; then
                tar -xf "$input_tar" -C "$bin_dir"
            fi
        done
    done
}

build_splash_arm() {
    local SPLASH_DIR="${BENCHMARKS_DIR}/Splash-4-arm/Splash-4"
    
    echo "==> Building SPLASH-4 for ARM..."
    fix_permissions "${SPLASH_DIR}"
    fix_permissions "${BENCHMARKS_DIR}/Splash-4-arm"
    
    cd "${SPLASH_DIR}"
    
    # Clean first to avoid mixed object files (but keep pre-compiled libraries)
    make clean 2>/dev/null || true
    
    # Check if pre-compiled ARM libraries exist, if not warn
    # libtiff should have g3states.h and libtiff.a pre-compiled
    if [[ ! -f "${SPLASH_DIR}/volrend/libtiff/libtiff.a" ]] || \
       [[ ! -f "${SPLASH_DIR}/volrend/libtiff/g3states.h" ]]; then
        echo "    WARNING: volrend/libtiff not pre-compiled. volrend may fail."
        echo "    Copy pre-compiled libtiff.a and g3states.h from a working ARM build."
    fi
    
    if [[ ! -f "${SPLASH_DIR}/volrend-no_print_lock/libtiff/libtiff.a" ]] || \
       [[ ! -f "${SPLASH_DIR}/volrend-no_print_lock/libtiff/g3states.h" ]]; then
        echo "    WARNING: volrend-no_print_lock/libtiff not pre-compiled."
    fi
    
    # glib and glibps are simple and will be built correctly by make
    
    # Now build the main benchmarks
    echo "    Building main benchmarks..."
    make -j "${JOBS}"
    
    echo "==> Verifying SPLASH-4 ARM binaries..."
    for app in barnes cholesky fft fmm lu-contiguous_blocks lu-non_contiguous_blocks \
               ocean-contiguous_partitions ocean-non_contiguous_partitions radix \
               radiosity raytrace volrend volrend-no_print_lock water-nsquared water-spatial; do
        local bin_name
        case "$app" in
            lu-contiguous_blocks) bin_name="LU-CONT" ;;
            lu-non_contiguous_blocks) bin_name="LU-NOCONT" ;;
            ocean-contiguous_partitions) bin_name="OCEAN-CONT" ;;
            ocean-non_contiguous_partitions) bin_name="OCEAN-NOCONT" ;;
            volrend-no_print_lock) bin_name="VOLREND-NPL" ;;
            *) bin_name=$(echo "$app" | tr '[:lower:]' '[:upper:]') ;;
        esac
        
        if [[ -f "${SPLASH_DIR}/${app}/${bin_name}" ]]; then
            # Use readelf instead of file command (more reliable in cross-compile environments)
            if aarch64-linux-gnu-readelf -h "${SPLASH_DIR}/${app}/${bin_name}" 2>/dev/null | grep -q "AArch64"; then
                echo "    ✓ ${app}: ARM binary"
            else
                echo "    ✗ ${app}: NOT ARM binary!"
            fi
        else
            echo "    ⚠ ${app}: binary not found"
        fi
    done
    
    echo "==> SPLASH-4 ARM build complete"
}

build_phoenix_arm() {
    local PHOENIX_DIR="${BENCHMARKS_DIR}/phoenix-arm/phoenix-2.0"
    
    echo "==> Building PHOENIX for ARM..."
    fix_permissions "${PHOENIX_DIR}"
    
    # Clean first
    cd "${PHOENIX_DIR}/src"
    make clean 2>/dev/null || true
    cd "${PHOENIX_DIR}/tests"
    make clean 2>/dev/null || true
    
    # Build library
    cd "${PHOENIX_DIR}/src"
    make -j "${JOBS}"
    
    # Build tests
    cd "${PHOENIX_DIR}/tests"
    make -j "${JOBS}"
    
    echo "==> Verifying PHOENIX ARM binaries..."
    for app in histogram kmeans linear_regression matrix_multiply pca string_match word_count; do
        if [[ -f "${PHOENIX_DIR}/tests/${app}/${app}" ]]; then
            # Use readelf instead of file command (more reliable in cross-compile environments)
            if aarch64-linux-gnu-readelf -h "${PHOENIX_DIR}/tests/${app}/${app}" 2>/dev/null | grep -q "AArch64"; then
                echo "    ✓ ${app}: ARM binary"
            else
                echo "    ✗ ${app}: NOT ARM binary!"
            fi
        else
            echo "    ⚠ ${app}: binary not found"
        fi
    done
    
    echo "==> PHOENIX ARM build complete"
}

# Main
echo "=============================================="
echo "Building ARM Benchmarks (aarch64)"
echo "=============================================="

check_arm_toolchain

case "${1:-all}" in
    parsec)  build_parsec_arm ;;
    splash)  build_splash_arm ;;
    phoenix) build_phoenix_arm ;;
    all)     build_parsec_arm; build_splash_arm; build_phoenix_arm ;;
    *)       echo "Usage: $0 [parsec|splash|phoenix|all]"; exit 1 ;;
esac

echo ""
echo "=============================================="
echo "ARM benchmark build complete!"
echo "=============================================="
