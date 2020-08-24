-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_1 -sv \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_1 -sv \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_3 -sv \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_processing_system7_0_0/sim/design_ocr_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/axi_lite_ipif_v3_0_4 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/interrupt_control_v3_1_4 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_gpio_v2_0_17 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/c450/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_0_0/sim/design_ocr_axi_gpio_0_0.vhd" \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_1_0/sim/design_ocr_axi_gpio_1_0.vhd" \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_2_0/sim/design_ocr_axi_gpio_2_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ipshared/5f95/hdl/neural_network_v1_0_S00_AXI.v" \
  "../../../bd/design_ocr/ipshared/5f95/hdl/neural_network_v1_0.v" \
  "../../../bd/design_ocr/ip/design_ocr_neural_network_0_0/sim/design_ocr_neural_network_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_0_1/sim/design_ocr_axi_gpio_0_1.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_clk_wiz_0_0/design_ocr_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/design_ocr/ip/design_ocr_clk_wiz_0_0/design_ocr_clk_wiz_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_out1_0/sim/design_ocr_axi_gpio_out1_0.vhd" \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_out1_1/sim/design_ocr_axi_gpio_out1_1.vhd" \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_out1_2/sim/design_ocr_axi_gpio_out1_2.vhd" \
  "../../../bd/design_ocr/ip/design_ocr_axi_gpio_0_2/sim/design_ocr_axi_gpio_0_2.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_rst_ps7_0_100M_0/sim/design_ocr_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_15 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_14 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_16 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/c631/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_xbar_0/sim/design_ocr_xbar_0.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_15 \
  "../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_ocr/ip/design_ocr_auto_pc_0/sim/design_ocr_auto_pc_0.v" \
  "../../../bd/design_ocr/sim/design_ocr.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

