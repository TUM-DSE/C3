## Make File Framed by: Sukarn Agarwal (Email: sagarwa2@ed.ac.uk)



HIP_PATH?= /opt/rocm-4.0.1/hip
HIPCC=$(HIP_PATH)/bin/hipcc

BIN_DIR?= ./bin

SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation : $(BIN_DIR)/SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation 

$(BIN_DIR)/SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation : SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation.cpp $(BIN_DIR)
	$(HIPCC) --amdgpu-target=gfx801,gfx803,gfx900 $(CXXFLAGS) SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation.cpp -o $(BIN_DIR)/SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation
	
	
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BIN_DIR)

.PHONY: SB_Rel_Acq_GPU_WO_ATOMIC_SWMR_voilation  clean
