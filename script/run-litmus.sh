#!/usr/bin/env bash
#
# run-litmus.sh - Run ARM litmus tests for heterogeneous MCM validation
#
# Usage:
#   ./script/run-litmus.sh                                    # Run all litmus tests
#   ./script/run-litmus.sh IRIW_atomic                        # Run specific test
#   ./script/run-litmus.sh IRIW_atomic MESI_unord_CXL         # Run specific test + protocol
#   ./script/run-litmus.sh IRIW_atomic MESI_unord_CXL arm_arm # Run specific test + protocol + mcm
#
# Output:
#   Results: {REPO_ROOT}/data/litmus/gem5.output/{test_name}/{protocol}/{mcm}/
#   Logs:    {REPO_ROOT}/data/litmus/logs/{test_name}_{protocol}_{mcm}.log
#   Report:  {REPO_ROOT}/data/litmus/litmus_results.txt
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/benchmarks/configuration/commands-litmus.conf"
DATA_DIR="${REPO_ROOT}/data/litmus"
LOG_DIR="${DATA_DIR}/logs"
REPORT_FILE="${DATA_DIR}/litmus_results.txt"

# Filters (optional)
FILTER_TEST="${1:-}"
FILTER_PROTOCOL="${2:-}"
FILTER_MCM="${3:-}"


show_help() {
    echo "Usage: $0 [test_name] [protocol] [mcm]"
    echo ""
    echo "Options:"
    echo "  --list          List all available litmus tests"
    echo "  --help          Show this help message"
    echo "  --generate      Generate configuration file only"
    echo ""
    echo "Filters:"
    echo "  test_name       Run only this specific test"
    echo "  protocol        Run only this protocol (MESI_unord_CXL or MESI_CXL_MOESI)"
    echo "  mcm             Run only this MCM config (arm_arm, arm_tso, tso_tso)"
    echo ""
    echo "Examples:"
    echo "  $0                                        # Run all litmus tests"
    echo "  $0 IRIW_atomic                            # Run specific test"
    echo "  $0 IRIW_atomic MESI_unord_CXL             # Run test with specific protocol"
    echo "  $0 IRIW_atomic MESI_unord_CXL arm_arm     # Run test with specific protocol and MCM"
    exit 0
}


list_tests() {
    if [[ ! -f "${CONFIG_FILE}" ]]; then
        echo "Configuration file not found. Generating..."
        "${SCRIPT_DIR}/create-conf-litmus.sh"
    fi
    
    echo "Available litmus tests:"
    echo "========================"
    grep -v '^#' "${CONFIG_FILE}" | grep -v '^$' | cut -d'|' -f1 | sort -u | while read -r name; do
        echo "  - $(echo "$name" | xargs)"
    done
    echo ""
    echo "Protocols: MESI_unord_CXL, MESI_CXL_MOESI"
    echo "MCM configs: arm_arm, arm_tso, tso_tso"
    exit 0
}


check_prerequisites() {
    local found=0
    for protocol in MESI_unord_CXL MESI_CXL_MOESI; do
        if [[ -f "${REPO_ROOT}/gem5/build/ARM_${protocol}/gem5.opt" ]]; then
            found=1
        else
            echo "WARNING: gem5 ARM build not found: gem5/build/ARM_${protocol}/gem5.opt"
        fi
    done
    
    if [[ $found -eq 0 ]]; then
        echo "ERROR: No ARM gem5 builds found."
        echo "Build gem5 for ARM first with: ./script/build-gem5-arm.sh"
        exit 1
    fi
    
    # Generate config if missing
    if [[ ! -f "${CONFIG_FILE}" ]]; then
        echo "Configuration file not found. Generating..."
        "${SCRIPT_DIR}/create-conf-litmus.sh"
    fi
}

#------------------------------------------------------------------------------
# Run a single experiment in background
#------------------------------------------------------------------------------
run_experiment() {
    local test_name="$1"
    local protocol="$2"
    local mcm="$3"
    local cmd_line="$4"
    local log_file="${LOG_DIR}/${test_name}_${protocol}_${mcm}.log"
    
    if [[ -f "$log_file" ]]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        cp "$log_file" "${LOG_DIR}/backup/${test_name}_${protocol}_${mcm}_${timestamp}.log"
    fi
    
    {
        echo "[$(date)] STARTING: ${test_name}/${protocol}/${mcm}"
        local start_time=$(date +%s)
        
        cd "${REPO_ROOT}"
        if eval "${cmd_line}"; then
            local end_time=$(date +%s)
            local duration=$((end_time - start_time))
            echo "[$(date)] COMPLETED: ${test_name}/${protocol}/${mcm} in ${duration}s"
        else
            local exit_code=$?
            local end_time=$(date +%s)
            local duration=$((end_time - start_time))
            echo "[$(date)] FAILED: ${test_name}/${protocol}/${mcm} after ${duration}s (exit code: ${exit_code})"
        fi
    } > "${log_file}" 2>&1 &
    
    LAST_PID=$!
}


check_test_result() {
    local output_file="$1"
    
    [[ ! -f "$output_file" ]] && echo "NO_OUTPUT" && return
    

    if grep -q "Positive:" "$output_file"; then
        # Extract the number after "Positive:" (handles "Positive: 0," format)
        local positive=$(grep "Positive:" "$output_file" | sed -n 's/.*Positive:[[:space:]]*\([0-9]*\).*/\1/p' | head -1)
        if [[ "$positive" == "0" ]]; then
            echo "PASS"
        else
            echo "FAIL:${positive}"
        fi
        return
    fi
    

    if grep -q "Failure Test:" "$output_file"; then
        # Extract the number after "Failure Test:"
        local failures=$(grep "Failure Test:" "$output_file" | sed -n 's/.*Failure Test:[[:space:]]*\([0-9]*\).*/\1/p' | head -1)
        if [[ "$failures" == "0" ]]; then
            echo "PASS"
        else
            echo "FAIL:${failures}"
        fi
        return
    fi
    

    if grep -q "Count (r0:2 and r1:2):" "$output_file"; then
        local total_forbidden=0
        while IFS= read -r line; do
            local count=$(echo "$line" | sed -n 's/.*Count (r0:2 and r1:2):[[:space:]]*\([0-9]*\).*/\1/p')
            if [[ -n "$count" ]]; then
                total_forbidden=$((total_forbidden + count))
            fi
        done < <(grep "Count (r0:2 and r1:2):" "$output_file")
        
        if [[ "$total_forbidden" == "0" ]]; then
            echo "PASS"
        else
            echo "FAIL:${total_forbidden}"
        fi
        return
    fi
    
    # Fallback: Check for "Observation ... Never 0" pattern (herd7 summary)
    if grep -q "Observation.*Never 0" "$output_file"; then
        echo "PASS"
        return
    fi
    
    # Fallback: Check for explicit "Success!" pattern
    if grep -q "Success!" "$output_file"; then
        echo "PASS"
        return
    fi
    
    echo "UNKNOWN"
}

#------------------------------------------------------------------------------
# Generate report
#------------------------------------------------------------------------------
generate_report() {
    echo ""
    echo "Generating litmus test report..."
    
    {
        echo "=============================================================================="
        echo "                    LITMUS TEST RESULTS REPORT"
        echo "=============================================================================="
        echo ""
        echo "Date: $(date)"
        echo "Protocols tested: MESI_unord_CXL MESI_CXL_MOESI"
        echo "MCM configurations: arm_arm arm_tso tso_tso"
        echo ""
        echo "Legend:"
        echo "  PASS     - Forbidden state count = 0 (memory model correctly enforced)"
        echo "  FAIL:N   - Forbidden state observed N times (memory model violation)"
        echo "  UNKNOWN  - Could not parse output"
        echo "  NO_OUTPUT- Test did not produce output"
        echo ""
        echo "=============================================================================="
        
        local total_pass=0
        local total_fail=0
        local total_unknown=0
        
        for protocol in MESI_unord_CXL MESI_CXL_MOESI; do
            echo ""
            echo "=============================================================================="
            echo " Protocol: ${protocol}"
            echo "=============================================================================="
            
            for mcm in arm_arm arm_tso tso_tso; do
                echo ""
                echo "  MCM: ${mcm}"
                echo "  ----------------------------------------"
                
                local mcm_pass=0
                local mcm_fail=0
                
                # Get unique test names from config
                grep -v '^#' "${CONFIG_FILE}" | grep -v '^$' | cut -d'|' -f1 | sort -u | while read -r name; do
                    name=$(echo "$name" | xargs)
                    # Litmus test results are in output.txt, not simout.txt
                    local output_file="${DATA_DIR}/gem5.output/${name}/${protocol}/${mcm}/output.txt"
                    local result=$(check_test_result "$output_file")
                    
                    if [[ "$result" == "PASS" ]]; then
                        echo "    ✓ ${name}: PASS"
                    elif [[ "$result" == "NO_OUTPUT" ]]; then
                        echo "    ? ${name}: NO OUTPUT"
                    elif [[ "$result" == "UNKNOWN" ]]; then
                        echo "    ? ${name}: UNKNOWN"
                    else
                        local fail_count="${result#FAIL:}"
                        echo "    ✗ ${name}: FAIL (forbidden state observed ${fail_count} times)"
                    fi
                done
                
                echo "  ----------------------------------------"
            done
        done
        
        echo ""
        echo "=============================================================================="
        
    } > "${REPORT_FILE}"
    
    cat "${REPORT_FILE}"
}

#------------------------------------------------------------------------------
# Main
#------------------------------------------------------------------------------

# Handle special arguments
case "${FILTER_TEST}" in
    --help|-h)
        show_help
        ;;
    --list|-l)
        list_tests
        ;;
    --generate|-g)
        "${SCRIPT_DIR}/create-conf-litmus.sh"
        exit 0
        ;;
esac

# Create directories first
mkdir -p "${LOG_DIR}"
mkdir -p "${LOG_DIR}/backup"
mkdir -p "${DATA_DIR}/gem5.output"

# Check prerequisites
check_prerequisites

# PID file for tracking running processes
PID_FILE="${DATA_DIR}/running_pids.txt"
> "${PID_FILE}"

cd "${REPO_ROOT}"

echo "=============================================="
echo "Running ARM Litmus Tests"
echo "=============================================="
echo "Config file: ${CONFIG_FILE}"
echo "Data directory: ${DATA_DIR}"
echo "Log directory: ${LOG_DIR}"
[[ -n "${FILTER_TEST}" ]] && echo "Filter test: ${FILTER_TEST}"
[[ -n "${FILTER_PROTOCOL}" ]] && echo "Filter protocol: ${FILTER_PROTOCOL}"
[[ -n "${FILTER_MCM}" ]] && echo "Filter MCM: ${FILTER_MCM}"
echo "=============================================="
echo ""

#------------------------------------------------------------------------------
# Main execution
#------------------------------------------------------------------------------
declare -a running_pids=()
declare -A pid_info=()
total=0

# Read commands-litmus.conf and start experiments
# Format: test_name | protocol | mcm | command_line
while IFS='|' read -r test_name protocol mcm cmd_line || [[ -n "$test_name" ]]; do
    # Skip comments and empty lines
    [[ "$test_name" =~ ^[[:space:]]*#.*$ || -z "$test_name" ]] && continue
    
    # Trim whitespace
    test_name=$(echo "$test_name" | xargs)
    protocol=$(echo "$protocol" | xargs)
    mcm=$(echo "$mcm" | xargs)
    cmd_line=$(echo "$cmd_line" | xargs)
    
    # Apply filters
    if [[ -n "${FILTER_TEST}" && "${test_name}" != "${FILTER_TEST}" ]]; then
        continue
    fi
    if [[ -n "${FILTER_PROTOCOL}" && "${protocol}" != "${FILTER_PROTOCOL}" ]]; then
        continue
    fi
    if [[ -n "${FILTER_MCM}" && "${mcm}" != "${FILTER_MCM}" ]]; then
        continue
    fi
    
    # Extract output directory from command line and make it absolute
    out_dir=$(echo "$cmd_line" | grep -oP '(?<=--outdir=)[^ ]+')
    out_dir="${REPO_ROOT}/${out_dir}"
    
    # Update cmd_line with absolute path
    cmd_line=$(echo "$cmd_line" | sed "s|--outdir=[^ ]*|--outdir=${out_dir}|")
    
    # Create output directory
    mkdir -p "${out_dir}"
    
    # Start experiment in background
    run_experiment "$test_name" "$protocol" "$mcm" "$cmd_line"
    pid=$LAST_PID
    running_pids+=("$pid")
    pid_info["$pid"]="${test_name}/${protocol}/${mcm}"
    ((total++)) || true
    
    # Save PID to file
    echo "${pid} ${test_name}/${protocol}/${mcm}" >> "${PID_FILE}"
    
    echo "[STARTED] ${test_name}/${protocol}/${mcm} (PID: $pid)"
    
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

# Generate report
generate_report

echo ""
echo "To monitor progress:"
echo "  1. View logs: tail -f ${LOG_DIR}/*.log"
echo "  2. Check process status: ps aux | grep gem5"
echo "  3. View log backups: ls -la ${LOG_DIR}/backup/"
echo ""
echo "Results: ${DATA_DIR}/gem5.output/"
echo "Report: ${REPORT_FILE}"
echo "=============================================="
