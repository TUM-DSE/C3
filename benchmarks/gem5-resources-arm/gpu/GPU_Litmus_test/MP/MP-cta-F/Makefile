## Make File Framed by: Sukarn Agarwal (Email: sagarwa2@ed.ac.uk)



HIP_PATH?= /opt/rocm-4.0.1/hip
HIPCC=$(HIP_PATH)/bin/hipcc

BIN_DIR?= ./bin
	
MP_RelAcq_Wg_Scope: $(BIN_DIR)/MP_RelAcq_Wg_Scope

$(BIN_DIR)/MP_RelAcq_Wg_Scope: MP_RelAcq_Wg_Scope.cpp $(BIN_DIR)
	$(HIPCC) --amdgpu-target=gfx801,gfx803 $(CXXFLAGS) MP_RelAcq_Wg_Scope.cpp -o $(BIN_DIR)/MP_RelAcq_Wg_Scope	
	
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BIN_DIR)

.PHONY: MP_RelAcq_Wg_Scope clean
