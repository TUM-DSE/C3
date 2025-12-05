#!/usr/bin/env bash
#
# create-conf-arm.sh - Generate ARM benchmark configuration for Figure 9
#
# Generates commands.conf for ARM experiments with:
#   - 2 Protocols: MESI_unord_CXL, MESI_CXL_MOESI
#   - 3 Memory Consistency Models: arm_arm, arm_tso, tso_tso
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BENCHMARKS_DIR="${REPO_ROOT}/benchmarks"
CONFIG_DIR="${BENCHMARKS_DIR}/configuration"
COMMANDS_FILE="${CONFIG_DIR}/commands-arm.conf"

# Protocols for Figure 9
PROTOCOLS=("MESI_unord_CXL" "MESI_CXL_MOESI")

# Memory Consistency Models
MCM_CONFIGS=("arm_arm" "arm_tso" "tso_tso")

# Output base directory for fig9 experiments (relative to REPO_ROOT)
OUTPUT_BASE="data/fig_9/gem5.output"

# Create output directories
mkdir -p "${CONFIG_DIR}"

#------------------------------------------------------------------------------
# Generate commands-arm.conf header
#------------------------------------------------------------------------------
echo "# FORMAT: suite | protocol | mcm | name | command_line" > "${COMMANDS_FILE}"
echo "# Protocols: MESI_unord_CXL (MESI-CXL-MESI), MESI_CXL_MOESI (MESI-CXL-MOESI)" >> "${COMMANDS_FILE}"
echo "# MCM: arm_arm, arm_tso, tso_tso" >> "${COMMANDS_FILE}"
echo "# Output directory: \${REPO_ROOT}/${OUTPUT_BASE}/{suite}/{name}/{protocol}/{mcm}" >> "${COMMANDS_FILE}"
echo "# Auto-generated on $(date)" >> "${COMMANDS_FILE}"
echo "" >> "${COMMANDS_FILE}"

#------------------------------------------------------------------------------
# PARSEC (ARM)
#------------------------------------------------------------------------------
declare -A parsec_cores=(
    ["blackscholes"]=4
    ["bodytrack"]=40
    ["canneal"]=24
    ["dedup"]=16
    ["facesim"]=2
    ["ferret"]=24
    ["freqmine"]=24
    ["raytrace"]=24
    ["streamcluster"]=16
    ["swaptions"]=24
    ["vips"]=30
    ["x264"]=2
)

declare -A parsec_switched=(
    ["blackscholes"]="Yes"
    ["bodytrack"]="No"
    ["canneal"]="No"
    ["dedup"]="No"
    ["facesim"]="Yes"
    ["ferret"]="No"
    ["freqmine"]="No"
    ["raytrace"]="Yes"
    ["streamcluster"]="Yes"
    ["swaptions"]="No"
    ["vips"]="No"
    ["x264"]="No"
)

declare -A parsec_args=(
    ["blackscholes"]="16 in_4.txt prices.txt"
    ["bodytrack"]="sequenceB_1 1 1 5 1 0 8"
    ["canneal"]="16 5 100 10.nets 1"
    ["dedup"]="-c -p -v -t 4 -i test.dat -o output.dat.ddp"
    ["facesim"]="-h"
    ["ferret"]="corel lsh queries 5 5 4 output.txt"
    ["freqmine"]="T10I4D100K_3.dat 1"
    ["raytrace"]="octahedron.obj -automove -nthreads 16 -frames 1 -res 1 1"
    ["streamcluster"]="2 5 1 5 5 5 none output.txt 8"
    ["swaptions"]="-ns 32 -sm 5 -nt 16"
    ["vips"]="im_benchmark barbados_256x288.v output.v"
    ["x264"]="--quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 2 -o eledream.264 eledream_32x18_1.y4m"
)

# Binary name when different from app name
declare -A parsec_binary=(
    ["raytrace"]="rtview"
    ["vips"]="vips"
    ["ferret"]="ferret"
)

# Apps that use gcc-pthreads instead of gcc
declare -A parsec_gcc_pthreads=(
    ["vips"]="yes"
)

echo "Generating PARSEC ARM commands..."

# For ARM, binaries are in amd64-linux.gcc-pthreads (or gcc-openmp) but are actually ARM binaries
# The directory names are misleading but the binaries are cross-compiled for ARM
for app_dir in "${BENCHMARKS_DIR}/parsec-benchmark-arm/pkgs/apps/"*/inst/amd64-linux.gcc-pthreads/bin \
               "${BENCHMARKS_DIR}/parsec-benchmark-arm/pkgs/apps/"*/inst/amd64-linux.gcc-openmp/bin \
               "${BENCHMARKS_DIR}/parsec-benchmark-arm/pkgs/kernels/"*/inst/amd64-linux.gcc-pthreads/bin; do
    [[ -d "$app_dir" ]] || continue
    
    if [[ "$app_dir" == *"/apps/"* ]]; then
        name=$(echo "$app_dir" | sed 's|.*/apps/\([^/]*\)/.*|\1|')
    else
        name=$(echo "$app_dir" | sed 's|.*/kernels/\([^/]*\)/.*|\1|')
    fi
    
    # Skip if not in our list
    [[ -z "${parsec_cores[$name]:-}" ]] && continue
    
    rel_path=$(echo "$app_dir" | sed "s|${BENCHMARKS_DIR}/||")
    binary=${parsec_binary[$name]:-$name}
    
    cores=${parsec_cores[$name]}
    switched=${parsec_switched[$name]}
    args_template=${parsec_args[$name]}
    
    # Generate full command line for each protocol and MCM combination
    for protocol in "${PROTOCOLS[@]}"; do
        for mcm in "${MCM_CONFIGS[@]}"; do
            switched_flag=""
            [[ "$switched" == "Yes" ]] && switched_flag="--switched"
            out_dir="${OUTPUT_BASE}/parsec/${name}/${protocol}/${mcm}"
            
            args="${args_template//\{DIR\}/benchmarks/${rel_path}}"
            args="${args//\{OUTDIR\}/${out_dir}}"
            
            # Use ARM gem5 build and add --cpu-config
            cmd_line="gem5/build/ARM_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} ${switched_flag} --cpu-config ${mcm} -ro -- benchmarks/${rel_path}/${binary} ${args}"
            echo "parsec | ${protocol} | ${mcm} | ${name} | ${cmd_line}" >> "${COMMANDS_FILE}"
        done
    done
done

#------------------------------------------------------------------------------
# SPLASH (ARM)
#------------------------------------------------------------------------------
declare -A splash_cores=(
    ["barnes"]=14
    ["cholesky"]=12
    ["fft"]=12
    ["fmm"]=12
    ["lu-cont"]=8
    ["lu-ncont"]=12
    ["ocean-ncont"]=10
    ["ocean-cont"]=10
    ["radiosity"]=14
    ["radix"]=8
    ["raytrace"]=14
    ["volrend"]=12
    ["volrend-npl"]=10
    ["water-nsquared"]=8
    ["water-spatial"]=8
)

declare -A splash_switched=(
    ["barnes"]="Yes"
    ["cholesky"]="No"
    ["fft"]="Yes"
    ["fmm"]="Yes"
    ["lu-cont"]="No"
    ["lu-ncont"]="No"
    ["ocean-ncont"]="No"
    ["ocean-cont"]="No"
    ["radiosity"]="Yes"
    ["radix"]="No"
    ["raytrace"]="No"
    ["volrend"]="Yes"
    ["volrend-npl"]="No"
    ["water-nsquared"]="No"
    ["water-spatial"]="No"
)

declare -A splash_args=(
    ["barnes"]="BARNES"
    ["cholesky"]="CHOLESKY -p8"
    ["fft"]="FFT -p8 -m16"
    ["fmm"]="FMM"
    ["lu-cont"]="LU-CONT -p8 -n256"
    ["lu-ncont"]="LU-NOCONT -p8 -n256"
    ["ocean-ncont"]="OCEAN-NOCONT -p8 -n130"
    ["ocean-cont"]="OCEAN-CONT -p8 -n130"
    ["radiosity"]="RADIOSITY -p 8 -ae 100 -bf 0.1 -en 0.05 -room -batch"
    ["radix"]="RADIX -p8 -n200000"
    ["raytrace"]="RAYTRACE -p8 -m34 inputs/teapot.env"
    ["volrend"]="VOLREND 8 inputs/head-scaleddown4 2"
    ["volrend-npl"]="VOLREND-NPL 8 inputs/head-scaleddown4 2"
    ["water-nsquared"]="WATER-NSQUARED"
    ["water-spatial"]="WATER-SPATIAL"
)

declare -A splash_dir_map=(
    ["barnes"]="barnes"
    ["cholesky"]="cholesky"
    ["fft"]="fft"
    ["fmm"]="fmm"
    ["lu-contiguous_blocks"]="lu-cont"
    ["lu-non_contiguous_blocks"]="lu-ncont"
    ["ocean-non_contiguous_partitions"]="ocean-ncont"
    ["ocean-contiguous_partitions"]="ocean-cont"
    ["radiosity"]="radiosity"
    ["radix"]="radix"
    ["raytrace"]="raytrace"
    ["volrend"]="volrend"
    ["volrend-no_print_lock"]="volrend-npl"
    ["water-nsquared"]="water-nsquared"
    ["water-spatial"]="water-spatial"
)

declare -A splash_input=(
    ["barnes"]="inputs/n16384-p8"
    ["cholesky"]="inputs/tk14.O"
    ["fft"]=""
    ["fmm"]="fmm.8.2048"
    ["lu-cont"]=""
    ["lu-ncont"]=""
    ["ocean-ncont"]=""
    ["ocean-cont"]=""
    ["radiosity"]=""
    ["radix"]=""
    ["raytrace"]=""
    ["volrend"]=""
    ["volrend-npl"]=""
    ["water-nsquared"]="inputs/n512-p8"
    ["water-spatial"]="inputs/n512-p8"
)

echo "Generating Splash-4 ARM commands..."

SPLASH_DIR="${BENCHMARKS_DIR}/Splash-4-arm/Splash-4"
if [[ -d "${SPLASH_DIR}" ]]; then
    for bench_dir in "${SPLASH_DIR}"/*/; do
        [[ -d "$bench_dir" ]] || continue
        
        dir_name=$(basename "$bench_dir")
        name=${splash_dir_map[$dir_name]:-""}
        [[ -z "$name" ]] && continue
        
        rel_path=$(echo "$bench_dir" | sed "s|${BENCHMARKS_DIR}/||" | sed 's|/$||')
        
        cores=${splash_cores[$name]}
        switched=${splash_switched[$name]}
        args=${splash_args[$name]}
        input_file=${splash_input[$name]:-""}
        
        for protocol in "${PROTOCOLS[@]}"; do
            for mcm in "${MCM_CONFIGS[@]}"; do
                switched_flag=""
                [[ "$switched" == "Yes" ]] && switched_flag="--switched"
                out_dir="${OUTPUT_BASE}/splash/${name}/${protocol}/${mcm}"
                
                if [[ -n "$input_file" ]]; then
                    cmd_line="gem5/build/ARM_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} ${switched_flag} --cpu-config ${mcm} -ro -- benchmarks/${rel_path}/${args} < benchmarks/${rel_path}/${input_file}"
                else
                    cmd_line="gem5/build/ARM_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} ${switched_flag} --cpu-config ${mcm} -ro -- benchmarks/${rel_path}/${args}"
                fi
                echo "splash | ${protocol} | ${mcm} | ${name} | ${cmd_line}" >> "${COMMANDS_FILE}"
            done
        done
    done
fi

#------------------------------------------------------------------------------
# PHOENIX (ARM)
#------------------------------------------------------------------------------
declare -A phoenix_cores=(
    ["histogram"]=10
    ["kmeans"]=10
    ["linear_regression"]=8
    ["matrix_multiply"]=10
    ["pca"]=30
    ["string_match"]=8
    ["word_count"]=8
)

declare -A phoenix_switched=(
    ["histogram"]="No"
    ["kmeans"]="Yes"
    ["linear_regression"]="No"
    ["matrix_multiply"]="Yes"
    ["pca"]="Yes"
    ["string_match"]="No"
    ["word_count"]="No"
)

declare -A phoenix_args=(
    ["histogram"]="histogram image-2.bmp"
    ["kmeans"]="kmeans -d 500 -c 6 -p 100 -s 100"
    ["linear_regression"]="linear_regression ex1data1.txt"
    ["matrix_multiply"]="matrix_multiply 50 50"
    ["pca"]="pca -r 75 -c 75 -s 75"
    ["string_match"]="string_match test.txt"
    ["word_count"]="word_count test.txt"
)

echo "Generating Phoenix ARM commands..."

PHOENIX_DIR="${BENCHMARKS_DIR}/phoenix-arm/phoenix-2.0/tests"
if [[ -d "${PHOENIX_DIR}" ]]; then
    for bench_dir in "${PHOENIX_DIR}"/*/; do
        [[ -d "$bench_dir" ]] || continue
        
        name=$(basename "$bench_dir")
        [[ -z "${phoenix_cores[$name]:-}" ]] && continue
        
        rel_path=$(echo "$bench_dir" | sed "s|${BENCHMARKS_DIR}/||" | sed 's|/$||')
        
        cores=${phoenix_cores[$name]}
        switched=${phoenix_switched[$name]}
        args=${phoenix_args[$name]}
        
        for protocol in "${PROTOCOLS[@]}"; do
            for mcm in "${MCM_CONFIGS[@]}"; do
                switched_flag=""
                [[ "$switched" == "Yes" ]] && switched_flag="--switched"
                out_dir="${OUTPUT_BASE}/phoenix/${name}/${protocol}/${mcm}"
                
                cmd_line="gem5/build/ARM_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} ${switched_flag} --cpu-config ${mcm} -ro -- benchmarks/${rel_path}/${args}"
                echo "phoenix | ${protocol} | ${mcm} | ${name} | ${cmd_line}" >> "${COMMANDS_FILE}"
            done
        done
    done
fi

echo "" >> "${COMMANDS_FILE}"

echo ""
echo "=============================================="
echo "Generated ARM configuration:"
echo "  ${COMMANDS_FILE}"
echo ""
echo "Protocols: ${PROTOCOLS[*]}"
echo "MCM configs: ${MCM_CONFIGS[*]}"
echo "=============================================="

# Count commands generated
cmd_count=$(grep -v "^#" "${COMMANDS_FILE}" | grep -v "^$" | wc -l)
echo "Total commands: ${cmd_count}"
