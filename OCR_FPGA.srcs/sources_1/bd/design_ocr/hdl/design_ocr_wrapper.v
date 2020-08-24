//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Fri Aug 21 16:16:24 2020
//Host        : Mateusz-HP running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_ocr_wrapper.bd
//Design      : design_ocr_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_ocr_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    gpio_expected_tri_io,
    gpio_in_tri_io,
    gpio_mode_tri_io,
    gpio_out1_tri_io,
    gpio_out2_tri_io,
    gpio_out3_tri_io,
    gpio_out4_tri_io,
    leds_8bits_tri_io,
    reset_rtl,
    sws_8bits_tri_i,
    sys_clock);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  inout [3:0]gpio_expected_tri_io;
  inout [15:0]gpio_in_tri_io;
  inout [0:0]gpio_mode_tri_io;
  inout [17:0]gpio_out1_tri_io;
  inout [17:0]gpio_out2_tri_io;
  inout [17:0]gpio_out3_tri_io;
  inout [17:0]gpio_out4_tri_io;
  inout [7:0]leds_8bits_tri_io;
  input reset_rtl;
  input [7:0]sws_8bits_tri_i;
  input sys_clock;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [0:0]gpio_expected_tri_i_0;
  wire [1:1]gpio_expected_tri_i_1;
  wire [2:2]gpio_expected_tri_i_2;
  wire [3:3]gpio_expected_tri_i_3;
  wire [0:0]gpio_expected_tri_io_0;
  wire [1:1]gpio_expected_tri_io_1;
  wire [2:2]gpio_expected_tri_io_2;
  wire [3:3]gpio_expected_tri_io_3;
  wire [0:0]gpio_expected_tri_o_0;
  wire [1:1]gpio_expected_tri_o_1;
  wire [2:2]gpio_expected_tri_o_2;
  wire [3:3]gpio_expected_tri_o_3;
  wire [0:0]gpio_expected_tri_t_0;
  wire [1:1]gpio_expected_tri_t_1;
  wire [2:2]gpio_expected_tri_t_2;
  wire [3:3]gpio_expected_tri_t_3;
  wire [0:0]gpio_in_tri_i_0;
  wire [1:1]gpio_in_tri_i_1;
  wire [10:10]gpio_in_tri_i_10;
  wire [11:11]gpio_in_tri_i_11;
  wire [12:12]gpio_in_tri_i_12;
  wire [13:13]gpio_in_tri_i_13;
  wire [14:14]gpio_in_tri_i_14;
  wire [15:15]gpio_in_tri_i_15;
  wire [2:2]gpio_in_tri_i_2;
  wire [3:3]gpio_in_tri_i_3;
  wire [4:4]gpio_in_tri_i_4;
  wire [5:5]gpio_in_tri_i_5;
  wire [6:6]gpio_in_tri_i_6;
  wire [7:7]gpio_in_tri_i_7;
  wire [8:8]gpio_in_tri_i_8;
  wire [9:9]gpio_in_tri_i_9;
  wire [0:0]gpio_in_tri_io_0;
  wire [1:1]gpio_in_tri_io_1;
  wire [10:10]gpio_in_tri_io_10;
  wire [11:11]gpio_in_tri_io_11;
  wire [12:12]gpio_in_tri_io_12;
  wire [13:13]gpio_in_tri_io_13;
  wire [14:14]gpio_in_tri_io_14;
  wire [15:15]gpio_in_tri_io_15;
  wire [2:2]gpio_in_tri_io_2;
  wire [3:3]gpio_in_tri_io_3;
  wire [4:4]gpio_in_tri_io_4;
  wire [5:5]gpio_in_tri_io_5;
  wire [6:6]gpio_in_tri_io_6;
  wire [7:7]gpio_in_tri_io_7;
  wire [8:8]gpio_in_tri_io_8;
  wire [9:9]gpio_in_tri_io_9;
  wire [0:0]gpio_in_tri_o_0;
  wire [1:1]gpio_in_tri_o_1;
  wire [10:10]gpio_in_tri_o_10;
  wire [11:11]gpio_in_tri_o_11;
  wire [12:12]gpio_in_tri_o_12;
  wire [13:13]gpio_in_tri_o_13;
  wire [14:14]gpio_in_tri_o_14;
  wire [15:15]gpio_in_tri_o_15;
  wire [2:2]gpio_in_tri_o_2;
  wire [3:3]gpio_in_tri_o_3;
  wire [4:4]gpio_in_tri_o_4;
  wire [5:5]gpio_in_tri_o_5;
  wire [6:6]gpio_in_tri_o_6;
  wire [7:7]gpio_in_tri_o_7;
  wire [8:8]gpio_in_tri_o_8;
  wire [9:9]gpio_in_tri_o_9;
  wire [0:0]gpio_in_tri_t_0;
  wire [1:1]gpio_in_tri_t_1;
  wire [10:10]gpio_in_tri_t_10;
  wire [11:11]gpio_in_tri_t_11;
  wire [12:12]gpio_in_tri_t_12;
  wire [13:13]gpio_in_tri_t_13;
  wire [14:14]gpio_in_tri_t_14;
  wire [15:15]gpio_in_tri_t_15;
  wire [2:2]gpio_in_tri_t_2;
  wire [3:3]gpio_in_tri_t_3;
  wire [4:4]gpio_in_tri_t_4;
  wire [5:5]gpio_in_tri_t_5;
  wire [6:6]gpio_in_tri_t_6;
  wire [7:7]gpio_in_tri_t_7;
  wire [8:8]gpio_in_tri_t_8;
  wire [9:9]gpio_in_tri_t_9;
  wire [0:0]gpio_mode_tri_i_0;
  wire [0:0]gpio_mode_tri_io_0;
  wire [0:0]gpio_mode_tri_o_0;
  wire [0:0]gpio_mode_tri_t_0;
  wire [0:0]gpio_out1_tri_i_0;
  wire [1:1]gpio_out1_tri_i_1;
  wire [10:10]gpio_out1_tri_i_10;
  wire [11:11]gpio_out1_tri_i_11;
  wire [12:12]gpio_out1_tri_i_12;
  wire [13:13]gpio_out1_tri_i_13;
  wire [14:14]gpio_out1_tri_i_14;
  wire [15:15]gpio_out1_tri_i_15;
  wire [16:16]gpio_out1_tri_i_16;
  wire [17:17]gpio_out1_tri_i_17;
  wire [2:2]gpio_out1_tri_i_2;
  wire [3:3]gpio_out1_tri_i_3;
  wire [4:4]gpio_out1_tri_i_4;
  wire [5:5]gpio_out1_tri_i_5;
  wire [6:6]gpio_out1_tri_i_6;
  wire [7:7]gpio_out1_tri_i_7;
  wire [8:8]gpio_out1_tri_i_8;
  wire [9:9]gpio_out1_tri_i_9;
  wire [0:0]gpio_out1_tri_io_0;
  wire [1:1]gpio_out1_tri_io_1;
  wire [10:10]gpio_out1_tri_io_10;
  wire [11:11]gpio_out1_tri_io_11;
  wire [12:12]gpio_out1_tri_io_12;
  wire [13:13]gpio_out1_tri_io_13;
  wire [14:14]gpio_out1_tri_io_14;
  wire [15:15]gpio_out1_tri_io_15;
  wire [16:16]gpio_out1_tri_io_16;
  wire [17:17]gpio_out1_tri_io_17;
  wire [2:2]gpio_out1_tri_io_2;
  wire [3:3]gpio_out1_tri_io_3;
  wire [4:4]gpio_out1_tri_io_4;
  wire [5:5]gpio_out1_tri_io_5;
  wire [6:6]gpio_out1_tri_io_6;
  wire [7:7]gpio_out1_tri_io_7;
  wire [8:8]gpio_out1_tri_io_8;
  wire [9:9]gpio_out1_tri_io_9;
  wire [0:0]gpio_out1_tri_o_0;
  wire [1:1]gpio_out1_tri_o_1;
  wire [10:10]gpio_out1_tri_o_10;
  wire [11:11]gpio_out1_tri_o_11;
  wire [12:12]gpio_out1_tri_o_12;
  wire [13:13]gpio_out1_tri_o_13;
  wire [14:14]gpio_out1_tri_o_14;
  wire [15:15]gpio_out1_tri_o_15;
  wire [16:16]gpio_out1_tri_o_16;
  wire [17:17]gpio_out1_tri_o_17;
  wire [2:2]gpio_out1_tri_o_2;
  wire [3:3]gpio_out1_tri_o_3;
  wire [4:4]gpio_out1_tri_o_4;
  wire [5:5]gpio_out1_tri_o_5;
  wire [6:6]gpio_out1_tri_o_6;
  wire [7:7]gpio_out1_tri_o_7;
  wire [8:8]gpio_out1_tri_o_8;
  wire [9:9]gpio_out1_tri_o_9;
  wire [0:0]gpio_out1_tri_t_0;
  wire [1:1]gpio_out1_tri_t_1;
  wire [10:10]gpio_out1_tri_t_10;
  wire [11:11]gpio_out1_tri_t_11;
  wire [12:12]gpio_out1_tri_t_12;
  wire [13:13]gpio_out1_tri_t_13;
  wire [14:14]gpio_out1_tri_t_14;
  wire [15:15]gpio_out1_tri_t_15;
  wire [16:16]gpio_out1_tri_t_16;
  wire [17:17]gpio_out1_tri_t_17;
  wire [2:2]gpio_out1_tri_t_2;
  wire [3:3]gpio_out1_tri_t_3;
  wire [4:4]gpio_out1_tri_t_4;
  wire [5:5]gpio_out1_tri_t_5;
  wire [6:6]gpio_out1_tri_t_6;
  wire [7:7]gpio_out1_tri_t_7;
  wire [8:8]gpio_out1_tri_t_8;
  wire [9:9]gpio_out1_tri_t_9;
  wire [0:0]gpio_out2_tri_i_0;
  wire [1:1]gpio_out2_tri_i_1;
  wire [10:10]gpio_out2_tri_i_10;
  wire [11:11]gpio_out2_tri_i_11;
  wire [12:12]gpio_out2_tri_i_12;
  wire [13:13]gpio_out2_tri_i_13;
  wire [14:14]gpio_out2_tri_i_14;
  wire [15:15]gpio_out2_tri_i_15;
  wire [16:16]gpio_out2_tri_i_16;
  wire [17:17]gpio_out2_tri_i_17;
  wire [2:2]gpio_out2_tri_i_2;
  wire [3:3]gpio_out2_tri_i_3;
  wire [4:4]gpio_out2_tri_i_4;
  wire [5:5]gpio_out2_tri_i_5;
  wire [6:6]gpio_out2_tri_i_6;
  wire [7:7]gpio_out2_tri_i_7;
  wire [8:8]gpio_out2_tri_i_8;
  wire [9:9]gpio_out2_tri_i_9;
  wire [0:0]gpio_out2_tri_io_0;
  wire [1:1]gpio_out2_tri_io_1;
  wire [10:10]gpio_out2_tri_io_10;
  wire [11:11]gpio_out2_tri_io_11;
  wire [12:12]gpio_out2_tri_io_12;
  wire [13:13]gpio_out2_tri_io_13;
  wire [14:14]gpio_out2_tri_io_14;
  wire [15:15]gpio_out2_tri_io_15;
  wire [16:16]gpio_out2_tri_io_16;
  wire [17:17]gpio_out2_tri_io_17;
  wire [2:2]gpio_out2_tri_io_2;
  wire [3:3]gpio_out2_tri_io_3;
  wire [4:4]gpio_out2_tri_io_4;
  wire [5:5]gpio_out2_tri_io_5;
  wire [6:6]gpio_out2_tri_io_6;
  wire [7:7]gpio_out2_tri_io_7;
  wire [8:8]gpio_out2_tri_io_8;
  wire [9:9]gpio_out2_tri_io_9;
  wire [0:0]gpio_out2_tri_o_0;
  wire [1:1]gpio_out2_tri_o_1;
  wire [10:10]gpio_out2_tri_o_10;
  wire [11:11]gpio_out2_tri_o_11;
  wire [12:12]gpio_out2_tri_o_12;
  wire [13:13]gpio_out2_tri_o_13;
  wire [14:14]gpio_out2_tri_o_14;
  wire [15:15]gpio_out2_tri_o_15;
  wire [16:16]gpio_out2_tri_o_16;
  wire [17:17]gpio_out2_tri_o_17;
  wire [2:2]gpio_out2_tri_o_2;
  wire [3:3]gpio_out2_tri_o_3;
  wire [4:4]gpio_out2_tri_o_4;
  wire [5:5]gpio_out2_tri_o_5;
  wire [6:6]gpio_out2_tri_o_6;
  wire [7:7]gpio_out2_tri_o_7;
  wire [8:8]gpio_out2_tri_o_8;
  wire [9:9]gpio_out2_tri_o_9;
  wire [0:0]gpio_out2_tri_t_0;
  wire [1:1]gpio_out2_tri_t_1;
  wire [10:10]gpio_out2_tri_t_10;
  wire [11:11]gpio_out2_tri_t_11;
  wire [12:12]gpio_out2_tri_t_12;
  wire [13:13]gpio_out2_tri_t_13;
  wire [14:14]gpio_out2_tri_t_14;
  wire [15:15]gpio_out2_tri_t_15;
  wire [16:16]gpio_out2_tri_t_16;
  wire [17:17]gpio_out2_tri_t_17;
  wire [2:2]gpio_out2_tri_t_2;
  wire [3:3]gpio_out2_tri_t_3;
  wire [4:4]gpio_out2_tri_t_4;
  wire [5:5]gpio_out2_tri_t_5;
  wire [6:6]gpio_out2_tri_t_6;
  wire [7:7]gpio_out2_tri_t_7;
  wire [8:8]gpio_out2_tri_t_8;
  wire [9:9]gpio_out2_tri_t_9;
  wire [0:0]gpio_out3_tri_i_0;
  wire [1:1]gpio_out3_tri_i_1;
  wire [10:10]gpio_out3_tri_i_10;
  wire [11:11]gpio_out3_tri_i_11;
  wire [12:12]gpio_out3_tri_i_12;
  wire [13:13]gpio_out3_tri_i_13;
  wire [14:14]gpio_out3_tri_i_14;
  wire [15:15]gpio_out3_tri_i_15;
  wire [16:16]gpio_out3_tri_i_16;
  wire [17:17]gpio_out3_tri_i_17;
  wire [2:2]gpio_out3_tri_i_2;
  wire [3:3]gpio_out3_tri_i_3;
  wire [4:4]gpio_out3_tri_i_4;
  wire [5:5]gpio_out3_tri_i_5;
  wire [6:6]gpio_out3_tri_i_6;
  wire [7:7]gpio_out3_tri_i_7;
  wire [8:8]gpio_out3_tri_i_8;
  wire [9:9]gpio_out3_tri_i_9;
  wire [0:0]gpio_out3_tri_io_0;
  wire [1:1]gpio_out3_tri_io_1;
  wire [10:10]gpio_out3_tri_io_10;
  wire [11:11]gpio_out3_tri_io_11;
  wire [12:12]gpio_out3_tri_io_12;
  wire [13:13]gpio_out3_tri_io_13;
  wire [14:14]gpio_out3_tri_io_14;
  wire [15:15]gpio_out3_tri_io_15;
  wire [16:16]gpio_out3_tri_io_16;
  wire [17:17]gpio_out3_tri_io_17;
  wire [2:2]gpio_out3_tri_io_2;
  wire [3:3]gpio_out3_tri_io_3;
  wire [4:4]gpio_out3_tri_io_4;
  wire [5:5]gpio_out3_tri_io_5;
  wire [6:6]gpio_out3_tri_io_6;
  wire [7:7]gpio_out3_tri_io_7;
  wire [8:8]gpio_out3_tri_io_8;
  wire [9:9]gpio_out3_tri_io_9;
  wire [0:0]gpio_out3_tri_o_0;
  wire [1:1]gpio_out3_tri_o_1;
  wire [10:10]gpio_out3_tri_o_10;
  wire [11:11]gpio_out3_tri_o_11;
  wire [12:12]gpio_out3_tri_o_12;
  wire [13:13]gpio_out3_tri_o_13;
  wire [14:14]gpio_out3_tri_o_14;
  wire [15:15]gpio_out3_tri_o_15;
  wire [16:16]gpio_out3_tri_o_16;
  wire [17:17]gpio_out3_tri_o_17;
  wire [2:2]gpio_out3_tri_o_2;
  wire [3:3]gpio_out3_tri_o_3;
  wire [4:4]gpio_out3_tri_o_4;
  wire [5:5]gpio_out3_tri_o_5;
  wire [6:6]gpio_out3_tri_o_6;
  wire [7:7]gpio_out3_tri_o_7;
  wire [8:8]gpio_out3_tri_o_8;
  wire [9:9]gpio_out3_tri_o_9;
  wire [0:0]gpio_out3_tri_t_0;
  wire [1:1]gpio_out3_tri_t_1;
  wire [10:10]gpio_out3_tri_t_10;
  wire [11:11]gpio_out3_tri_t_11;
  wire [12:12]gpio_out3_tri_t_12;
  wire [13:13]gpio_out3_tri_t_13;
  wire [14:14]gpio_out3_tri_t_14;
  wire [15:15]gpio_out3_tri_t_15;
  wire [16:16]gpio_out3_tri_t_16;
  wire [17:17]gpio_out3_tri_t_17;
  wire [2:2]gpio_out3_tri_t_2;
  wire [3:3]gpio_out3_tri_t_3;
  wire [4:4]gpio_out3_tri_t_4;
  wire [5:5]gpio_out3_tri_t_5;
  wire [6:6]gpio_out3_tri_t_6;
  wire [7:7]gpio_out3_tri_t_7;
  wire [8:8]gpio_out3_tri_t_8;
  wire [9:9]gpio_out3_tri_t_9;
  wire [0:0]gpio_out4_tri_i_0;
  wire [1:1]gpio_out4_tri_i_1;
  wire [10:10]gpio_out4_tri_i_10;
  wire [11:11]gpio_out4_tri_i_11;
  wire [12:12]gpio_out4_tri_i_12;
  wire [13:13]gpio_out4_tri_i_13;
  wire [14:14]gpio_out4_tri_i_14;
  wire [15:15]gpio_out4_tri_i_15;
  wire [16:16]gpio_out4_tri_i_16;
  wire [17:17]gpio_out4_tri_i_17;
  wire [2:2]gpio_out4_tri_i_2;
  wire [3:3]gpio_out4_tri_i_3;
  wire [4:4]gpio_out4_tri_i_4;
  wire [5:5]gpio_out4_tri_i_5;
  wire [6:6]gpio_out4_tri_i_6;
  wire [7:7]gpio_out4_tri_i_7;
  wire [8:8]gpio_out4_tri_i_8;
  wire [9:9]gpio_out4_tri_i_9;
  wire [0:0]gpio_out4_tri_io_0;
  wire [1:1]gpio_out4_tri_io_1;
  wire [10:10]gpio_out4_tri_io_10;
  wire [11:11]gpio_out4_tri_io_11;
  wire [12:12]gpio_out4_tri_io_12;
  wire [13:13]gpio_out4_tri_io_13;
  wire [14:14]gpio_out4_tri_io_14;
  wire [15:15]gpio_out4_tri_io_15;
  wire [16:16]gpio_out4_tri_io_16;
  wire [17:17]gpio_out4_tri_io_17;
  wire [2:2]gpio_out4_tri_io_2;
  wire [3:3]gpio_out4_tri_io_3;
  wire [4:4]gpio_out4_tri_io_4;
  wire [5:5]gpio_out4_tri_io_5;
  wire [6:6]gpio_out4_tri_io_6;
  wire [7:7]gpio_out4_tri_io_7;
  wire [8:8]gpio_out4_tri_io_8;
  wire [9:9]gpio_out4_tri_io_9;
  wire [0:0]gpio_out4_tri_o_0;
  wire [1:1]gpio_out4_tri_o_1;
  wire [10:10]gpio_out4_tri_o_10;
  wire [11:11]gpio_out4_tri_o_11;
  wire [12:12]gpio_out4_tri_o_12;
  wire [13:13]gpio_out4_tri_o_13;
  wire [14:14]gpio_out4_tri_o_14;
  wire [15:15]gpio_out4_tri_o_15;
  wire [16:16]gpio_out4_tri_o_16;
  wire [17:17]gpio_out4_tri_o_17;
  wire [2:2]gpio_out4_tri_o_2;
  wire [3:3]gpio_out4_tri_o_3;
  wire [4:4]gpio_out4_tri_o_4;
  wire [5:5]gpio_out4_tri_o_5;
  wire [6:6]gpio_out4_tri_o_6;
  wire [7:7]gpio_out4_tri_o_7;
  wire [8:8]gpio_out4_tri_o_8;
  wire [9:9]gpio_out4_tri_o_9;
  wire [0:0]gpio_out4_tri_t_0;
  wire [1:1]gpio_out4_tri_t_1;
  wire [10:10]gpio_out4_tri_t_10;
  wire [11:11]gpio_out4_tri_t_11;
  wire [12:12]gpio_out4_tri_t_12;
  wire [13:13]gpio_out4_tri_t_13;
  wire [14:14]gpio_out4_tri_t_14;
  wire [15:15]gpio_out4_tri_t_15;
  wire [16:16]gpio_out4_tri_t_16;
  wire [17:17]gpio_out4_tri_t_17;
  wire [2:2]gpio_out4_tri_t_2;
  wire [3:3]gpio_out4_tri_t_3;
  wire [4:4]gpio_out4_tri_t_4;
  wire [5:5]gpio_out4_tri_t_5;
  wire [6:6]gpio_out4_tri_t_6;
  wire [7:7]gpio_out4_tri_t_7;
  wire [8:8]gpio_out4_tri_t_8;
  wire [9:9]gpio_out4_tri_t_9;
  wire [0:0]leds_8bits_tri_i_0;
  wire [1:1]leds_8bits_tri_i_1;
  wire [2:2]leds_8bits_tri_i_2;
  wire [3:3]leds_8bits_tri_i_3;
  wire [4:4]leds_8bits_tri_i_4;
  wire [5:5]leds_8bits_tri_i_5;
  wire [6:6]leds_8bits_tri_i_6;
  wire [7:7]leds_8bits_tri_i_7;
  wire [0:0]leds_8bits_tri_io_0;
  wire [1:1]leds_8bits_tri_io_1;
  wire [2:2]leds_8bits_tri_io_2;
  wire [3:3]leds_8bits_tri_io_3;
  wire [4:4]leds_8bits_tri_io_4;
  wire [5:5]leds_8bits_tri_io_5;
  wire [6:6]leds_8bits_tri_io_6;
  wire [7:7]leds_8bits_tri_io_7;
  wire [0:0]leds_8bits_tri_o_0;
  wire [1:1]leds_8bits_tri_o_1;
  wire [2:2]leds_8bits_tri_o_2;
  wire [3:3]leds_8bits_tri_o_3;
  wire [4:4]leds_8bits_tri_o_4;
  wire [5:5]leds_8bits_tri_o_5;
  wire [6:6]leds_8bits_tri_o_6;
  wire [7:7]leds_8bits_tri_o_7;
  wire [0:0]leds_8bits_tri_t_0;
  wire [1:1]leds_8bits_tri_t_1;
  wire [2:2]leds_8bits_tri_t_2;
  wire [3:3]leds_8bits_tri_t_3;
  wire [4:4]leds_8bits_tri_t_4;
  wire [5:5]leds_8bits_tri_t_5;
  wire [6:6]leds_8bits_tri_t_6;
  wire [7:7]leds_8bits_tri_t_7;
  wire reset_rtl;
  wire [7:0]sws_8bits_tri_i;
  wire sys_clock;

  design_ocr design_ocr_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .gpio_expected_tri_i({gpio_expected_tri_i_3,gpio_expected_tri_i_2,gpio_expected_tri_i_1,gpio_expected_tri_i_0}),
        .gpio_expected_tri_o({gpio_expected_tri_o_3,gpio_expected_tri_o_2,gpio_expected_tri_o_1,gpio_expected_tri_o_0}),
        .gpio_expected_tri_t({gpio_expected_tri_t_3,gpio_expected_tri_t_2,gpio_expected_tri_t_1,gpio_expected_tri_t_0}),
        .gpio_in_tri_i({gpio_in_tri_i_15,gpio_in_tri_i_14,gpio_in_tri_i_13,gpio_in_tri_i_12,gpio_in_tri_i_11,gpio_in_tri_i_10,gpio_in_tri_i_9,gpio_in_tri_i_8,gpio_in_tri_i_7,gpio_in_tri_i_6,gpio_in_tri_i_5,gpio_in_tri_i_4,gpio_in_tri_i_3,gpio_in_tri_i_2,gpio_in_tri_i_1,gpio_in_tri_i_0}),
        .gpio_in_tri_o({gpio_in_tri_o_15,gpio_in_tri_o_14,gpio_in_tri_o_13,gpio_in_tri_o_12,gpio_in_tri_o_11,gpio_in_tri_o_10,gpio_in_tri_o_9,gpio_in_tri_o_8,gpio_in_tri_o_7,gpio_in_tri_o_6,gpio_in_tri_o_5,gpio_in_tri_o_4,gpio_in_tri_o_3,gpio_in_tri_o_2,gpio_in_tri_o_1,gpio_in_tri_o_0}),
        .gpio_in_tri_t({gpio_in_tri_t_15,gpio_in_tri_t_14,gpio_in_tri_t_13,gpio_in_tri_t_12,gpio_in_tri_t_11,gpio_in_tri_t_10,gpio_in_tri_t_9,gpio_in_tri_t_8,gpio_in_tri_t_7,gpio_in_tri_t_6,gpio_in_tri_t_5,gpio_in_tri_t_4,gpio_in_tri_t_3,gpio_in_tri_t_2,gpio_in_tri_t_1,gpio_in_tri_t_0}),
        .gpio_mode_tri_i(gpio_mode_tri_i_0),
        .gpio_mode_tri_o(gpio_mode_tri_o_0),
        .gpio_mode_tri_t(gpio_mode_tri_t_0),
        .gpio_out1_tri_i({gpio_out1_tri_i_17,gpio_out1_tri_i_16,gpio_out1_tri_i_15,gpio_out1_tri_i_14,gpio_out1_tri_i_13,gpio_out1_tri_i_12,gpio_out1_tri_i_11,gpio_out1_tri_i_10,gpio_out1_tri_i_9,gpio_out1_tri_i_8,gpio_out1_tri_i_7,gpio_out1_tri_i_6,gpio_out1_tri_i_5,gpio_out1_tri_i_4,gpio_out1_tri_i_3,gpio_out1_tri_i_2,gpio_out1_tri_i_1,gpio_out1_tri_i_0}),
        .gpio_out1_tri_o({gpio_out1_tri_o_17,gpio_out1_tri_o_16,gpio_out1_tri_o_15,gpio_out1_tri_o_14,gpio_out1_tri_o_13,gpio_out1_tri_o_12,gpio_out1_tri_o_11,gpio_out1_tri_o_10,gpio_out1_tri_o_9,gpio_out1_tri_o_8,gpio_out1_tri_o_7,gpio_out1_tri_o_6,gpio_out1_tri_o_5,gpio_out1_tri_o_4,gpio_out1_tri_o_3,gpio_out1_tri_o_2,gpio_out1_tri_o_1,gpio_out1_tri_o_0}),
        .gpio_out1_tri_t({gpio_out1_tri_t_17,gpio_out1_tri_t_16,gpio_out1_tri_t_15,gpio_out1_tri_t_14,gpio_out1_tri_t_13,gpio_out1_tri_t_12,gpio_out1_tri_t_11,gpio_out1_tri_t_10,gpio_out1_tri_t_9,gpio_out1_tri_t_8,gpio_out1_tri_t_7,gpio_out1_tri_t_6,gpio_out1_tri_t_5,gpio_out1_tri_t_4,gpio_out1_tri_t_3,gpio_out1_tri_t_2,gpio_out1_tri_t_1,gpio_out1_tri_t_0}),
        .gpio_out2_tri_i({gpio_out2_tri_i_17,gpio_out2_tri_i_16,gpio_out2_tri_i_15,gpio_out2_tri_i_14,gpio_out2_tri_i_13,gpio_out2_tri_i_12,gpio_out2_tri_i_11,gpio_out2_tri_i_10,gpio_out2_tri_i_9,gpio_out2_tri_i_8,gpio_out2_tri_i_7,gpio_out2_tri_i_6,gpio_out2_tri_i_5,gpio_out2_tri_i_4,gpio_out2_tri_i_3,gpio_out2_tri_i_2,gpio_out2_tri_i_1,gpio_out2_tri_i_0}),
        .gpio_out2_tri_o({gpio_out2_tri_o_17,gpio_out2_tri_o_16,gpio_out2_tri_o_15,gpio_out2_tri_o_14,gpio_out2_tri_o_13,gpio_out2_tri_o_12,gpio_out2_tri_o_11,gpio_out2_tri_o_10,gpio_out2_tri_o_9,gpio_out2_tri_o_8,gpio_out2_tri_o_7,gpio_out2_tri_o_6,gpio_out2_tri_o_5,gpio_out2_tri_o_4,gpio_out2_tri_o_3,gpio_out2_tri_o_2,gpio_out2_tri_o_1,gpio_out2_tri_o_0}),
        .gpio_out2_tri_t({gpio_out2_tri_t_17,gpio_out2_tri_t_16,gpio_out2_tri_t_15,gpio_out2_tri_t_14,gpio_out2_tri_t_13,gpio_out2_tri_t_12,gpio_out2_tri_t_11,gpio_out2_tri_t_10,gpio_out2_tri_t_9,gpio_out2_tri_t_8,gpio_out2_tri_t_7,gpio_out2_tri_t_6,gpio_out2_tri_t_5,gpio_out2_tri_t_4,gpio_out2_tri_t_3,gpio_out2_tri_t_2,gpio_out2_tri_t_1,gpio_out2_tri_t_0}),
        .gpio_out3_tri_i({gpio_out3_tri_i_17,gpio_out3_tri_i_16,gpio_out3_tri_i_15,gpio_out3_tri_i_14,gpio_out3_tri_i_13,gpio_out3_tri_i_12,gpio_out3_tri_i_11,gpio_out3_tri_i_10,gpio_out3_tri_i_9,gpio_out3_tri_i_8,gpio_out3_tri_i_7,gpio_out3_tri_i_6,gpio_out3_tri_i_5,gpio_out3_tri_i_4,gpio_out3_tri_i_3,gpio_out3_tri_i_2,gpio_out3_tri_i_1,gpio_out3_tri_i_0}),
        .gpio_out3_tri_o({gpio_out3_tri_o_17,gpio_out3_tri_o_16,gpio_out3_tri_o_15,gpio_out3_tri_o_14,gpio_out3_tri_o_13,gpio_out3_tri_o_12,gpio_out3_tri_o_11,gpio_out3_tri_o_10,gpio_out3_tri_o_9,gpio_out3_tri_o_8,gpio_out3_tri_o_7,gpio_out3_tri_o_6,gpio_out3_tri_o_5,gpio_out3_tri_o_4,gpio_out3_tri_o_3,gpio_out3_tri_o_2,gpio_out3_tri_o_1,gpio_out3_tri_o_0}),
        .gpio_out3_tri_t({gpio_out3_tri_t_17,gpio_out3_tri_t_16,gpio_out3_tri_t_15,gpio_out3_tri_t_14,gpio_out3_tri_t_13,gpio_out3_tri_t_12,gpio_out3_tri_t_11,gpio_out3_tri_t_10,gpio_out3_tri_t_9,gpio_out3_tri_t_8,gpio_out3_tri_t_7,gpio_out3_tri_t_6,gpio_out3_tri_t_5,gpio_out3_tri_t_4,gpio_out3_tri_t_3,gpio_out3_tri_t_2,gpio_out3_tri_t_1,gpio_out3_tri_t_0}),
        .gpio_out4_tri_i({gpio_out4_tri_i_17,gpio_out4_tri_i_16,gpio_out4_tri_i_15,gpio_out4_tri_i_14,gpio_out4_tri_i_13,gpio_out4_tri_i_12,gpio_out4_tri_i_11,gpio_out4_tri_i_10,gpio_out4_tri_i_9,gpio_out4_tri_i_8,gpio_out4_tri_i_7,gpio_out4_tri_i_6,gpio_out4_tri_i_5,gpio_out4_tri_i_4,gpio_out4_tri_i_3,gpio_out4_tri_i_2,gpio_out4_tri_i_1,gpio_out4_tri_i_0}),
        .gpio_out4_tri_o({gpio_out4_tri_o_17,gpio_out4_tri_o_16,gpio_out4_tri_o_15,gpio_out4_tri_o_14,gpio_out4_tri_o_13,gpio_out4_tri_o_12,gpio_out4_tri_o_11,gpio_out4_tri_o_10,gpio_out4_tri_o_9,gpio_out4_tri_o_8,gpio_out4_tri_o_7,gpio_out4_tri_o_6,gpio_out4_tri_o_5,gpio_out4_tri_o_4,gpio_out4_tri_o_3,gpio_out4_tri_o_2,gpio_out4_tri_o_1,gpio_out4_tri_o_0}),
        .gpio_out4_tri_t({gpio_out4_tri_t_17,gpio_out4_tri_t_16,gpio_out4_tri_t_15,gpio_out4_tri_t_14,gpio_out4_tri_t_13,gpio_out4_tri_t_12,gpio_out4_tri_t_11,gpio_out4_tri_t_10,gpio_out4_tri_t_9,gpio_out4_tri_t_8,gpio_out4_tri_t_7,gpio_out4_tri_t_6,gpio_out4_tri_t_5,gpio_out4_tri_t_4,gpio_out4_tri_t_3,gpio_out4_tri_t_2,gpio_out4_tri_t_1,gpio_out4_tri_t_0}),
        .leds_8bits_tri_i({leds_8bits_tri_i_7,leds_8bits_tri_i_6,leds_8bits_tri_i_5,leds_8bits_tri_i_4,leds_8bits_tri_i_3,leds_8bits_tri_i_2,leds_8bits_tri_i_1,leds_8bits_tri_i_0}),
        .leds_8bits_tri_o({leds_8bits_tri_o_7,leds_8bits_tri_o_6,leds_8bits_tri_o_5,leds_8bits_tri_o_4,leds_8bits_tri_o_3,leds_8bits_tri_o_2,leds_8bits_tri_o_1,leds_8bits_tri_o_0}),
        .leds_8bits_tri_t({leds_8bits_tri_t_7,leds_8bits_tri_t_6,leds_8bits_tri_t_5,leds_8bits_tri_t_4,leds_8bits_tri_t_3,leds_8bits_tri_t_2,leds_8bits_tri_t_1,leds_8bits_tri_t_0}),
        .reset_rtl(reset_rtl),
        .sws_8bits_tri_i(sws_8bits_tri_i),
        .sys_clock(sys_clock));
  IOBUF gpio_expected_tri_iobuf_0
       (.I(gpio_expected_tri_o_0),
        .IO(gpio_expected_tri_io[0]),
        .O(gpio_expected_tri_i_0),
        .T(gpio_expected_tri_t_0));
  IOBUF gpio_expected_tri_iobuf_1
       (.I(gpio_expected_tri_o_1),
        .IO(gpio_expected_tri_io[1]),
        .O(gpio_expected_tri_i_1),
        .T(gpio_expected_tri_t_1));
  IOBUF gpio_expected_tri_iobuf_2
       (.I(gpio_expected_tri_o_2),
        .IO(gpio_expected_tri_io[2]),
        .O(gpio_expected_tri_i_2),
        .T(gpio_expected_tri_t_2));
  IOBUF gpio_expected_tri_iobuf_3
       (.I(gpio_expected_tri_o_3),
        .IO(gpio_expected_tri_io[3]),
        .O(gpio_expected_tri_i_3),
        .T(gpio_expected_tri_t_3));
  IOBUF gpio_in_tri_iobuf_0
       (.I(gpio_in_tri_o_0),
        .IO(gpio_in_tri_io[0]),
        .O(gpio_in_tri_i_0),
        .T(gpio_in_tri_t_0));
  IOBUF gpio_in_tri_iobuf_1
       (.I(gpio_in_tri_o_1),
        .IO(gpio_in_tri_io[1]),
        .O(gpio_in_tri_i_1),
        .T(gpio_in_tri_t_1));
  IOBUF gpio_in_tri_iobuf_10
       (.I(gpio_in_tri_o_10),
        .IO(gpio_in_tri_io[10]),
        .O(gpio_in_tri_i_10),
        .T(gpio_in_tri_t_10));
  IOBUF gpio_in_tri_iobuf_11
       (.I(gpio_in_tri_o_11),
        .IO(gpio_in_tri_io[11]),
        .O(gpio_in_tri_i_11),
        .T(gpio_in_tri_t_11));
  IOBUF gpio_in_tri_iobuf_12
       (.I(gpio_in_tri_o_12),
        .IO(gpio_in_tri_io[12]),
        .O(gpio_in_tri_i_12),
        .T(gpio_in_tri_t_12));
  IOBUF gpio_in_tri_iobuf_13
       (.I(gpio_in_tri_o_13),
        .IO(gpio_in_tri_io[13]),
        .O(gpio_in_tri_i_13),
        .T(gpio_in_tri_t_13));
  IOBUF gpio_in_tri_iobuf_14
       (.I(gpio_in_tri_o_14),
        .IO(gpio_in_tri_io[14]),
        .O(gpio_in_tri_i_14),
        .T(gpio_in_tri_t_14));
  IOBUF gpio_in_tri_iobuf_15
       (.I(gpio_in_tri_o_15),
        .IO(gpio_in_tri_io[15]),
        .O(gpio_in_tri_i_15),
        .T(gpio_in_tri_t_15));
  IOBUF gpio_in_tri_iobuf_2
       (.I(gpio_in_tri_o_2),
        .IO(gpio_in_tri_io[2]),
        .O(gpio_in_tri_i_2),
        .T(gpio_in_tri_t_2));
  IOBUF gpio_in_tri_iobuf_3
       (.I(gpio_in_tri_o_3),
        .IO(gpio_in_tri_io[3]),
        .O(gpio_in_tri_i_3),
        .T(gpio_in_tri_t_3));
  IOBUF gpio_in_tri_iobuf_4
       (.I(gpio_in_tri_o_4),
        .IO(gpio_in_tri_io[4]),
        .O(gpio_in_tri_i_4),
        .T(gpio_in_tri_t_4));
  IOBUF gpio_in_tri_iobuf_5
       (.I(gpio_in_tri_o_5),
        .IO(gpio_in_tri_io[5]),
        .O(gpio_in_tri_i_5),
        .T(gpio_in_tri_t_5));
  IOBUF gpio_in_tri_iobuf_6
       (.I(gpio_in_tri_o_6),
        .IO(gpio_in_tri_io[6]),
        .O(gpio_in_tri_i_6),
        .T(gpio_in_tri_t_6));
  IOBUF gpio_in_tri_iobuf_7
       (.I(gpio_in_tri_o_7),
        .IO(gpio_in_tri_io[7]),
        .O(gpio_in_tri_i_7),
        .T(gpio_in_tri_t_7));
  IOBUF gpio_in_tri_iobuf_8
       (.I(gpio_in_tri_o_8),
        .IO(gpio_in_tri_io[8]),
        .O(gpio_in_tri_i_8),
        .T(gpio_in_tri_t_8));
  IOBUF gpio_in_tri_iobuf_9
       (.I(gpio_in_tri_o_9),
        .IO(gpio_in_tri_io[9]),
        .O(gpio_in_tri_i_9),
        .T(gpio_in_tri_t_9));
  IOBUF gpio_mode_tri_iobuf_0
       (.I(gpio_mode_tri_o_0),
        .IO(gpio_mode_tri_io[0]),
        .O(gpio_mode_tri_i_0),
        .T(gpio_mode_tri_t_0));
  IOBUF gpio_out1_tri_iobuf_0
       (.I(gpio_out1_tri_o_0),
        .IO(gpio_out1_tri_io[0]),
        .O(gpio_out1_tri_i_0),
        .T(gpio_out1_tri_t_0));
  IOBUF gpio_out1_tri_iobuf_1
       (.I(gpio_out1_tri_o_1),
        .IO(gpio_out1_tri_io[1]),
        .O(gpio_out1_tri_i_1),
        .T(gpio_out1_tri_t_1));
  IOBUF gpio_out1_tri_iobuf_10
       (.I(gpio_out1_tri_o_10),
        .IO(gpio_out1_tri_io[10]),
        .O(gpio_out1_tri_i_10),
        .T(gpio_out1_tri_t_10));
  IOBUF gpio_out1_tri_iobuf_11
       (.I(gpio_out1_tri_o_11),
        .IO(gpio_out1_tri_io[11]),
        .O(gpio_out1_tri_i_11),
        .T(gpio_out1_tri_t_11));
  IOBUF gpio_out1_tri_iobuf_12
       (.I(gpio_out1_tri_o_12),
        .IO(gpio_out1_tri_io[12]),
        .O(gpio_out1_tri_i_12),
        .T(gpio_out1_tri_t_12));
  IOBUF gpio_out1_tri_iobuf_13
       (.I(gpio_out1_tri_o_13),
        .IO(gpio_out1_tri_io[13]),
        .O(gpio_out1_tri_i_13),
        .T(gpio_out1_tri_t_13));
  IOBUF gpio_out1_tri_iobuf_14
       (.I(gpio_out1_tri_o_14),
        .IO(gpio_out1_tri_io[14]),
        .O(gpio_out1_tri_i_14),
        .T(gpio_out1_tri_t_14));
  IOBUF gpio_out1_tri_iobuf_15
       (.I(gpio_out1_tri_o_15),
        .IO(gpio_out1_tri_io[15]),
        .O(gpio_out1_tri_i_15),
        .T(gpio_out1_tri_t_15));
  IOBUF gpio_out1_tri_iobuf_16
       (.I(gpio_out1_tri_o_16),
        .IO(gpio_out1_tri_io[16]),
        .O(gpio_out1_tri_i_16),
        .T(gpio_out1_tri_t_16));
  IOBUF gpio_out1_tri_iobuf_17
       (.I(gpio_out1_tri_o_17),
        .IO(gpio_out1_tri_io[17]),
        .O(gpio_out1_tri_i_17),
        .T(gpio_out1_tri_t_17));
  IOBUF gpio_out1_tri_iobuf_2
       (.I(gpio_out1_tri_o_2),
        .IO(gpio_out1_tri_io[2]),
        .O(gpio_out1_tri_i_2),
        .T(gpio_out1_tri_t_2));
  IOBUF gpio_out1_tri_iobuf_3
       (.I(gpio_out1_tri_o_3),
        .IO(gpio_out1_tri_io[3]),
        .O(gpio_out1_tri_i_3),
        .T(gpio_out1_tri_t_3));
  IOBUF gpio_out1_tri_iobuf_4
       (.I(gpio_out1_tri_o_4),
        .IO(gpio_out1_tri_io[4]),
        .O(gpio_out1_tri_i_4),
        .T(gpio_out1_tri_t_4));
  IOBUF gpio_out1_tri_iobuf_5
       (.I(gpio_out1_tri_o_5),
        .IO(gpio_out1_tri_io[5]),
        .O(gpio_out1_tri_i_5),
        .T(gpio_out1_tri_t_5));
  IOBUF gpio_out1_tri_iobuf_6
       (.I(gpio_out1_tri_o_6),
        .IO(gpio_out1_tri_io[6]),
        .O(gpio_out1_tri_i_6),
        .T(gpio_out1_tri_t_6));
  IOBUF gpio_out1_tri_iobuf_7
       (.I(gpio_out1_tri_o_7),
        .IO(gpio_out1_tri_io[7]),
        .O(gpio_out1_tri_i_7),
        .T(gpio_out1_tri_t_7));
  IOBUF gpio_out1_tri_iobuf_8
       (.I(gpio_out1_tri_o_8),
        .IO(gpio_out1_tri_io[8]),
        .O(gpio_out1_tri_i_8),
        .T(gpio_out1_tri_t_8));
  IOBUF gpio_out1_tri_iobuf_9
       (.I(gpio_out1_tri_o_9),
        .IO(gpio_out1_tri_io[9]),
        .O(gpio_out1_tri_i_9),
        .T(gpio_out1_tri_t_9));
  IOBUF gpio_out2_tri_iobuf_0
       (.I(gpio_out2_tri_o_0),
        .IO(gpio_out2_tri_io[0]),
        .O(gpio_out2_tri_i_0),
        .T(gpio_out2_tri_t_0));
  IOBUF gpio_out2_tri_iobuf_1
       (.I(gpio_out2_tri_o_1),
        .IO(gpio_out2_tri_io[1]),
        .O(gpio_out2_tri_i_1),
        .T(gpio_out2_tri_t_1));
  IOBUF gpio_out2_tri_iobuf_10
       (.I(gpio_out2_tri_o_10),
        .IO(gpio_out2_tri_io[10]),
        .O(gpio_out2_tri_i_10),
        .T(gpio_out2_tri_t_10));
  IOBUF gpio_out2_tri_iobuf_11
       (.I(gpio_out2_tri_o_11),
        .IO(gpio_out2_tri_io[11]),
        .O(gpio_out2_tri_i_11),
        .T(gpio_out2_tri_t_11));
  IOBUF gpio_out2_tri_iobuf_12
       (.I(gpio_out2_tri_o_12),
        .IO(gpio_out2_tri_io[12]),
        .O(gpio_out2_tri_i_12),
        .T(gpio_out2_tri_t_12));
  IOBUF gpio_out2_tri_iobuf_13
       (.I(gpio_out2_tri_o_13),
        .IO(gpio_out2_tri_io[13]),
        .O(gpio_out2_tri_i_13),
        .T(gpio_out2_tri_t_13));
  IOBUF gpio_out2_tri_iobuf_14
       (.I(gpio_out2_tri_o_14),
        .IO(gpio_out2_tri_io[14]),
        .O(gpio_out2_tri_i_14),
        .T(gpio_out2_tri_t_14));
  IOBUF gpio_out2_tri_iobuf_15
       (.I(gpio_out2_tri_o_15),
        .IO(gpio_out2_tri_io[15]),
        .O(gpio_out2_tri_i_15),
        .T(gpio_out2_tri_t_15));
  IOBUF gpio_out2_tri_iobuf_16
       (.I(gpio_out2_tri_o_16),
        .IO(gpio_out2_tri_io[16]),
        .O(gpio_out2_tri_i_16),
        .T(gpio_out2_tri_t_16));
  IOBUF gpio_out2_tri_iobuf_17
       (.I(gpio_out2_tri_o_17),
        .IO(gpio_out2_tri_io[17]),
        .O(gpio_out2_tri_i_17),
        .T(gpio_out2_tri_t_17));
  IOBUF gpio_out2_tri_iobuf_2
       (.I(gpio_out2_tri_o_2),
        .IO(gpio_out2_tri_io[2]),
        .O(gpio_out2_tri_i_2),
        .T(gpio_out2_tri_t_2));
  IOBUF gpio_out2_tri_iobuf_3
       (.I(gpio_out2_tri_o_3),
        .IO(gpio_out2_tri_io[3]),
        .O(gpio_out2_tri_i_3),
        .T(gpio_out2_tri_t_3));
  IOBUF gpio_out2_tri_iobuf_4
       (.I(gpio_out2_tri_o_4),
        .IO(gpio_out2_tri_io[4]),
        .O(gpio_out2_tri_i_4),
        .T(gpio_out2_tri_t_4));
  IOBUF gpio_out2_tri_iobuf_5
       (.I(gpio_out2_tri_o_5),
        .IO(gpio_out2_tri_io[5]),
        .O(gpio_out2_tri_i_5),
        .T(gpio_out2_tri_t_5));
  IOBUF gpio_out2_tri_iobuf_6
       (.I(gpio_out2_tri_o_6),
        .IO(gpio_out2_tri_io[6]),
        .O(gpio_out2_tri_i_6),
        .T(gpio_out2_tri_t_6));
  IOBUF gpio_out2_tri_iobuf_7
       (.I(gpio_out2_tri_o_7),
        .IO(gpio_out2_tri_io[7]),
        .O(gpio_out2_tri_i_7),
        .T(gpio_out2_tri_t_7));
  IOBUF gpio_out2_tri_iobuf_8
       (.I(gpio_out2_tri_o_8),
        .IO(gpio_out2_tri_io[8]),
        .O(gpio_out2_tri_i_8),
        .T(gpio_out2_tri_t_8));
  IOBUF gpio_out2_tri_iobuf_9
       (.I(gpio_out2_tri_o_9),
        .IO(gpio_out2_tri_io[9]),
        .O(gpio_out2_tri_i_9),
        .T(gpio_out2_tri_t_9));
  IOBUF gpio_out3_tri_iobuf_0
       (.I(gpio_out3_tri_o_0),
        .IO(gpio_out3_tri_io[0]),
        .O(gpio_out3_tri_i_0),
        .T(gpio_out3_tri_t_0));
  IOBUF gpio_out3_tri_iobuf_1
       (.I(gpio_out3_tri_o_1),
        .IO(gpio_out3_tri_io[1]),
        .O(gpio_out3_tri_i_1),
        .T(gpio_out3_tri_t_1));
  IOBUF gpio_out3_tri_iobuf_10
       (.I(gpio_out3_tri_o_10),
        .IO(gpio_out3_tri_io[10]),
        .O(gpio_out3_tri_i_10),
        .T(gpio_out3_tri_t_10));
  IOBUF gpio_out3_tri_iobuf_11
       (.I(gpio_out3_tri_o_11),
        .IO(gpio_out3_tri_io[11]),
        .O(gpio_out3_tri_i_11),
        .T(gpio_out3_tri_t_11));
  IOBUF gpio_out3_tri_iobuf_12
       (.I(gpio_out3_tri_o_12),
        .IO(gpio_out3_tri_io[12]),
        .O(gpio_out3_tri_i_12),
        .T(gpio_out3_tri_t_12));
  IOBUF gpio_out3_tri_iobuf_13
       (.I(gpio_out3_tri_o_13),
        .IO(gpio_out3_tri_io[13]),
        .O(gpio_out3_tri_i_13),
        .T(gpio_out3_tri_t_13));
  IOBUF gpio_out3_tri_iobuf_14
       (.I(gpio_out3_tri_o_14),
        .IO(gpio_out3_tri_io[14]),
        .O(gpio_out3_tri_i_14),
        .T(gpio_out3_tri_t_14));
  IOBUF gpio_out3_tri_iobuf_15
       (.I(gpio_out3_tri_o_15),
        .IO(gpio_out3_tri_io[15]),
        .O(gpio_out3_tri_i_15),
        .T(gpio_out3_tri_t_15));
  IOBUF gpio_out3_tri_iobuf_16
       (.I(gpio_out3_tri_o_16),
        .IO(gpio_out3_tri_io[16]),
        .O(gpio_out3_tri_i_16),
        .T(gpio_out3_tri_t_16));
  IOBUF gpio_out3_tri_iobuf_17
       (.I(gpio_out3_tri_o_17),
        .IO(gpio_out3_tri_io[17]),
        .O(gpio_out3_tri_i_17),
        .T(gpio_out3_tri_t_17));
  IOBUF gpio_out3_tri_iobuf_2
       (.I(gpio_out3_tri_o_2),
        .IO(gpio_out3_tri_io[2]),
        .O(gpio_out3_tri_i_2),
        .T(gpio_out3_tri_t_2));
  IOBUF gpio_out3_tri_iobuf_3
       (.I(gpio_out3_tri_o_3),
        .IO(gpio_out3_tri_io[3]),
        .O(gpio_out3_tri_i_3),
        .T(gpio_out3_tri_t_3));
  IOBUF gpio_out3_tri_iobuf_4
       (.I(gpio_out3_tri_o_4),
        .IO(gpio_out3_tri_io[4]),
        .O(gpio_out3_tri_i_4),
        .T(gpio_out3_tri_t_4));
  IOBUF gpio_out3_tri_iobuf_5
       (.I(gpio_out3_tri_o_5),
        .IO(gpio_out3_tri_io[5]),
        .O(gpio_out3_tri_i_5),
        .T(gpio_out3_tri_t_5));
  IOBUF gpio_out3_tri_iobuf_6
       (.I(gpio_out3_tri_o_6),
        .IO(gpio_out3_tri_io[6]),
        .O(gpio_out3_tri_i_6),
        .T(gpio_out3_tri_t_6));
  IOBUF gpio_out3_tri_iobuf_7
       (.I(gpio_out3_tri_o_7),
        .IO(gpio_out3_tri_io[7]),
        .O(gpio_out3_tri_i_7),
        .T(gpio_out3_tri_t_7));
  IOBUF gpio_out3_tri_iobuf_8
       (.I(gpio_out3_tri_o_8),
        .IO(gpio_out3_tri_io[8]),
        .O(gpio_out3_tri_i_8),
        .T(gpio_out3_tri_t_8));
  IOBUF gpio_out3_tri_iobuf_9
       (.I(gpio_out3_tri_o_9),
        .IO(gpio_out3_tri_io[9]),
        .O(gpio_out3_tri_i_9),
        .T(gpio_out3_tri_t_9));
  IOBUF gpio_out4_tri_iobuf_0
       (.I(gpio_out4_tri_o_0),
        .IO(gpio_out4_tri_io[0]),
        .O(gpio_out4_tri_i_0),
        .T(gpio_out4_tri_t_0));
  IOBUF gpio_out4_tri_iobuf_1
       (.I(gpio_out4_tri_o_1),
        .IO(gpio_out4_tri_io[1]),
        .O(gpio_out4_tri_i_1),
        .T(gpio_out4_tri_t_1));
  IOBUF gpio_out4_tri_iobuf_10
       (.I(gpio_out4_tri_o_10),
        .IO(gpio_out4_tri_io[10]),
        .O(gpio_out4_tri_i_10),
        .T(gpio_out4_tri_t_10));
  IOBUF gpio_out4_tri_iobuf_11
       (.I(gpio_out4_tri_o_11),
        .IO(gpio_out4_tri_io[11]),
        .O(gpio_out4_tri_i_11),
        .T(gpio_out4_tri_t_11));
  IOBUF gpio_out4_tri_iobuf_12
       (.I(gpio_out4_tri_o_12),
        .IO(gpio_out4_tri_io[12]),
        .O(gpio_out4_tri_i_12),
        .T(gpio_out4_tri_t_12));
  IOBUF gpio_out4_tri_iobuf_13
       (.I(gpio_out4_tri_o_13),
        .IO(gpio_out4_tri_io[13]),
        .O(gpio_out4_tri_i_13),
        .T(gpio_out4_tri_t_13));
  IOBUF gpio_out4_tri_iobuf_14
       (.I(gpio_out4_tri_o_14),
        .IO(gpio_out4_tri_io[14]),
        .O(gpio_out4_tri_i_14),
        .T(gpio_out4_tri_t_14));
  IOBUF gpio_out4_tri_iobuf_15
       (.I(gpio_out4_tri_o_15),
        .IO(gpio_out4_tri_io[15]),
        .O(gpio_out4_tri_i_15),
        .T(gpio_out4_tri_t_15));
  IOBUF gpio_out4_tri_iobuf_16
       (.I(gpio_out4_tri_o_16),
        .IO(gpio_out4_tri_io[16]),
        .O(gpio_out4_tri_i_16),
        .T(gpio_out4_tri_t_16));
  IOBUF gpio_out4_tri_iobuf_17
       (.I(gpio_out4_tri_o_17),
        .IO(gpio_out4_tri_io[17]),
        .O(gpio_out4_tri_i_17),
        .T(gpio_out4_tri_t_17));
  IOBUF gpio_out4_tri_iobuf_2
       (.I(gpio_out4_tri_o_2),
        .IO(gpio_out4_tri_io[2]),
        .O(gpio_out4_tri_i_2),
        .T(gpio_out4_tri_t_2));
  IOBUF gpio_out4_tri_iobuf_3
       (.I(gpio_out4_tri_o_3),
        .IO(gpio_out4_tri_io[3]),
        .O(gpio_out4_tri_i_3),
        .T(gpio_out4_tri_t_3));
  IOBUF gpio_out4_tri_iobuf_4
       (.I(gpio_out4_tri_o_4),
        .IO(gpio_out4_tri_io[4]),
        .O(gpio_out4_tri_i_4),
        .T(gpio_out4_tri_t_4));
  IOBUF gpio_out4_tri_iobuf_5
       (.I(gpio_out4_tri_o_5),
        .IO(gpio_out4_tri_io[5]),
        .O(gpio_out4_tri_i_5),
        .T(gpio_out4_tri_t_5));
  IOBUF gpio_out4_tri_iobuf_6
       (.I(gpio_out4_tri_o_6),
        .IO(gpio_out4_tri_io[6]),
        .O(gpio_out4_tri_i_6),
        .T(gpio_out4_tri_t_6));
  IOBUF gpio_out4_tri_iobuf_7
       (.I(gpio_out4_tri_o_7),
        .IO(gpio_out4_tri_io[7]),
        .O(gpio_out4_tri_i_7),
        .T(gpio_out4_tri_t_7));
  IOBUF gpio_out4_tri_iobuf_8
       (.I(gpio_out4_tri_o_8),
        .IO(gpio_out4_tri_io[8]),
        .O(gpio_out4_tri_i_8),
        .T(gpio_out4_tri_t_8));
  IOBUF gpio_out4_tri_iobuf_9
       (.I(gpio_out4_tri_o_9),
        .IO(gpio_out4_tri_io[9]),
        .O(gpio_out4_tri_i_9),
        .T(gpio_out4_tri_t_9));
  IOBUF leds_8bits_tri_iobuf_0
       (.I(leds_8bits_tri_o_0),
        .IO(leds_8bits_tri_io[0]),
        .O(leds_8bits_tri_i_0),
        .T(leds_8bits_tri_t_0));
  IOBUF leds_8bits_tri_iobuf_1
       (.I(leds_8bits_tri_o_1),
        .IO(leds_8bits_tri_io[1]),
        .O(leds_8bits_tri_i_1),
        .T(leds_8bits_tri_t_1));
  IOBUF leds_8bits_tri_iobuf_2
       (.I(leds_8bits_tri_o_2),
        .IO(leds_8bits_tri_io[2]),
        .O(leds_8bits_tri_i_2),
        .T(leds_8bits_tri_t_2));
  IOBUF leds_8bits_tri_iobuf_3
       (.I(leds_8bits_tri_o_3),
        .IO(leds_8bits_tri_io[3]),
        .O(leds_8bits_tri_i_3),
        .T(leds_8bits_tri_t_3));
  IOBUF leds_8bits_tri_iobuf_4
       (.I(leds_8bits_tri_o_4),
        .IO(leds_8bits_tri_io[4]),
        .O(leds_8bits_tri_i_4),
        .T(leds_8bits_tri_t_4));
  IOBUF leds_8bits_tri_iobuf_5
       (.I(leds_8bits_tri_o_5),
        .IO(leds_8bits_tri_io[5]),
        .O(leds_8bits_tri_i_5),
        .T(leds_8bits_tri_t_5));
  IOBUF leds_8bits_tri_iobuf_6
       (.I(leds_8bits_tri_o_6),
        .IO(leds_8bits_tri_io[6]),
        .O(leds_8bits_tri_i_6),
        .T(leds_8bits_tri_t_6));
  IOBUF leds_8bits_tri_iobuf_7
       (.I(leds_8bits_tri_o_7),
        .IO(leds_8bits_tri_io[7]),
        .O(leds_8bits_tri_i_7),
        .T(leds_8bits_tri_t_7));
endmodule
