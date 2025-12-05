#!/usr/bin/env bash
#
# run-functional.sh - Functional Validation for Artifact Evaluation
#
# This script validates that gem5 simulations produce functionally correct
# results by comparing the output of simulated benchmarks against native
# execution on the host machine.
#
# The validation uses kmeans (a deterministic benchmark) which produces
# identical numerical output regardless of the execution environment.
#
# Usage:
#   ./script/run-functional.sh x86    # Validate X86 (Figure 10 protocols)
#   ./script/run-functional.sh arm    # Validate ARM (Figure 9 protocols)
#   ./script/run-functional.sh all    # Validate both X86 and ARM
#
# Exit codes:
#   0 - All validations passed
#   1 - One or more validations failed
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

ARCH="${1:-x86}"

# Validation directories
VALIDATION_DIR="${REPO_ROOT}/data/functional"
EXPECTED_FILE="${VALIDATION_DIR}/expected_output.txt"
RESULTS_FILE="${VALIDATION_DIR}/results.txt"

# Benchmark configuration
KMEANS_ARGS="-d 500 -c 6 -p 100 -s 100"
GEM5_CORES=10

#------------------------------------------------------------------------------
# Extract Final means values from kmeans output (normalized for comparison)
#------------------------------------------------------------------------------
extract_final_means() {
    local output_file="$1"
    sed -n '/Final means:/,$ p' "$output_file" | tail -n +2 | \
        grep -oE '[0-9]+' | tr '\n' ' ' | sed 's/ $//'
}

#------------------------------------------------------------------------------
# Compare two outputs
#------------------------------------------------------------------------------
compare_outputs() {
    local actual="$1"
    local expected="$2"
    
    local actual_means=$(extract_final_means "$actual")
    local expected_means=$(extract_final_means "$expected")
    
    [[ "$actual_means" == "$expected_means" ]]
}

#------------------------------------------------------------------------------
# Log functions
#------------------------------------------------------------------------------
log_step() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  $1"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

log_info() {
    echo "  → $1"
}

log_success() {
    echo "  ✓ $1"
}

log_error() {
    echo "  ✗ $1"
}

#------------------------------------------------------------------------------
# Generate expected output from native binary
#------------------------------------------------------------------------------
generate_expected() {
    log_step "Generating Reference Output (Native Execution)"
    
    local kmeans_dir="${REPO_ROOT}/benchmarks/phoenix/phoenix-2.0/tests/kmeans"
    
    log_info "Running kmeans natively to generate expected output..."
    
    cd "${kmeans_dir}"
    ./kmeans ${KMEANS_ARGS} > "${EXPECTED_FILE}" 2>&1
    
    local num_values=$(extract_final_means "${EXPECTED_FILE}" | wc -w)
    log_info "Saved to: ${EXPECTED_FILE}"
}

#------------------------------------------------------------------------------
# Run X86 functional validation
#------------------------------------------------------------------------------
run_x86_functional() {
    log_step "X86 Functional Validation"
    
    local protocols=("MESI_unord" "MESI_unord_CXL" "MESI_CXL_MOESI" "MESI_CXL_MESIF")
    local kmeans_binary="benchmarks/phoenix/phoenix-2.0/tests/kmeans/kmeans"
    
    log_info "Validating ${#protocols[@]} protocols: ${protocols[*]}"
    log_info "Each protocol will be tested against the native reference output."
    echo ""
    
    local passed=0
    local failed=0
    local skipped=0
    
    for protocol in "${protocols[@]}"; do
        local gem5_binary="${REPO_ROOT}/gem5/build/X86_${protocol}/gem5.opt"
        local out_dir="${VALIDATION_DIR}/x86/${protocol}"
        
        if [[ ! -f "$gem5_binary" ]]; then
            log_error "${protocol}: gem5 build not found (skipped)"
            ((skipped++))
            continue
        fi
        
        mkdir -p "${out_dir}"
        
        log_info "${protocol}: Running gem5 simulation..."
        
        cd "${REPO_ROOT}"
        local start_time=$(date +%s)
        
        if "${gem5_binary}" \
            --outdir="${out_dir}" \
            --redirect-stdout \
            --redirect-stderr \
            setup/setup.py \
            -c ${GEM5_CORES} \
            --switched \
            -ro \
            -- \
            "${kmeans_binary}" \
            ${KMEANS_ARGS} > /dev/null 2>&1; then
            
            local end_time=$(date +%s)
            local duration=$((end_time - start_time))
            
            if compare_outputs "${out_dir}/output.txt" "${EXPECTED_FILE}"; then
                log_success "${protocol}: PASSED (${duration}s)"
                echo "x86 | ${protocol} | PASSED | ${duration}s" >> "${RESULTS_FILE}"
                ((passed++))
            else
                log_error "${protocol}: FAILED - output mismatch"
                echo "x86 | ${protocol} | FAILED | output mismatch" >> "${RESULTS_FILE}"
                ((failed++))
            fi
        else
            log_error "${protocol}: FAILED - simulation error"
            echo "x86 | ${protocol} | FAILED | simulation error" >> "${RESULTS_FILE}"
            ((failed++))
        fi
    done
    
    echo ""
    log_info "X86 Results: ${passed} passed, ${failed} failed, ${skipped} skipped"
    
    [[ $failed -eq 0 && $skipped -eq 0 ]]
}

#------------------------------------------------------------------------------
# Run ARM functional validation
#------------------------------------------------------------------------------
run_arm_functional() {
    log_step "ARM Functional Validation (Figure 9)"
    
    local protocols=("MESI_unord_CXL" "MESI_CXL_MOESI")
    local mcm_configs=("arm_arm" "arm_tso" "tso_tso")
    local kmeans_binary="benchmarks/phoenix-arm/phoenix-2.0/tests/kmeans/kmeans"
    
    local total=$((${#protocols[@]} * ${#mcm_configs[@]}))
    log_info "Validating ${total} configurations (${#protocols[@]} protocols × ${#mcm_configs[@]} MCM configs)"
    log_info "Each configuration will be tested against the native reference output."
    echo ""
    
    local passed=0
    local failed=0
    local skipped=0
    
    for protocol in "${protocols[@]}"; do
        local gem5_binary="${REPO_ROOT}/gem5/build/ARM_${protocol}/gem5.opt"
        
        if [[ ! -f "$gem5_binary" ]]; then
            log_error "${protocol}: gem5 build not found (skipping all MCM configs)"
            ((skipped += ${#mcm_configs[@]}))
            continue
        fi
        
        for mcm in "${mcm_configs[@]}"; do
            local out_dir="${VALIDATION_DIR}/arm/${protocol}/${mcm}"
            mkdir -p "${out_dir}"
            
            log_info "${protocol}/${mcm}: Running gem5 simulation..."
            
            cd "${REPO_ROOT}"
            local start_time=$(date +%s)
            
            if "${gem5_binary}" \
                --outdir="${out_dir}" \
                --redirect-stdout \
                --redirect-stderr \
                setup/setup.py \
                -c ${GEM5_CORES} \
                --switched \
                --cpu-config "${mcm}" \
                -ro \
                -- \
                "${kmeans_binary}" \
                ${KMEANS_ARGS} > /dev/null 2>&1; then
                
                local end_time=$(date +%s)
                local duration=$((end_time - start_time))
                
                if compare_outputs "${out_dir}/output.txt" "${EXPECTED_FILE}"; then
                    log_success "${protocol}/${mcm}: PASSED (${duration}s)"
                    echo "arm | ${protocol}/${mcm} | PASSED | ${duration}s" >> "${RESULTS_FILE}"
                    ((passed++))
                else
                    log_error "${protocol}/${mcm}: FAILED - output mismatch"
                    echo "arm | ${protocol}/${mcm} | FAILED | output mismatch" >> "${RESULTS_FILE}"
                    ((failed++))
                fi
            else
                log_error "${protocol}/${mcm}: FAILED - simulation error"
                echo "arm | ${protocol}/${mcm} | FAILED | simulation error" >> "${RESULTS_FILE}"
                ((failed++))
            fi
        done
    done
    
    echo ""
    log_info "ARM Results: ${passed} passed, ${failed} failed, ${skipped} skipped"
    
    [[ $failed -eq 0 && $skipped -eq 0 ]]
}



mkdir -p "${VALIDATION_DIR}"
echo "# Functional Validation Results - $(date)" > "${RESULTS_FILE}"

# Generate expected output first
generate_expected

X86_PASSED=true
ARM_PASSED=true

case "${ARCH}" in
    x86|X86)
        run_x86_functional || X86_PASSED=false
        ;;
    arm|ARM)
        run_arm_functional || ARM_PASSED=false
        ;;
    all|ALL)
        run_x86_functional || X86_PASSED=false
        run_arm_functional || ARM_PASSED=false
        ;;
    *)
        echo "Usage: $0 [x86|arm|all]"
        exit 1
        ;;
esac


echo ""
