// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Aug 26 19:13:14 2020
// Host        : Mateusz-HP running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               G:/studia/fpga/project_sdup_ocr/OCR_FPGA/OCR_FPGA.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,locked,clk_in1" */;
  output clk;
  input reset;
  output locked;
  input clk_in1;
endmodule
