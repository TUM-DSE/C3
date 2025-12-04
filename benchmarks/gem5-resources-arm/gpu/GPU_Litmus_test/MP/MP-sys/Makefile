## Make File Framed by: Sukarn Agarwal (Email: sagarwa2@ed.ac.uk)



HIP_PATH?= /opt/rocm-4.0.1/hip
HIPCC=$(HIP_PATH)/bin/hipcc

BIN_DIR?= ./bin
	
MP_Relax: $(BIN_DIR)/MP_Relax

$(BIN_DIR)/MP_Relax: MP_Relax.cpp $(BIN_DIR)
	$(HIPCC) --amdgpu-target=gfx801,gfx803 $(CXXFLAGS) MP_Relax.cpp -o $(BIN_DIR)/MP_Relax	
	
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BIN_DIR)

.PHONY: MP_Relax clean
