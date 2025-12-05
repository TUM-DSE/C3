#!/usr/bin/env bash
#
# create-conf-litmus.sh - Generate litmus test configuration for ARM MCM experiments
#
# This script creates a configuration file similar to commands-arm.conf but for litmus tests.
# Format: test_name | protocol | mcm | command_line
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Output configuration file
OUTPUT_FILE="${REPO_ROOT}/benchmarks/configuration/commands-litmus.conf"

# Litmus test source configuration
LITMUS_CONF="${REPO_ROOT}/setup/litmus-test-mcm-ARM.conf"

# Protocols and MCM configurations (same as Figure 9)
PROTOCOLS=("MESI_unord_CXL" "MESI_CXL_MOESI")
MCM_CONFIGS=("arm_arm" "arm_tso" "tso_tso")

# Default number of cores for litmus tests
DEFAULT_CORES=16

mkdir -p "$(dirname "${OUTPUT_FILE}")"

{
    echo "# FORMAT: test_name | protocol | mcm | command_line"
    echo "# Protocols: MESI_unord_CXL (MESI-CXL-MESI), MESI_CXL_MOESI (MESI-CXL-MOESI)"
    echo "# MCM: arm_arm, arm_tso, tso_tso"
    echo "# Output directory: \${REPO_ROOT}/data/litmus/gem5.output/{test_name}/{protocol}/{mcm}"
    echo "# Auto-generated on $(date)"
    echo ""

    while IFS='=' read -r test_name test_cmd; do
        # Skip empty lines and comments
        [[ -z "$test_name" || "$test_name" =~ ^# ]] && continue
        
        # Parse command: binary and optional arguments (like thread count for IRIW)
        binary=$(echo "$test_cmd" | awk '{print $1}')
        binary_args=$(echo "$test_cmd" | awk '{$1=""; print $0}' | xargs)
        
        # Convert absolute path to relative path from REPO_ROOT
        # /benchmarks/... -> benchmarks/...
        binary_rel="${binary#/}"
        
        for protocol in "${PROTOCOLS[@]}"; do
            for mcm in "${MCM_CONFIGS[@]}"; do
                out_dir="data/litmus/gem5.output/${test_name}/${protocol}/${mcm}"
                
                # Build command line similar to fig9
                cmd="gem5/build/ARM_${protocol}/gem5.opt"
                cmd+=" --outdir=${out_dir}"
                cmd+=" --redirect-stdout --redirect-stderr"
                cmd+=" setup/setup.py"
                cmd+=" -c ${DEFAULT_CORES}"
                cmd+=" --switched"
                cmd+=" --cpu-config ${mcm}"
                cmd+=" -ro"
                # Pass binary and its arguments (like thread count for IRIW)
                if [[ -n "$binary_args" ]]; then
                    cmd+=" -- ${binary_rel} ${binary_args}"
                else
                    cmd+=" -- ${binary_rel}"
                fi
                
                echo "${test_name} | ${protocol} | ${mcm} | ${cmd}"
            done
        done
    done < "${LITMUS_CONF}"

} > "${OUTPUT_FILE}"

echo "Generated: ${OUTPUT_FILE}"
echo "Total configurations: $(grep -v '^#' "${OUTPUT_FILE}" | grep -v '^$' | wc -l)"
