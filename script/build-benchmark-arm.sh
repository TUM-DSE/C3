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

    # Check if inputs need to be downloaded
    # We check for the downloaded tar.gz file which is the source of all inputs
    local input_archive="${PAR_DIR}/parsec-3.0-input-sim.tar.gz"
    local need_download=false
    
    if [[ ! -f "${input_archive}" ]]; then
        echo "    Input archive not found: ${input_archive}"
        need_download=true
    else
        # Verify all apps have their input_test.tar extracted
        for app in "${PARSEC_APPS[@]}"; do
            local app_input=""
            # Check in apps/ first, then kernels/
            if [[ -d "${PAR_DIR}/pkgs/apps/${app}" ]]; then
                app_input="${PAR_DIR}/pkgs/apps/${app}/inputs/input_test.tar"
            elif [[ -d "${PAR_DIR}/pkgs/kernels/${app}" ]]; then
                app_input="${PAR_DIR}/pkgs/kernels/${app}/inputs/input_test.tar"
            fi
            
            if [[ -n "${app_input}" && ! -f "${app_input}" ]]; then
                echo "    Missing input for ${app}: ${app_input}"
                need_download=true
                break
            fi
        done
    fi
    
    if [[ "${need_download}" == "true" ]]; then
        echo "    Downloading and extracting PARSEC inputs..."
        chmod +x "${PAR_DIR}/get-inputs" 2>/dev/null || true
        "${PAR_DIR}/get-inputs" "${PAR_DIR}" "${PAR_DIR}"
        
        # Verify download succeeded - check archive exists
        if [[ ! -f "${input_archive}" ]]; then
            echo "ERROR: Failed to download PARSEC inputs."
            echo "Expected file: ${input_archive}"
            echo "Please check network connection or download manually from:"
            echo "  https://github.com/cirosantilli/parsec-benchmark/releases/download/3.0/parsec-3.0-input-sim.tar.gz"
            exit 1
        fi
        
        # Verify all apps now have inputs
        local missing_inputs=()
        for app in "${PARSEC_APPS[@]}"; do
            local app_input=""
            if [[ -d "${PAR_DIR}/pkgs/apps/${app}" ]]; then
                app_input="${PAR_DIR}/pkgs/apps/${app}/inputs/input_test.tar"
            elif [[ -d "${PAR_DIR}/pkgs/kernels/${app}" ]]; then
                app_input="${PAR_DIR}/pkgs/kernels/${app}/inputs/input_test.tar"
            fi
            
            if [[ -n "${app_input}" && ! -f "${app_input}" ]]; then
                missing_inputs+=("${app}")
            fi
        done
        
        if [[ ${#missing_inputs[@]} -gt 0 ]]; then
            echo "ERROR: Missing inputs for: ${missing_inputs[*]}"
            echo "The input archive may be corrupted or incomplete."
            exit 1
        fi
    fi
    
    echo "    All PARSEC ARM inputs verified."
    
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
    
    cd "${REPO_ROOT}"
    echo "==> PARSEC ARM build complete"
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
            
            [[ -d "$input_dir" ]] || continue
            
            local input_tar="${input_dir}/input_${INPUT_SIZE}.tar"
            [[ -f "$input_tar" ]] || continue
            
            # For ARM, binaries are in gcc-pthreads or gcc-openmp (for freqmine)
            # We need to extract inputs to ALL possible bin directories
            local extracted=0
            for build_config in amd64-linux.gcc-pthreads amd64-linux.gcc-openmp amd64-linux.gcc; do
                local bin_dir="${app_dir}inst/${build_config}/bin"
                local run_dir="${app_dir}inst/${build_config}/run"
                
                if [[ -d "$bin_dir" ]]; then
                    echo "    Extracting ${app_name} (${INPUT_SIZE}) to ${build_config}..."
                    mkdir -p "$run_dir"
                    tar -xf "$input_tar" -C "$run_dir"
                    tar -xf "$input_tar" -C "$bin_dir"
                    extracted=1
                fi
            done
            
            if [[ $extracted -eq 0 ]]; then
                echo "    Warning: No bin directory found for ${app_name}"
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
    
    cd "${REPO_ROOT}"
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
    
    cd "${REPO_ROOT}"
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
    inputs)  extract_parsec_inputs_arm ;;
    all)     build_parsec_arm; build_splash_arm; build_phoenix_arm ;;
    *)       echo "Usage: $0 [parsec|splash|phoenix|inputs|all]"; exit 1 ;;
esac

echo ""
echo "=============================================="
echo "ARM benchmark build complete!"
echo "=============================================="
