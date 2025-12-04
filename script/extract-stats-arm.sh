#!/usr/bin/env bash
#
# extract-stats-arm.sh - Extract simulation statistics from gem5 ARM output
#
# Generates CSV files for Figure 9 in data/fig_9/summary/{protocol}/{mcm}/{suite}.csv
# Format: Application,Simulation Time
#
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DATA_DIR="${REPO_ROOT}/data/fig_9"
OUTPUT_DIR="${DATA_DIR}/gem5.output"
SUMMARY_DIR="${DATA_DIR}/summary"

# Protocols for Figure 9
PROTOCOLS=("MESI_unord_CXL" "MESI_CXL_MOESI")

# Memory Consistency Models
MCM_CONFIGS=("arm_arm" "arm_tso" "tso_tso")

# Benchmark suites
SUITES=("parsec" "splash" "phoenix")

echo "=============================================="
echo "Extracting statistics from gem5 ARM output"
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
    
    # Process each MCM configuration
    for mcm in "${MCM_CONFIGS[@]}"; do
        echo "  Processing MCM: ${mcm}"
        mkdir -p "${SUMMARY_DIR}/${protocol}/${mcm}"
        
        # Process each suite
        for suite in "${SUITES[@]}"; do
            csv_file="${SUMMARY_DIR}/${protocol}/${mcm}/${suite}.csv"
            
            # Write CSV header
            echo "Application,Simulation Time" > "$csv_file"
            
            suite_dir="${OUTPUT_DIR}/${suite}"
            if [[ ! -d "$suite_dir" ]]; then
                echo "    Warning: Suite directory not found: ${suite_dir}"
                continue
            fi
            
            # Find all applications for this suite
            app_count=0
            for app_dir in "${suite_dir}"/*/; do
                [[ -d "$app_dir" ]] || continue
                
                app_name=$(basename "$app_dir")
                stats_file="${app_dir}${protocol}/${mcm}/stats.txt"
                
                if [[ -f "$stats_file" ]]; then
                    sim_time=$(extract_sim_time "$stats_file")
                    if [[ -n "$sim_time" && "$sim_time" != "0" ]]; then
                        echo "${app_name},${sim_time}" >> "$csv_file"
                        app_count=$((app_count + 1))
                    else
                        echo "    Warning: Could not extract simTicks from ${stats_file}"
                    fi
                else
                    echo "    Warning: Stats file not found: ${stats_file}"
                fi
            done
            
            echo "    ${suite}.csv: ${app_count} applications"
        done
    done
done

echo ""
echo "=============================================="
echo "Creating aggregated CSV files for plotting..."
echo "=============================================="

# Create aggregated CSV files in the format expected by plot_fig9.py
# Format: {suite}_results_{MCM}_{protocol}.csv with columns: Application,Simulation Time
RESULTS_DIR="${SUMMARY_DIR}/results"
mkdir -p "${RESULTS_DIR}"

for protocol in "${PROTOCOLS[@]}"; do
    # Map internal protocol names to display names
    if [[ "$protocol" == "MESI_unord_CXL" ]]; then
        protocol_display="MESI_CXL_MESI"
    else
        protocol_display="$protocol"
    fi
    
    for mcm in "${MCM_CONFIGS[@]}"; do
        # Convert mcm format: arm_arm -> Arm_Arm, arm_tso -> Arm_Tso, tso_tso -> Tso_Tso
        case "$mcm" in
            "arm_arm") mcm_display="Arm_Arm" ;;
            "arm_tso") mcm_display="Arm_Tso" ;;
            "tso_tso") mcm_display="Tso_Tso" ;;
            *) mcm_display="$mcm" ;;
        esac
        
        for suite in "${SUITES[@]}"; do
            # Map suite names
            case "$suite" in
                "parsec") suite_display="parsec" ;;
                "splash") suite_display="Splash" ;;
                "phoenix") suite_display="Phoenix" ;;
                *) suite_display="$suite" ;;
            esac
            
            src_file="${SUMMARY_DIR}/${protocol}/${mcm}/${suite}.csv"
            dst_file="${RESULTS_DIR}/${suite_display}_results.csv_${mcm_display}_${protocol_display}.csv"
            
            if [[ -f "$src_file" ]]; then
                cp "$src_file" "$dst_file"
                echo "Created: ${dst_file}"
            fi
        done
    done
done

echo ""
echo "=============================================="
echo "Summary files generated in: ${SUMMARY_DIR}"
echo "=============================================="
echo ""
echo "Per-MCM files:"
ls -la "${SUMMARY_DIR}"/*/*/*/*.csv 2>/dev/null || echo "No per-MCM CSV files found"
echo ""
echo "Aggregated result files:"
ls -la "${RESULTS_DIR}"/*.csv 2>/dev/null || echo "No aggregated CSV files found"
echo "=============================================="
