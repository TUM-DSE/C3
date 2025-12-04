CXX = aarch64-linux-gnu-g++
# CXX = g++
COMMON_FLAGS = -std=c++11 -pthread
CXXFLAGS = $(COMMON_FLAGS) -static
ASM_FLAGS = $(COMMON_FLAGS) -S
VERBOSE_ASM_FLAGS = $(ASM_FLAGS) -fverbose-asm

# Directories for the standard build
BIN_DIR?= ./bin
ASM_DIR?= ./asm

# Directories for the "without fence" build
BIN_DIR_WO_FENCE?= ./bin_wo_fence
ASM_DIR_WO_FENCE?= ./asm_wo_fence

# Directories for the "without fence, with acquire" build
BIN_DIR_WO_FENCE_acqu?= ./bin_wo_fence_acquire
ASM_DIR_WO_FENCE_acqu?= ./asm_wo_fence_acquire

# The 'all' target builds all three versions: standard, wo_fence, and wo_fence_acquire
all: \
    $(BIN_DIR)/MP_Relax \
    $(ASM_DIR)/MP_Relax.s \
    $(ASM_DIR)/MP_Relax_verbose.s \
    $(BIN_DIR_WO_FENCE)/MP_Relax_no_atomic \
    $(ASM_DIR_WO_FENCE)/MP_Relax.s \
    $(ASM_DIR_WO_FENCE)/MP_Relax_verbose.s \
    $(BIN_DIR_WO_FENCE_acqu)/MP_Relax_wo_fence_acquire \
    $(ASM_DIR_WO_FENCE_acqu)/MP_Relax.s \
    $(ASM_DIR_WO_FENCE_acqu)/MP_Relax_verbose.s

# --- Rules for Standard Build (MP_Relax.cpp) ---
$(BIN_DIR)/MP_Relax: MP_Relax.cpp $(BIN_DIR)
	$(CXX) $(CXXFLAGS) MP_Relax.cpp -o $@

$(ASM_DIR)/MP_Relax.s: MP_Relax.cpp $(ASM_DIR)
	$(CXX) $(ASM_FLAGS) MP_Relax.cpp -o $@

$(ASM_DIR)/MP_Relax_verbose.s: MP_Relax.cpp $(ASM_DIR)
	$(CXX) $(VERBOSE_ASM_FLAGS) MP_Relax.cpp -o $@

# --- Rules for WO_Fence Build (MP_Relax_WO_Fence.cpp) ---
$(BIN_DIR_WO_FENCE)/MP_Relax_no_atomic: MP_Relax_WO_Fence.cpp $(BIN_DIR_WO_FENCE)
	$(CXX) $(CXXFLAGS) MP_Relax_WO_Fence.cpp -o $@

$(ASM_DIR_WO_FENCE)/MP_Relax.s: MP_Relax_WO_Fence.cpp $(ASM_DIR_WO_FENCE)
	$(CXX) $(ASM_FLAGS) MP_Relax_WO_Fence.cpp -o $@

$(ASM_DIR_WO_FENCE)/MP_Relax_verbose.s: MP_Relax_WO_Fence.cpp $(ASM_DIR_WO_FENCE)
	$(CXX) $(VERBOSE_ASM_FLAGS) MP_Relax_WO_Fence.cpp -o $@

# --- Rules for WO_Fence_Acquire Build (MP_Relax_WO_Fence_Acquire.cpp) ---
$(BIN_DIR_WO_FENCE_acqu)/MP_Relax_wo_fence_acquire: MP_Relax_WO_Fence_Acquire.cpp $(BIN_DIR_WO_FENCE_acqu)
	$(CXX) $(CXXFLAGS) MP_Relax_WO_Fence_Acquire.cpp -o $@

$(ASM_DIR_WO_FENCE_acqu)/MP_Relax.s: MP_Relax_WO_Fence_Acquire.cpp $(ASM_DIR_WO_FENCE_acqu)
	$(CXX) $(ASM_FLAGS) MP_Relax_WO_Fence_Acquire.cpp -o $@

$(ASM_DIR_WO_FENCE_acqu)/MP_Relax_verbose.s: MP_Relax_WO_Fence_Acquire.cpp $(ASM_DIR_WO_FENCE_acqu)
	$(CXX) $(VERBOSE_ASM_FLAGS) MP_Relax_WO_Fence_Acquire.cpp -o $@

# --- Directory Creation Rules ---
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(ASM_DIR):
	mkdir -p $(ASM_DIR)

$(BIN_DIR_WO_FENCE):
	mkdir -p $(BIN_DIR_WO_FENCE)

$(ASM_DIR_WO_FENCE):
	mkdir -p $(ASM_DIR_WO_FENCE)

$(BIN_DIR_WO_FENCE_acqu):
	mkdir -p $(BIN_DIR_WO_FENCE_acqu)

$(ASM_DIR_WO_FENCE_acqu):
	mkdir -p $(ASM_DIR_WO_FENCE_acqu)

# --- Clean Rule ---
clean:
	rm -rf $(BIN_DIR) $(ASM_DIR)
	rm -rf $(BIN_DIR_WO_FENCE) $(ASM_DIR_WO_FENCE)
	rm -rf $(BIN_DIR_WO_FENCE_acqu) $(ASM_DIR_WO_FENCE_acqu)

.PHONY: all clean