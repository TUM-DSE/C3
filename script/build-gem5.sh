set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
GEM5_DIR="${REPO_ROOT}/gem5"

# Check if gem5 directory exists, if not run compile-gem5.sh first
if [[ ! -d "${GEM5_DIR}" ]]; then
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
    BUILD_DIR="build/X86_${PROTOCOL}"

    echo "Building ${PROTOCOL}"
    scons defconfig "${BUILD_DIR}" build_opts/X86
    scons setconfig "${BUILD_DIR}" \
        RUBY=y \
        RUBY_${PROTOCOL}=y
    scons "${BUILD_DIR}/gem5.opt" -j "${JOBS}"
    echo "Done: ${BUILD_DIR}/gem5.opt"
done
