CXX = aarch64-linux-gnu-g++
# CXX = g++
COMMON_FLAGS = -std=c++11 -pthread
CXXFLAGS = $(COMMON_FLAGS) -static
ASM_FLAGS = $(COMMON_FLAGS) -S
VERBOSE_ASM_FLAGS = $(ASM_FLAGS) -fverbose-asm

BIN_DIR ?= ./bin
ASM_DIR ?= ./asm

BIN_DIR_WO_FENCE ?= ./bin_wo_fence
ASM_DIR_WO_FENCE ?= ./asm_wo_fence

all: $(BIN_DIR_WO_FENCE)/IRIW_Relax_no_atomic $(BIN_DIR)/IRIW_Relax $(BIN_DIR)/IRIW_Relax_po_sys \
     $(ASM_DIR_WO_FENCE)/IRIW_Relax.s $(ASM_DIR_WO_FENCE)/IRIW_Relax_verbose.s \
     $(ASM_DIR)/IRIW_Relax.s $(ASM_DIR)/IRIW_Relax_verbose.s \
     $(ASM_DIR)/IRIW_Relax_po_sys.s $(ASM_DIR)/IRIW_Relax_po_sys_verbose.s

# Compilazione del file senza fence
$(BIN_DIR_WO_FENCE)/IRIW_Relax_no_atomic: IRIW_Relax_WO_Fence.cpp $(BIN_DIR_WO_FENCE)
	$(CXX) $(CXXFLAGS) IRIW_Relax_WO_Fence.cpp -o $(BIN_DIR_WO_FENCE)/IRIW_Relax_no_atomic

# Compilazione della versione "IRIW_Relax.cpp"
$(BIN_DIR)/IRIW_Relax: IRIW_Relax.cpp $(BIN_DIR)
	$(CXX) $(CXXFLAGS) IRIW_Relax.cpp -o $(BIN_DIR)/IRIW_Relax

# Compilazione della versione "IRIW_Relax_po_sys.cpp"
$(BIN_DIR)/IRIW_Relax_po_sys: IRIW_Relax_po_sys.cpp $(BIN_DIR)
	$(CXX) $(CXXFLAGS) IRIW_Relax_po_sys.cpp -o $(BIN_DIR)/IRIW_Relax_po_sys

# Generazione dell'assembly standard
$(ASM_DIR_WO_FENCE)/IRIW_Relax.s: IRIW_Relax_WO_Fence.cpp $(ASM_DIR_WO_FENCE)
	$(CXX) $(ASM_FLAGS) IRIW_Relax_WO_Fence.cpp -o $(ASM_DIR_WO_FENCE)/IRIW_Relax.s

$(ASM_DIR)/IRIW_Relax.s: IRIW_Relax.cpp $(ASM_DIR)
	$(CXX) $(ASM_FLAGS) IRIW_Relax.cpp -o $(ASM_DIR)/IRIW_Relax.s

$(ASM_DIR)/IRIW_Relax_po_sys.s: IRIW_Relax_po_sys.cpp $(ASM_DIR)
	$(CXX) $(ASM_FLAGS) IRIW_Relax_po_sys.cpp -o $(ASM_DIR)/IRIW_Relax_po_sys.s

# Generazione dell'assembly verboso con commenti
$(ASM_DIR_WO_FENCE)/IRIW_Relax_verbose.s: IRIW_Relax_WO_Fence.cpp $(ASM_DIR_WO_FENCE)
	$(CXX) $(VERBOSE_ASM_FLAGS) IRIW_Relax_WO_Fence.cpp -o $(ASM_DIR_WO_FENCE)/IRIW_Relax_verbose.s

$(ASM_DIR)/IRIW_Relax_verbose.s: IRIW_Relax.cpp $(ASM_DIR)
	$(CXX) $(VERBOSE_ASM_FLAGS) IRIW_Relax.cpp -o $(ASM_DIR)/IRIW_Relax_verbose.s

$(ASM_DIR)/IRIW_Relax_po_sys_verbose.s: IRIW_Relax_po_sys.cpp $(ASM_DIR)
	$(CXX) $(VERBOSE_ASM_FLAGS) IRIW_Relax_po_sys.cpp -o $(ASM_DIR)/IRIW_Relax_po_sys_verbose.s

# Directory di output
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
