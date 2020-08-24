vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_protocol_checker_v2_0_1
vlib activehdl/axi_vip_v1_1_1
vlib activehdl/processing_system7_vip_v1_0_3
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_17
vlib activehdl/proc_sys_reset_v5_0_12
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_15
vlib activehdl/fifo_generator_v13_2_1
vlib activehdl/axi_data_fifo_v2_1_14
vlib activehdl/axi_crossbar_v2_1_16
vlib activehdl/axi_protocol_converter_v2_1_15

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_1 activehdl/axi_protocol_checker_v2_0_1
vmap axi_vip_v1_1_1 activehdl/axi_vip_v1_1_1
vmap processing_system7_vip_v1_0_3 activehdl/processing_system7_vip_v1_0_3
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_17 activehdl/axi_gpio_v2_0_17
vmap proc_sys_reset_v5_0_12 activehdl/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_15 activehdl/axi_register_slice_v2_1_15
vmap fifo_generator_v13_2_1 activehdl/fifo_generator_v13_2_1
vmap axi_data_fifo_v2_1_14 activehdl/axi_data_fifo_v2_1_14
vmap axi_crossbar_v2_1_16 activehdl/axi_crossbar_v2_1_16
vmap axi_protocol_converter_v2_1_15 activehdl/axi_protocol_converter_v2_1_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_ocr/ip/design_ocr_processing_system7_0_0/sim/design_ocr_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_17 -93 \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/c450/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_0_0/sim/design_ocr_axi_gpio_0_0.vhd" \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_1_0/sim/design_ocr_axi_gpio_1_0.vhd" \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_2_0/sim/design_ocr_axi_gpio_2_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_ocr/ipshared/5f95/hdl/neural_network_v1_0_S00_AXI.v" \
"../../../bd/design_ocr/ipshared/5f95/hdl/neural_network_v1_0.v" \
"../../../bd/design_ocr/ip/design_ocr_neural_network_0_0/sim/design_ocr_neural_network_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_0_1/sim/design_ocr_axi_gpio_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_ocr/ip/design_ocr_clk_wiz_0_0/design_ocr_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_ocr/ip/design_ocr_clk_wiz_0_0/design_ocr_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_out1_0/sim/design_ocr_axi_gpio_out1_0.vhd" \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_out1_1/sim/design_ocr_axi_gpio_out1_1.vhd" \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_out1_2/sim/design_ocr_axi_gpio_out1_2.vhd" \
"../../../bd/design_ocr/ip/design_ocr_axi_gpio_0_2/sim/design_ocr_axi_gpio_0_2.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_ocr/ip/design_ocr_rst_ps7_0_100M_0/sim/design_ocr_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_15  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_1 -93 \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_14  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_16  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/c631/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_ocr/ip/design_ocr_xbar_0/sim/design_ocr_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_15  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/ec67/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/02c8/hdl/verilog" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/1313/hdl" "+incdir+../../../../OCR_FPGA.srcs/sources_1/bd/design_ocr/ipshared/4868" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_ocr/ip/design_ocr_auto_pc_0/sim/design_ocr_auto_pc_0.v" \
"../../../bd/design_ocr/sim/design_ocr.v" \

vlog -work xil_defaultlib \
"glbl.v"

