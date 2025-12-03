#!/usr/bin/env bash
#
# extract-stats.sh - Extract simulation statistics from gem5 output
#
# Generates CSV files in data/fig_10/summary/{protocol}/{suite}.csv
# Format: Application,Simulation Time
#
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DATA_DIR="${REPO_ROOT}/data/fig_10"
OUTPUT_DIR="${DATA_DIR}/gem5.output"
SUMMARY_DIR="${DATA_DIR}/summary"

# Protocols
PROTOCOLS=("MESI_unord" "MESI_unord_CXL" "MESI_CXL_MOESI" "MESI_CXL_MESIF")

# Benchmark suites
SUITES=("parsec" "splash" "phoenix")

echo "=============================================="
echo "Extracting statistics from gem5 output"
echo "=============================================="
echo "Output dir: ${OUTPUT_DIR}"
echo "Summary dir: ${SUMMARY_DIR}"
echo "=============================================="
echo ""

# Create summary directory
mkdir -p "${SUMMARY_DIR}"

# Function to extract simTicks from stats.txt
extract_sim_time() {
    local stats_file="$1"
    if [[ -f "$stats_file" ]]; then
        # Extract simTicks value directly (no conversion needed)
        local sim_ticks=$(grep "^simTicks" "$stats_file" | awk '{print $2}')
        if [[ -n "$sim_ticks" ]]; then
            # Format with comma as decimal separator (European format)
            echo "${sim_ticks}" | sed 's/\./,/'
        else
            echo "0"
        fi
    else
        echo ""
    fi
}

# Process each protocol
for protocol in "${PROTOCOLS[@]}"; do
    echo "Processing protocol: ${protocol}"
    mkdir -p "${SUMMARY_DIR}/${protocol}"
    
    # Process each suite
    for suite in "${SUITES[@]}"; do
        csv_file="${SUMMARY_DIR}/${protocol}/${suite}.csv"
        
        # Write CSV header
        echo "Application,Simulation Time" > "$csv_file"
        
        suite_dir="${OUTPUT_DIR}/${suite}"
        if [[ ! -d "$suite_dir" ]]; then
            echo "  Warning: Suite directory not found: ${suite_dir}"
            continue
        fi
        
        # Find all applications for this suite
        app_count=0
        for app_dir in "${suite_dir}"/*/; do
            [[ -d "$app_dir" ]] || continue
            
            app_name=$(basename "$app_dir")
            stats_file="${app_dir}${protocol}/stats.txt"
            
            if [[ -f "$stats_file" ]]; then
                sim_time=$(extract_sim_time "$stats_file")
                if [[ -n "$sim_time" && "$sim_time" != "0" ]]; then
                    echo "${app_name},${sim_time}" >> "$csv_file"
                    app_count=$((app_count + 1))
                else
                    echo "  Warning: Could not extract simTicks from ${stats_file}"
                fi
            else
                echo "  Warning: Stats file not found: ${stats_file}"
            fi
        done
        
        echo "  ${suite}.csv: ${app_count} applications"
    done
done

echo ""
echo "=============================================="
echo "Summary files generated in: ${SUMMARY_DIR}"
echo "=============================================="
ls -la "${SUMMARY_DIR}"/*/*.csv 2>/dev/null || echo "No CSV files found"
echo "=============================================="
