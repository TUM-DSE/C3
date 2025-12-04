CXX = aarch64-linux-gnu-g++
# CXX = g++
COMMON_FLAGS = -std=c++11 -pthread
CXXFLAGS = $(COMMON_FLAGS) -static
ASM_FLAGS = $(COMMON_FLAGS) -S
VERBOSE_ASM_FLAGS = $(ASM_FLAGS) -fverbose-asm

BIN_DIR?= ./bin
ASM_DIR?= ./asm

BIN_DIR_WO_FENCE?= ./bin_wo_fence
ASM_DIR_WO_FENCE?= ./asm_wo_fence

all: $(BIN_DIR_WO_FENCE)/SB_Relax_no_atomic $(ASM_DIR_WO_FENCE)/SB_Relax.s $(ASM_DIR_WO_FENCE)/SB_Relax_verbose.s $(BIN_DIR)/SB_Relax $(ASM_DIR)/SB_Relax.s $(ASM_DIR)/SB_Relax_verbose.s

$(BIN_DIR_WO_FENCE)/SB_Relax_no_atomic: SB_Relax_WO_Fence.cpp $(BIN_DIR_WO_FENCE)
	$(CXX) $(CXXFLAGS) SB_Relax_WO_Fence.cpp -o $(BIN_DIR_WO_FENCE)/SB_Relax_no_atomic

$(BIN_DIR)/SB_Relax: SB_Relax.cpp $(BIN_DIR)
	$(CXX) $(CXXFLAGS) SB_Relax.cpp -o $(BIN_DIR)/SB_Relax

# Generate standard assembly output
$(ASM_DIR_WO_FENCE)/SB_Relax.s: SB_Relax_WO_Fence.cpp $(ASM_DIR_WO_FENCE)
	$(CXX) $(ASM_FLAGS) SB_Relax_WO_Fence.cpp -o $(ASM_DIR_WO_FENCE)/SB_Relax.s

$(ASM_DIR)/SB_Relax.s: SB_Relax.cpp $(ASM_DIR)
	$(CXX) $(ASM_FLAGS) SB_Relax.cpp -o $(ASM_DIR)/SB_Relax.s

# Generate verbose assembly output with source code comments
$(ASM_DIR_WO_FENCE)/SB_Relax_verbose.s: SB_Relax_WO_Fence.cpp $(ASM_DIR_WO_FENCE)
	$(CXX) $(VERBOSE_ASM_FLAGS) SB_Relax_WO_Fence.cpp -o $(ASM_DIR_WO_FENCE)/SB_Relax_verbose.s

$(ASM_DIR)/SB_Relax_verbose.s: SB_Relax.cpp $(ASM_DIR)
	$(CXX) $(VERBOSE_ASM_FLAGS) SB_Relax.cpp -o $(ASM_DIR)/SB_Relax_verbose.s
    
$(BIN_DIR_WO_FENCE):
	mkdir -p $(BIN_DIR_WO_FENCE)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(ASM_DIR_WO_FENCE):
	mkdir -p $(ASM_DIR_WO_FENCE)

$(ASM_DIR):
	mkdir -p $(ASM_DIR)

clean:
	rm -rf $(BIN_DIR_WO_FENCE) $(ASM_DIR_WO_FENCE)
	rm -rf $(BIN_DIR) $(ASM_DIR)

.PHONY: all clean