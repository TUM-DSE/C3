## Make File Framed by: Sukarn Agarwal (Email: sagarwa2@ed.ac.uk)

HIP_PATH?= /opt/rocm-4.0.1/hip
HIPCC=$(HIP_PATH)/bin/hipcc

BIN_DIR?= ./bin

SB_Relax: $(BIN_DIR)/SB_Relax

$(BIN_DIR)/SB_Relax: SB_Relax.cpp $(BIN_DIR)
	$(HIPCC) --amdgpu-target=gfx801,gfx803 $(CXXFLAGS) SB_Relax.cpp -o $(BIN_DIR)/SB_Relax
		
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BIN_DIR)

.PHONY: SB_Relax clean

