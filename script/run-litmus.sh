#!/usr/bin/env bash
#
# run-litmus.sh - Run ARM litmus tests for heterogeneous MCM validation
#
# Usage:
#   ./script/run-litmus.sh                     # Run all litmus tests
#   ./script/run-litmus.sh IRIW_atomic         # Run specific test
#   ./script/run-litmus.sh --list              # List available tests
#
# Output:
#   Results: {REPO_ROOT}/data/litmus/gem5.output/{test_name}/
#   Logs:    {REPO_ROOT}/data/litmus/logs/{test_name}.log
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/setup/litmus-test-mcm-ARM.conf"
DATA_DIR="${REPO_ROOT}/data/litmus"
LOG_DIR="${DATA_DIR}/logs"
OUTPUT_DIR="${DATA_DIR}/gem5.output"

# gem5 binary and setup script
GEM5_BINARY="${REPO_ROOT}/gem5/build/ARM/gem5.opt"
SETUP_SCRIPT="${REPO_ROOT}/setup/setup-litmus.py"

# Default parameters
CORES="${CORES:-4}"
REMOTE_LATENCY="${REMOTE_LATENCY:-10}"
MAX_PARALLEL="${MAX_PARALLEL:-4}"

# Filter (optional)
FILTER_TEST="${1:-}"

#------------------------------------------------------------------------------
# Show help
#------------------------------------------------------------------------------
show_help() {
    echo "Usage: $0 [options] [test_name]"
    echo ""
    echo "Options:"
    echo "  --list          List all available litmus tests"
    echo "  --help          Show this help message"
    echo ""
    echo "Environment variables:"
    echo "  CORES           Number of cores (default: 4)"
    echo "  REMOTE_LATENCY  Remote memory latency (default: 10)"
    echo "  MAX_PARALLEL    Max parallel experiments (default: 4)"
    echo ""
    echo "Examples:"
    echo "  $0                      # Run all litmus tests"
    echo "  $0 IRIW_atomic          # Run specific test"
    echo "  $0 MP_dmb.sys           # Run MP with dmb.sy fences"
    exit 0
}

#------------------------------------------------------------------------------
# List available tests
#------------------------------------------------------------------------------
list_tests() {
    echo "Available litmus tests:"
    echo "========================"
    while IFS='=' read -r name cmd; do
        [[ -z "$name" || "$name" =~ ^# ]] && continue
        echo "  - ${name}"
    done < "${CONFIG_FILE}"
    exit 0
}

#------------------------------------------------------------------------------
# Check prerequisites
#------------------------------------------------------------------------------
check_prerequisites() {
    if [[ ! -f "${GEM5_BINARY}" ]]; then
        echo "ERROR: gem5 ARM binary not found: ${GEM5_BINARY}"
        echo "Build gem5 for ARM first with: ./script/build-gem5.sh ARM"
        exit 1
    fi
    
    if [[ ! -f "${CONFIG_FILE}" ]]; then
        echo "ERROR: Litmus test config not found: ${CONFIG_FILE}"
        exit 1
    fi
    
    if [[ ! -f "${SETUP_SCRIPT}" ]]; then
        echo "ERROR: Setup script not found: ${SETUP_SCRIPT}"
        exit 1
    fi
}

#------------------------------------------------------------------------------
# Run a single litmus test
#------------------------------------------------------------------------------
run_litmus_test() {
    local test_name="$1"
    local test_cmd="$2"
    local output_dir="${OUTPUT_DIR}/${test_name}"
    local log_file="${LOG_DIR}/${test_name}.log"
    
    mkdir -p "${output_dir}"
    
    # Parse command: binary and optional core count
    local binary=$(echo "$test_cmd" | awk '{print $1}')
    local test_cores=$(echo "$test_cmd" | awk '{print $2}')
    [[ -z "$test_cores" ]] && test_cores="${CORES}"
    
    echo "[$(date +%H:%M:%S)] Running: ${test_name} (${test_cores} cores)"
    
    {
        echo "========================================"
        echo "Litmus Test: ${test_name}"
        echo "Binary: ${binary}"
        echo "Cores: ${test_cores}"
        echo "Start: $(date)"
        echo "========================================"
        
        local start_time=$(date +%s)
        
        cd "${output_dir}"
        
        "${GEM5_BINARY}" \
            --outdir="${output_dir}" \
            "${SETUP_SCRIPT}" \
            --cores "${test_cores}" \
            --remote-latency "${REMOTE_LATENCY}" \
            "${binary}"
        
        local exit_code=$?
        local end_time=$(date +%s)
        local duration=$((end_time - start_time))
        
        echo ""
        echo "========================================"
        echo "Completed: ${test_name}"
        echo "Exit code: ${exit_code}"
        echo "Duration: ${duration}s"
        echo "End: $(date)"
        echo "========================================"
        
    } > "${log_file}" 2>&1
    
    return $?
}

#------------------------------------------------------------------------------
# Run tests in parallel
#------------------------------------------------------------------------------
run_all_tests() {
    local pids=()
    local test_names=()
    local count=0
    
    while IFS='=' read -r name cmd; do
        # Skip empty lines and comments
        [[ -z "$name" || "$name" =~ ^# ]] && continue
        
        # Apply filter if specified
        if [[ -n "${FILTER_TEST}" && "${name}" != "${FILTER_TEST}" ]]; then
            continue
        fi
        
        # Wait if we've reached max parallel jobs
        while [[ ${#pids[@]} -ge ${MAX_PARALLEL} ]]; do
            for i in "${!pids[@]}"; do
                if ! kill -0 "${pids[$i]}" 2>/dev/null; then
                    wait "${pids[$i]}" || true
                    echo "[$(date +%H:%M:%S)] Completed: ${test_names[$i]}"
                    unset 'pids[i]'
                    unset 'test_names[i]'
                fi
            done
            # Reindex arrays
            pids=("${pids[@]}")
            test_names=("${test_names[@]}")
            sleep 1
        done
        
        # Start test in background
        run_litmus_test "${name}" "${cmd}" &
        pids+=($!)
        test_names+=("${name}")
        ((count++))
        
    done < "${CONFIG_FILE}"
    
    # Wait for remaining tests
    echo ""
    echo "Waiting for ${#pids[@]} remaining tests..."
    for i in "${!pids[@]}"; do
        wait "${pids[$i]}" || true
        echo "[$(date +%H:%M:%S)] Completed: ${test_names[$i]}"
    done
    
    echo ""
    echo "=============================================="
    echo "All ${count} litmus tests completed!"
    echo "=============================================="
}

#------------------------------------------------------------------------------
# Extract and summarize results
#------------------------------------------------------------------------------
summarize_results() {
    echo ""
    echo "=============================================="
    echo "Litmus Test Results Summary"
    echo "=============================================="
    
    local passed=0
    local failed=0
    local total=0
    
    for log_file in "${LOG_DIR}"/*.log; do
        [[ -f "$log_file" ]] || continue
        local test_name=$(basename "$log_file" .log)
        
        # Check if test completed successfully
        if grep -q "Exiting @ tick" "$log_file"; then
            local ticks=$(grep "Exiting @ tick" "$log_file" | awk '{print $4}')
            echo "  ✓ ${test_name}: completed (${ticks} ticks)"
            ((passed++))
        else
            echo "  ✗ ${test_name}: FAILED"
            ((failed++))
        fi
        ((total++))
    done
    
    echo ""
    echo "Summary: ${passed}/${total} passed, ${failed} failed"
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
esac

check_prerequisites

# Create directories
mkdir -p "${LOG_DIR}"
mkdir -p "${OUTPUT_DIR}"

echo "=============================================="
echo "Running ARM Litmus Tests"
echo "=============================================="
echo "Config: ${CONFIG_FILE}"
echo "Output: ${OUTPUT_DIR}"
echo "Cores: ${CORES}"
echo "Remote latency: ${REMOTE_LATENCY}"
echo "Max parallel: ${MAX_PARALLEL}"
[[ -n "${FILTER_TEST}" ]] && echo "Filter: ${FILTER_TEST}"
echo "=============================================="
echo ""

run_all_tests
summarize_results

echo ""
echo "Logs: ${LOG_DIR}/"
echo "Results: ${OUTPUT_DIR}/"
