set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

ARCHIVE="${REPO_ROOT}/gem5.tar.gz"
GEM5_DIR="${REPO_ROOT}/gem5"
SLICC_SRC="${REPO_ROOT}/slicc"
SLICC_DEST="${GEM5_DIR}/src/custom"

echo " Checking gem5 archive..."
if [[ ! -f "${ARCHIVE}" ]]; then
    echo "ERROR: ${ARCHIVE} not found. Run 'tar -czvf gem5.tar.gz gem5' first."
    exit 1
fi

echo " Extracting gem5"

rm -rf "${GEM5_DIR}"
tar -xzf "${ARCHIVE}" -C "${REPO_ROOT}"
find "${GEM5_DIR}" -type f \( -name "*.py" -o -name "*.sh" -o -name "*.pl" \) -exec chmod +x {} \;
chmod +x "${GEM5_DIR}/ext/libelf/native-elf-format" 2>/dev/null || true
echo " Extracterd to ${GEM5_DIR}"

echo "Copying slicc protocols"
cp -r "${SLICC_SRC}" "${SLICC_DEST}/"

echo "Setup complete."

