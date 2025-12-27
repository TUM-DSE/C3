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
    
    # Apps that require external input files (some apps generate inputs at runtime)
    # facesim has input_simdev.tar instead of input_test.tar
    # streamcluster, swaptions generate inputs at runtime (no inputs/ directory)
    local APPS_WITH_INPUTS=(
        "blackscholes"
        "bodytrack"
        "canneal"
        "dedup"
        "ferret"
        "freqmine"
        "raytrace"
        "vips"
        "x264"
    )
    
    # Check if inputs need to be downloaded
    # We check for the downloaded tar.gz file which is the source of all inputs
    local input_archive="${PAR_DIR}/parsec-3.0-input-sim.tar.gz"
    local need_download=false
    
    if [[ ! -f "${input_archive}" ]]; then
        echo "    Input archive not found: ${input_archive}"
        need_download=true
    else
        # Verify apps that need inputs have their input_test.tar extracted
        for app in "${APPS_WITH_INPUTS[@]}"; do
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
        
        # Verify apps that need inputs now have them
        local missing_inputs=()
        for app in "${APPS_WITH_INPUTS[@]}"; do
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
    
    echo "    All PARSEC inputs verified."
    
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
    
    cd "${REPO_ROOT}"
    echo "==> PARSEC build complete"
}

# Extract PARSEC input files to the run directories
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
            local run_dir="${app_dir}run"  # Standard PARSEC run directory
            
            # Skip if no inputs directory
            [[ -d "$input_dir" ]] || continue
            
            # Find the input tar file
            local input_tar="${input_dir}/input_${INPUT_SIZE}.tar"
            [[ -f "$input_tar" ]] || continue
            
            # Create run directory and extract there
            mkdir -p "$run_dir"
            echo "    Extracting ${app_name} (${INPUT_SIZE})..."
            tar -xf "$input_tar" -C "$run_dir"
        done
    done
}

build_splash() {
    local SPLASH_DIR="${BENCHMARKS_DIR}/Splash-4"
    
    echo "==> Building SPLASH-4..."
    fix_permissions "${SPLASH_DIR}"
    
    cd "${SPLASH_DIR}"
    make -j "${JOBS}"
    
    cd "${REPO_ROOT}"
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
    
    cd "${REPO_ROOT}"
    echo "==> PHOENIX build complete"
}
case "${1:-all}" in
    parsec)  build_parsec ;;
    splash)  build_splash ;;
    phoenix) build_phoenix ;;
    all)     build_parsec; build_splash; build_phoenix ;;
    *)       echo "Usage: $0 [parsec|splash|phoenix|all]"; exit 1 ;;
esac

echo ""
echo "=============================================="
echo "X86 benchmark build complete!"
echo "=============================================="