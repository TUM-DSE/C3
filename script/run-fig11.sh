#!/usr/bin/env bash
#
# run-fig11.sh - Generate Figure 11: Miss Latency Breakdown
#
# Usage:
#   ./script/run-fig11.sh
#
# Output:
#   data/fig_11/plot/fig11_miss_latency.pdf
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "=============================================="
echo "Generating Figure 11: Miss Latency Breakdown"
echo "=============================================="

# Check if data exists
DATA_DIR="${REPO_ROOT}/data/fig_10/gem5.output"
if [[ ! -d "${DATA_DIR}" ]]; then
    echo "ERROR: Data directory not found: ${DATA_DIR}"
    echo "Please run Figure 10 experiments first: ./script/run-fig10.sh"
    exit 1
fi

# Run the Python script
python3 "${SCRIPT_DIR}/plot_fig11.py"

echo ""
echo "Output: ${REPO_ROOT}/data/fig_11/plot/fig11_miss_latency.pdf"
echo "=============================================="
