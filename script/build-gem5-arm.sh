#!/bin/bash
# Build gem5 for ARM architecture with Ruby cache coherence protocols
# Usage: ./build-gem5-arm.sh [PROTOCOL] [JOBS]
#        ./build-gem5-arm.sh              # Build all protocols
#        ./build-gem5-arm.sh MESI_unord   # Build single protocol
#        ./build-gem5-arm.sh MESI_unord 8 # Build with 8 jobs

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
GEM5_DIR="${REPO_ROOT}/gem5"

# Check if gem5 directory exists, if not run compile-gem5.sh first
if [[ ! -d "${GEM5_DIR}" ]]; then
    echo "gem5 directory not found. Running compile-gem5.sh first..."
    "${SCRIPT_DIR}/compile-gem5.sh"
fi

ALL_PROTOCOLS=(
    "MESI_unord"
    "MESI_unord_CXL"
    "MESI_CXL_MOESI"
    "MESI_CXL_MESIF"
)

if [[ -n "${1:-}" && ! "${1}" =~ ^[0-9]+$ ]]; then
    PROTOCOLS=("${1}")
    JOBS="${2:-$(nproc)}"
else
    PROTOCOLS=("${ALL_PROTOCOLS[@]}")
    JOBS="${1:-$(nproc)}"
fi

cd "${GEM5_DIR}"

for PROTOCOL in "${PROTOCOLS[@]}"; do
    BUILD_DIR="build/ARM_${PROTOCOL}"

    echo "=========================================="
    echo "Building ARM ${PROTOCOL}"
    echo "=========================================="
    
    scons defconfig "${BUILD_DIR}" build_opts/ARM
    scons setconfig "${BUILD_DIR}" \
        RUBY=y \
        RUBY_${PROTOCOL}=y
    scons "${BUILD_DIR}/gem5.opt" -j "${JOBS}"
    
    echo "Done: ${BUILD_DIR}/gem5.opt"
done

echo ""
echo "=========================================="
echo "ARM gem5 build complete!"
echo "Built binaries:"
for PROTOCOL in "${PROTOCOLS[@]}"; do
    echo "  - gem5/build/ARM_${PROTOCOL}/gem5.opt"
done
echo "=========================================="
