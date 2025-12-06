set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
GEM5_DIR="${REPO_ROOT}/gem5"

# Check if gem5 directory exists, if not run compile-gem5.sh first
"${SCRIPT_DIR}/compile-gem5.sh"


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
    BUILD_DIR="build/X86_${PROTOCOL}"

    echo "Building ${PROTOCOL}"
    scons defconfig "${BUILD_DIR}" build_opts/X86
    scons setconfig "${BUILD_DIR}" \
        RUBY=y \
        RUBY_${PROTOCOL}=y
    scons "${BUILD_DIR}/gem5.opt" -j "${JOBS}"
    echo "Done: ${BUILD_DIR}/gem5.opt"
done

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
