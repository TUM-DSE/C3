# Makefile for Litmus Tests
# This makefile handles compilation of all litmus tests in subdirectories

# Directories containing litmus tests
TEST_DIRS = IRIW LB MP SB

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -pthread -O0

# Default target builds all tests
all: $(TEST_DIRS)

# Rules for each test directory
IRIW: 
	@echo "Building IRIW tests..."
	$(MAKE) -C IRIW clean
	$(MAKE) -C IRIW

LB:
	@echo "Building LB tests..."
	$(MAKE) -C LB clean
	$(MAKE) -C LB

MP:
	@echo "Building MP tests..."
	$(MAKE) -C MP clean
	$(MAKE) -C MP

SB:
	@echo "Building SB tests..."
	$(MAKE) -C SB clean
	$(MAKE) -C SB

# Clean all test directories
clean:
	@echo "Cleaning all tests..."
	$(MAKE) -C IRIW clean
	$(MAKE) -C LB clean
	$(MAKE) -C MP clean
	$(MAKE) -C SB clean

# In case the subdirectories don't have makefiles, here's an alternative approach:
# Uncomment and modify these rules if needed

# File patterns and output file names
#RELAX_FILES = $(wildcard */*/Relax.cpp)
#WO_FENCE_FILES = $(wildcard */*/Relax_WO_Fence.cpp)
#RELAX_TARGETS = $(RELAX_FILES:.cpp=)
#WO_FENCE_TARGETS = $(WO_FENCE_FILES:.cpp=)

# Alternative build rules
#alt-all: alt-clean alt-build

#alt-build: $(RELAX_TARGETS) $(WO_FENCE_TARGETS)

#%_Relax: %_Relax.cpp
#	$(CXX) $(CXXFLAGS) -o $@ $<

#%_Relax_WO_Fence: %_Relax_WO_Fence.cpp
#	$(CXX) $(CXXFLAGS) -o $@ $<

#alt-clean:
#	rm -f */*/Relax */*/Relax_WO_Fence

# Ensure these targets are treated as phony (not file names)
.PHONY: all clean $(TEST_DIRS)