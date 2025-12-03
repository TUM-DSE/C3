#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BENCHMARKS_DIR="${REPO_ROOT}/benchmarks"

JOBS="${JOBS:-$(nproc)}"

fix_permissions() {
    local dir="$1"
    find "${dir}" -type f -exec sh -c 'head -1 "$1" 2>/dev/null | grep -q "^#!" && chmod +x "$1"' _ {} \; 2>/dev/null || true
}

build_parsec() {
    local PAR_DIR="${BENCHMARKS_DIR}/parsec-benchmark"
    
    # Apps to build (only the ones we use)
    local PARSEC_APPS=(
        "blackscholes"
        "bodytrack"
        "canneal"
        "dedup"
        "facesim"
        "ferret"
        "freqmine"
        "raytrace"
        "streamcluster"
        "swaptions"
        "vips"
        "x264"
    )
    
    echo "==> Building PARSEC..."
    fix_permissions "${PAR_DIR}"
    chmod +x "${PAR_DIR}/bin/"* 2>/dev/null || true
    
    cd "${PAR_DIR}"
    export PARSECDIR="${PAR_DIR}"
    export PATH="${PAR_DIR}/bin:${PATH}"
    
    # Build only the apps we need
    for app in "${PARSEC_APPS[@]}"; do
        echo "    Building ${app}..."
        # Use gcc-pthreads for vips (needs --enable-debug=yes)
        if [[ "$app" == "vips" ]]; then
            parsecmgmt -a build -p "${app}" -c gcc-pthreads
        else
            parsecmgmt -a build -p "${app}" -c gcc
        fi
    done
    
    echo "==> Extracting PARSEC inputs..."
    extract_parsec_inputs
    
    echo "==> PARSEC build complete"
}

# Extract PARSEC input files to the binary directories
extract_parsec_inputs() {
    local PAR_DIR="${BENCHMARKS_DIR}/parsec-benchmark"
    local INPUT_SIZE="${PARSEC_INPUT_SIZE:-test}"  # test, simsmall, simmedium, simlarge
    
    echo "    Using input size: ${INPUT_SIZE}"
    
    # Find all apps and kernels with inputs
    for pkg_type in apps kernels; do
        for app_dir in "${PAR_DIR}/pkgs/${pkg_type}/"*/; do
            [[ -d "$app_dir" ]] || continue
            
            local app_name=$(basename "$app_dir")
            local input_dir="${app_dir}inputs"
            local bin_dir="${app_dir}inst/amd64-linux.gcc/bin"
            local run_dir="${app_dir}inst/amd64-linux.gcc/run"
            
            # Skip if no inputs directory
            [[ -d "$input_dir" ]] || continue
            
            # Find the input tar file
            local input_tar="${input_dir}/input_${INPUT_SIZE}.tar"
            [[ -f "$input_tar" ]] || continue
            
            # Create run directory and extract there
            mkdir -p "$run_dir"
            echo "    Extracting ${app_name} (${INPUT_SIZE})..."
            tar -xf "$input_tar" -C "$run_dir"
            
            # Also extract to bin directory for convenience
            if [[ -d "$bin_dir" ]]; then
                tar -xf "$input_tar" -C "$bin_dir"
            fi
        done
    done
}

build_splash() {
    local SPLASH_DIR="${BENCHMARKS_DIR}/Splash-4"
    
    echo "==> Building SPLASH-4..."
    fix_permissions "${SPLASH_DIR}"
    
    cd "${SPLASH_DIR}"
    make -j "${JOBS}"
    
    echo "==> SPLASH-4 build complete"
}

build_phoenix() {
    local PHOENIX_DIR="${BENCHMARKS_DIR}/phoenix/phoenix-2.0"
    
    echo "==> Building PHOENIX..."
    echo "    Fixing permissions..."
    fix_permissions "${PHOENIX_DIR}"
    
    cd "${PHOENIX_DIR}/src"
    make -j "${JOBS}"
    
    cd "${PHOENIX_DIR}/tests"
    make -j "${JOBS}"
    
    echo "==> PHOENIX build complete"
}
case "${1:-all}" in
    parsec)  build_parsec ;;
    splash)  build_splash ;;
    phoenix) build_phoenix ;;
    all)     build_parsec; build_splash; build_phoenix ;;
    *)       echo "Usage: $0 [parsec|splash|phoenix|all]"; exit 1 ;;
esac