#!/usr/bin/env bash
#
# run-fig10.sh - Run gem5 experiments for Figure 10 (parallel execution)
#
# Usage:
#   ./script/run-fig10.sh                              # Run all experiments
#   ./script/run-fig10.sh parsec                       # Run only PARSEC suite
#   ./script/run-fig10.sh parsec blackscholes          # Run only blackscholes from PARSEC
#   ./script/run-fig10.sh parsec blackscholes MESI_unord  # Run specific protocol
#
# Output:
#   Results: {REPO_ROOT}/data/fig_10/gem5.output/{suite}/{app}/{protocol}/
#   Logs:    {REPO_ROOT}/data/fig_10/logs/{suite}_{app}_{protocol}.log
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/benchmarks/configuration/commands.conf"
DATA_DIR="${REPO_ROOT}/data/fig_10"
LOG_DIR="${DATA_DIR}/logs"

# Filters (optional)
FILTER_SUITE="${1:-}"
FILTER_APP="${2:-}"
FILTER_PROTOCOL="${3:-}"

# Check if config file exists
if [[ ! -f "${CONFIG_FILE}" ]]; then
    echo "ERROR: Configuration file not found: ${CONFIG_FILE}"
    echo "Run './script/create-conf.sh' first to generate it."
    exit 1
fi

# Create directories
mkdir -p "${LOG_DIR}"
mkdir -p "${LOG_DIR}/backup"

# PID file for tracking running processes
PID_FILE="${DATA_DIR}/running_pids.txt"
# Clear previous PID file
> "${PID_FILE}"

cd "${REPO_ROOT}"

echo "=============================================="
echo "Running gem5 experiments for Figure 10"
echo "=============================================="
echo "Config file: ${CONFIG_FILE}"
echo "Data directory: ${DATA_DIR}"
echo "Log directory: ${LOG_DIR}"
[[ -n "${FILTER_SUITE}" ]] && echo "Filter suite: ${FILTER_SUITE}"
[[ -n "${FILTER_APP}" ]] && echo "Filter app: ${FILTER_APP}"
[[ -n "${FILTER_PROTOCOL}" ]] && echo "Filter protocol: ${FILTER_PROTOCOL}"
echo "=============================================="
echo ""

#------------------------------------------------------------------------------
# Run a single experiment in background
#------------------------------------------------------------------------------
run_experiment() {
    local suite="$1"
    local protocol="$2"
    local name="$3"
    local cmd_line="$4"
    local log_file="${LOG_DIR}/${suite}_${name}_${protocol}.log"
    
    # Backup existing log if present
    if [[ -f "$log_file" ]]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        cp "$log_file" "${LOG_DIR}/backup/${suite}_${name}_${protocol}_${timestamp}.log"
    fi
    
    # Run in background with output to log file
    {
        echo "[$(date)] STARTING: ${suite}/${name}/${protocol}"
        local start_time=$(date +%s)
        
        cd "${REPO_ROOT}"
        if eval "${cmd_line}"; then
            local end_time=$(date +%s)
            local duration=$((end_time - start_time))
            echo "[$(date)] COMPLETED: ${suite}/${name}/${protocol} in ${duration}s"
        else
            local exit_code=$?
            local end_time=$(date +%s)
            local duration=$((end_time - start_time))
            echo "[$(date)] FAILED: ${suite}/${name}/${protocol} after ${duration}s (exit code: ${exit_code})"
        fi
    } > "${log_file}" 2>&1 &
    
    # Return PID directly (not via echo)
    LAST_PID=$!
}

#------------------------------------------------------------------------------
# Main execution
#------------------------------------------------------------------------------
declare -a running_pids=()
declare -A pid_info=()
total=0

# Read commands.conf and start experiments
# Format: suite | protocol | name | command_line
while IFS='|' read -r suite protocol name cmd_line || [[ -n "$suite" ]]; do
    # Skip comments and empty lines
    [[ "$suite" =~ ^[[:space:]]*#.*$ || -z "$suite" ]] && continue
    
    # Trim whitespace
    suite=$(echo "$suite" | xargs)
    protocol=$(echo "$protocol" | xargs)
    name=$(echo "$name" | xargs)
    cmd_line=$(echo "$cmd_line" | xargs)
    
    # Apply filters
    if [[ -n "${FILTER_SUITE}" && "${suite}" != "${FILTER_SUITE}" ]]; then
        continue
    fi
    if [[ -n "${FILTER_APP}" && "${name}" != "${FILTER_APP}" ]]; then
        continue
    fi
    if [[ -n "${FILTER_PROTOCOL}" && "${protocol}" != "${FILTER_PROTOCOL}" ]]; then
        continue
    fi
    
    # Extract output directory from command line and make it absolute
    out_dir=$(echo "$cmd_line" | grep -oP '(?<=--outdir=)[^ ]+')
    out_dir="${REPO_ROOT}/${out_dir}"
    
    # Update cmd_line with absolute path
    cmd_line=$(echo "$cmd_line" | sed "s|--outdir=[^ ]*|--outdir=${out_dir}|")
    
    # Create output directory (will overwrite previous results)
    mkdir -p "${out_dir}"
    mkdir -p "${out_dir}"
    
    # Start experiment in background
    run_experiment "$suite" "$protocol" "$name" "$cmd_line"
    pid=$LAST_PID
    running_pids+=("$pid")
    pid_info["$pid"]="${suite}/${name}/${protocol}"
    ((total++)) || true
    
    # Save PID to file for easy stop
    echo "${pid} ${suite}/${name}/${protocol}" >> "${PID_FILE}"
    
    echo "[STARTED] ${suite}/${name}/${protocol} (PID: $pid)"
    
done < "${CONFIG_FILE}"

echo ""
echo "=============================================="
echo "Started ${total} experiments in parallel"
echo "=============================================="
echo ""

# Wait for all experiments to complete with progress monitoring
completed=0
failed=0
declare -A pid_done=()

echo "Waiting for experiments to complete (progress every 30s)..."
echo ""

while true; do
    still_running=0
    
    for pid in "${running_pids[@]}"; do
        if [[ "$pid" =~ ^[0-9]+$ && -z "${pid_done[$pid]:-}" ]]; then
            exp_name="${pid_info[$pid]}"
            
            # Check if process is still running
            if kill -0 "$pid" 2>/dev/null; then
                ((still_running++)) || true
            else
                # Process finished
                pid_done[$pid]=1
                if wait "$pid" 2>/dev/null; then
                    echo "[OK] ${exp_name}"
                    ((completed++)) || true
                else
                    echo "[FAILED] ${exp_name}"
                    ((failed++)) || true
                fi
            fi
        fi
    done
    
    # Exit loop when all done
    if [[ $still_running -eq 0 ]]; then
        break
    fi
    
    # Show progress
    echo ""
    echo "--- [$(date +%H:%M:%S)] Progress: ${completed} completed, ${failed} failed, ${still_running} running (of ${total}) ---"
    
    sleep 30
done

echo ""
echo "=============================================="
echo "Summary:"
echo "  Total started: ${total}"
echo "  Completed:     ${completed}"
echo "  Failed:        ${failed}"
echo "=============================================="

# Extract statistics and generate CSV summary files
if [[ ${completed} -gt 0 ]]; then
    echo ""
    echo "Extracting statistics..."
    "${SCRIPT_DIR}/extract-stats.sh"
    
    echo ""
    echo "Generating Figure 10 plot..."
    python3 "${SCRIPT_DIR}/plot_fig10.py"
fi

echo ""
echo "To monitor progress:"
echo "  1. View logs: tail -f ${LOG_DIR}/*.log"
echo "  2. Check process status: ps aux | grep gem5"
echo "  3. View log backups: ls -la ${LOG_DIR}/backup/"
echo ""
echo "Results: ${DATA_DIR}/gem5.output/"
echo "Summary: ${DATA_DIR}/summary/"
echo "Plot: ${DATA_DIR}/plot/"
echo "=============================================="
