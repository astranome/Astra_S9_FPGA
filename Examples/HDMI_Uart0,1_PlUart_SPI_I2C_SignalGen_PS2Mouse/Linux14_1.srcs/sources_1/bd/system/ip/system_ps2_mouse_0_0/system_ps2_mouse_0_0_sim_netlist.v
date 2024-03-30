// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Mar 27 14:15:14 2024
// Host        : DESKTOP-0SNREP6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Linux14_1/Linux14_1.srcs/sources_1/bd/system/ip/system_ps2_mouse_0_0/system_ps2_mouse_0_0_sim_netlist.v
// Design      : system_ps2_mouse_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_ps2_mouse_0_0,ps2_mouse_w,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "ps2_mouse_w,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module system_ps2_mouse_0_0
   (clk,
    reset_n,
    ps2_clk,
    ps2_data,
    mouse_data,
    mouse_data_new,
    state_std,
    ps2_clock_T,
    ps2_clock_O,
    ps2_clock_I,
    ps2_dat_T,
    ps2_dat_O,
    ps2_dat_I);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset_n, ASSOCIATED_BUSIF ps2_dat, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW" *) input reset_n;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ps2_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ps2_clk, FREQ_HZ 100000000, PHASE 0.000" *) inout ps2_clk;
  inout ps2_data;
  output [31:0]mouse_data;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 mouse_data_new INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME mouse_data_new, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output mouse_data_new;
  output [31:0]state_std;
  (* x_interface_info = "xilinx.com:interface:gpio:1.0 ps2_clock TRI_T" *) output ps2_clock_T;
  (* x_interface_info = "xilinx.com:interface:gpio:1.0 ps2_clock TRI_O" *) output ps2_clock_O;
  (* x_interface_info = "xilinx.com:interface:gpio:1.0 ps2_clock TRI_I" *) input ps2_clock_I;
  (* x_interface_info = "xilinx.com:interface:gpio:1.0 ps2_dat TRI_T" *) output ps2_dat_T;
  (* x_interface_info = "xilinx.com:interface:gpio:1.0 ps2_dat TRI_O" *) output ps2_dat_O;
  (* x_interface_info = "xilinx.com:interface:gpio:1.0 ps2_dat TRI_I" *) input ps2_dat_I;

  wire \<const0> ;
  wire clk;
  wire [31:0]mouse_data;
  wire mouse_data_new;
  wire ps2_clock_I;
  wire ps2_clock_T;
  wire ps2_dat_I;
  wire ps2_dat_O;
  wire ps2_dat_T;
  wire reset_n;
  wire [4:0]\^state_std ;

  assign ps2_clock_O = \<const0> ;
  assign state_std[31] = \<const0> ;
  assign state_std[30] = \<const0> ;
  assign state_std[29] = \<const0> ;
  assign state_std[28] = \<const0> ;
  assign state_std[27] = \<const0> ;
  assign state_std[26] = \<const0> ;
  assign state_std[25] = \<const0> ;
  assign state_std[24] = \<const0> ;
  assign state_std[23] = \<const0> ;
  assign state_std[22] = \<const0> ;
  assign state_std[21] = \<const0> ;
  assign state_std[20] = \<const0> ;
  assign state_std[19] = \<const0> ;
  assign state_std[18] = \<const0> ;
  assign state_std[17] = \<const0> ;
  assign state_std[16] = \<const0> ;
  assign state_std[15] = \<const0> ;
  assign state_std[14] = \<const0> ;
  assign state_std[13] = \<const0> ;
  assign state_std[12] = \<const0> ;
  assign state_std[11] = \<const0> ;
  assign state_std[10] = \<const0> ;
  assign state_std[9] = \<const0> ;
  assign state_std[8] = \<const0> ;
  assign state_std[7] = \<const0> ;
  assign state_std[6] = \<const0> ;
  assign state_std[5] = \<const0> ;
  assign state_std[4:0] = \^state_std [4:0];
  GND GND
       (.G(\<const0> ));
  system_ps2_mouse_0_0_ps2_mouse_w U0
       (.D({ps2_dat_I,ps2_clock_I}),
        .clk(clk),
        .mouse_data(mouse_data),
        .mouse_data_new(mouse_data_new),
        .ps2_clock_T(ps2_clock_T),
        .ps2_dat_O(ps2_dat_O),
        .ps2_dat_T(ps2_dat_T),
        .reset_n(reset_n),
        .\state_std[0] (\^state_std [0]),
        .\state_std[1] (\^state_std [1]),
        .\state_std[2] (\^state_std [2]),
        .\state_std[3] (\^state_std [3]),
        .\state_std[4] (\^state_std [4]));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module system_ps2_mouse_0_0_debounce
   (ps2_clk_int,
    \timer_reg[12] ,
    E,
    \bit_cnt_reg[0] ,
    timer0,
    D,
    ps2_clk_int_prev_reg,
    clk,
    \FSM_sequential_state_reg[0] ,
    \timer_reg[0] ,
    \timer_reg[3] ,
    \timer_reg[4] ,
    out,
    tx_ena,
    reset_n,
    ps2_clk_int_prev,
    \timer_reg[9] ,
    \timer_reg[11] ,
    \timer_reg[9]_0 ,
    \FSM_sequential_state_reg[1] ,
    \timer_reg[12]_0 ,
    \FSM_sequential_state_reg[0]_0 ,
    ps2_data_int,
    \timer_reg[11]_0 ,
    \timer_reg[12]_1 ,
    Q);
  output ps2_clk_int;
  output \timer_reg[12] ;
  output [0:0]E;
  output [0:0]\bit_cnt_reg[0] ;
  output timer0;
  output [0:0]D;
  output ps2_clk_int_prev_reg;
  input clk;
  input \FSM_sequential_state_reg[0] ;
  input \timer_reg[0] ;
  input \timer_reg[3] ;
  input \timer_reg[4] ;
  input [1:0]out;
  input tx_ena;
  input reset_n;
  input ps2_clk_int_prev;
  input \timer_reg[9] ;
  input \timer_reg[11] ;
  input \timer_reg[9]_0 ;
  input \FSM_sequential_state_reg[1] ;
  input \timer_reg[12]_0 ;
  input \FSM_sequential_state_reg[0]_0 ;
  input ps2_data_int;
  input \timer_reg[11]_0 ;
  input \timer_reg[12]_1 ;
  input [0:0]Q;

  wire [0:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[1] ;
  wire [0:0]Q;
  wire [0:0]\bit_cnt_reg[0] ;
  wire clk;
  wire \counter_out[8]_i_4_n_0 ;
  wire [8:8]counter_out_reg__0;
  wire \counter_out_reg_n_0_[0] ;
  wire \counter_out_reg_n_0_[1] ;
  wire \counter_out_reg_n_0_[2] ;
  wire \counter_out_reg_n_0_[3] ;
  wire \counter_out_reg_n_0_[4] ;
  wire \counter_out_reg_n_0_[5] ;
  wire \counter_out_reg_n_0_[6] ;
  wire \counter_out_reg_n_0_[7] ;
  wire counter_set;
  wire \flipflops_reg_n_0_[0] ;
  wire [1:0]out;
  wire p_0_in;
  wire [8:0]plusOp;
  wire ps2_clk_int;
  wire ps2_clk_int_prev;
  wire ps2_clk_int_prev_reg;
  wire ps2_data_int;
  wire reset_n;
  wire result_i_1_n_0;
  wire sel;
  wire timer0;
  wire \timer[12]_i_10_n_0 ;
  wire \timer[12]_i_17_n_0 ;
  wire \timer[12]_i_8_n_0 ;
  wire \timer[12]_i_9_n_0 ;
  wire \timer_reg[0] ;
  wire \timer_reg[11] ;
  wire \timer_reg[11]_0 ;
  wire \timer_reg[12] ;
  wire \timer_reg[12]_0 ;
  wire \timer_reg[12]_1 ;
  wire \timer_reg[3] ;
  wire \timer_reg[4] ;
  wire \timer_reg[9] ;
  wire \timer_reg[9]_0 ;
  wire tx_ena;

  LUT6 #(
    .INIT(64'h77F0FF007700FF00)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(ps2_clk_int),
        .I1(ps2_data_int),
        .I2(\timer_reg[11]_0 ),
        .I3(out[1]),
        .I4(out[0]),
        .I5(\timer_reg[12]_1 ),
        .O(D));
  LUT6 #(
    .INIT(64'h000C000008080808)) 
    \bit_cnt[3]_i_1 
       (.I0(tx_ena),
        .I1(reset_n),
        .I2(out[0]),
        .I3(ps2_clk_int),
        .I4(ps2_clk_int_prev),
        .I5(out[1]),
        .O(\bit_cnt_reg[0] ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_out[0]_i_1 
       (.I0(\counter_out_reg_n_0_[0] ),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter_out[1]_i_1 
       (.I0(\counter_out_reg_n_0_[0] ),
        .I1(\counter_out_reg_n_0_[1] ),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter_out[2]_i_1 
       (.I0(\counter_out_reg_n_0_[0] ),
        .I1(\counter_out_reg_n_0_[1] ),
        .I2(\counter_out_reg_n_0_[2] ),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter_out[3]_i_1 
       (.I0(\counter_out_reg_n_0_[1] ),
        .I1(\counter_out_reg_n_0_[0] ),
        .I2(\counter_out_reg_n_0_[2] ),
        .I3(\counter_out_reg_n_0_[3] ),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter_out[4]_i_1 
       (.I0(\counter_out_reg_n_0_[2] ),
        .I1(\counter_out_reg_n_0_[0] ),
        .I2(\counter_out_reg_n_0_[1] ),
        .I3(\counter_out_reg_n_0_[3] ),
        .I4(\counter_out_reg_n_0_[4] ),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter_out[5]_i_1 
       (.I0(\counter_out_reg_n_0_[3] ),
        .I1(\counter_out_reg_n_0_[1] ),
        .I2(\counter_out_reg_n_0_[0] ),
        .I3(\counter_out_reg_n_0_[2] ),
        .I4(\counter_out_reg_n_0_[4] ),
        .I5(\counter_out_reg_n_0_[5] ),
        .O(plusOp[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \counter_out[6]_i_1 
       (.I0(\counter_out[8]_i_4_n_0 ),
        .I1(\counter_out_reg_n_0_[6] ),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter_out[7]_i_1 
       (.I0(\counter_out[8]_i_4_n_0 ),
        .I1(\counter_out_reg_n_0_[6] ),
        .I2(\counter_out_reg_n_0_[7] ),
        .O(plusOp[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \counter_out[8]_i_1 
       (.I0(p_0_in),
        .I1(\flipflops_reg_n_0_[0] ),
        .O(counter_set));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_out[8]_i_2 
       (.I0(counter_out_reg__0),
        .O(sel));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \counter_out[8]_i_3 
       (.I0(\counter_out_reg_n_0_[6] ),
        .I1(\counter_out[8]_i_4_n_0 ),
        .I2(\counter_out_reg_n_0_[7] ),
        .O(plusOp[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \counter_out[8]_i_4 
       (.I0(\counter_out_reg_n_0_[5] ),
        .I1(\counter_out_reg_n_0_[3] ),
        .I2(\counter_out_reg_n_0_[1] ),
        .I3(\counter_out_reg_n_0_[0] ),
        .I4(\counter_out_reg_n_0_[2] ),
        .I5(\counter_out_reg_n_0_[4] ),
        .O(\counter_out[8]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[0] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[0]),
        .Q(\counter_out_reg_n_0_[0] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[1] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[1]),
        .Q(\counter_out_reg_n_0_[1] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[2] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[2]),
        .Q(\counter_out_reg_n_0_[2] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[3] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[3]),
        .Q(\counter_out_reg_n_0_[3] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[4] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[4]),
        .Q(\counter_out_reg_n_0_[4] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[5] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[5]),
        .Q(\counter_out_reg_n_0_[5] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[6] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[6]),
        .Q(\counter_out_reg_n_0_[6] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[7] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[7]),
        .Q(\counter_out_reg_n_0_[7] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[8] 
       (.C(clk),
        .CE(sel),
        .D(plusOp[8]),
        .Q(counter_out_reg__0),
        .R(counter_set));
  FDRE \flipflops_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(Q),
        .Q(\flipflops_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \flipflops_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\flipflops_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ps2_clk_int_prev_i_1
       (.I0(ps2_clk_int),
        .I1(reset_n),
        .I2(ps2_clk_int_prev),
        .O(ps2_clk_int_prev_reg));
  LUT6 #(
    .INIT(64'h0040004000F00040)) 
    \ps2_word[9]_i_1 
       (.I0(out[1]),
        .I1(tx_ena),
        .I2(reset_n),
        .I3(out[0]),
        .I4(ps2_clk_int_prev),
        .I5(ps2_clk_int),
        .O(E));
  LUT4 #(
    .INIT(16'hFD80)) 
    result_i_1
       (.I0(counter_out_reg__0),
        .I1(\flipflops_reg_n_0_[0] ),
        .I2(p_0_in),
        .I3(ps2_clk_int),
        .O(result_i_1_n_0));
  FDRE result_reg
       (.C(clk),
        .CE(1'b1),
        .D(result_i_1_n_0),
        .Q(ps2_clk_int),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FFFFFFFE)) 
    \timer[12]_i_1 
       (.I0(\FSM_sequential_state_reg[0] ),
        .I1(\timer_reg[0] ),
        .I2(\timer_reg[3] ),
        .I3(\timer_reg[4] ),
        .I4(\timer[12]_i_8_n_0 ),
        .I5(\timer[12]_i_9_n_0 ),
        .O(\timer_reg[12] ));
  LUT6 #(
    .INIT(64'hFEEEFEEEFEEEEEEE)) 
    \timer[12]_i_10 
       (.I0(\timer_reg[12]_0 ),
        .I1(\timer[12]_i_17_n_0 ),
        .I2(reset_n),
        .I3(\FSM_sequential_state_reg[0]_0 ),
        .I4(\timer_reg[9]_0 ),
        .I5(\timer_reg[11] ),
        .O(\timer[12]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \timer[12]_i_17 
       (.I0(ps2_clk_int),
        .I1(reset_n),
        .I2(out[1]),
        .I3(out[0]),
        .O(\timer[12]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \timer[12]_i_2 
       (.I0(\timer[12]_i_10_n_0 ),
        .I1(\timer_reg[9] ),
        .I2(\timer_reg[4] ),
        .I3(\timer_reg[3] ),
        .I4(\timer_reg[0] ),
        .I5(\FSM_sequential_state_reg[0] ),
        .O(timer0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE0)) 
    \timer[12]_i_8 
       (.I0(\timer_reg[11] ),
        .I1(\timer_reg[9]_0 ),
        .I2(\FSM_sequential_state_reg[1] ),
        .I3(\timer[12]_i_17_n_0 ),
        .I4(\timer_reg[12]_0 ),
        .I5(\timer_reg[9] ),
        .O(\timer[12]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hF4)) 
    \timer[12]_i_9 
       (.I0(tx_ena),
        .I1(ps2_clk_int),
        .I2(out[0]),
        .O(\timer[12]_i_9_n_0 ));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module system_ps2_mouse_0_0_debounce_0
   (ps2_data_int,
    D,
    clk,
    \bit_cnt_reg[3] ,
    tx_ena,
    out,
    \timer_reg[12] ,
    ps2_clk_int,
    Q);
  output ps2_data_int;
  output [0:0]D;
  input clk;
  input \bit_cnt_reg[3] ;
  input tx_ena;
  input [1:0]out;
  input \timer_reg[12] ;
  input ps2_clk_int;
  input [0:0]Q;

  wire [0:0]D;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire [0:0]Q;
  wire \bit_cnt_reg[3] ;
  wire clk;
  wire \counter_out[8]_i_2__0_n_0 ;
  wire \counter_out[8]_i_4__0_n_0 ;
  wire [8:8]counter_out_reg__0;
  wire \counter_out_reg_n_0_[0] ;
  wire \counter_out_reg_n_0_[1] ;
  wire \counter_out_reg_n_0_[2] ;
  wire \counter_out_reg_n_0_[3] ;
  wire \counter_out_reg_n_0_[4] ;
  wire \counter_out_reg_n_0_[5] ;
  wire \counter_out_reg_n_0_[6] ;
  wire \counter_out_reg_n_0_[7] ;
  wire counter_set;
  wire \flipflops_reg_n_0_[0] ;
  wire [1:0]out;
  wire p_0_in;
  wire [8:0]plusOp__0;
  wire ps2_clk_int;
  wire ps2_data_int;
  wire result_i_1__0_n_0;
  wire \timer_reg[12] ;
  wire tx_ena;

  LUT6 #(
    .INIT(64'hEECCFFFCEECCCCFC)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\bit_cnt_reg[3] ),
        .I2(tx_ena),
        .I3(out[0]),
        .I4(out[1]),
        .I5(\timer_reg[12] ),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(ps2_data_int),
        .I1(ps2_clk_int),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_out[0]_i_1__0 
       (.I0(\counter_out_reg_n_0_[0] ),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter_out[1]_i_1__0 
       (.I0(\counter_out_reg_n_0_[0] ),
        .I1(\counter_out_reg_n_0_[1] ),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter_out[2]_i_1__0 
       (.I0(\counter_out_reg_n_0_[0] ),
        .I1(\counter_out_reg_n_0_[1] ),
        .I2(\counter_out_reg_n_0_[2] ),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter_out[3]_i_1__0 
       (.I0(\counter_out_reg_n_0_[1] ),
        .I1(\counter_out_reg_n_0_[0] ),
        .I2(\counter_out_reg_n_0_[2] ),
        .I3(\counter_out_reg_n_0_[3] ),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter_out[4]_i_1__0 
       (.I0(\counter_out_reg_n_0_[2] ),
        .I1(\counter_out_reg_n_0_[0] ),
        .I2(\counter_out_reg_n_0_[1] ),
        .I3(\counter_out_reg_n_0_[3] ),
        .I4(\counter_out_reg_n_0_[4] ),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter_out[5]_i_1__0 
       (.I0(\counter_out_reg_n_0_[3] ),
        .I1(\counter_out_reg_n_0_[1] ),
        .I2(\counter_out_reg_n_0_[0] ),
        .I3(\counter_out_reg_n_0_[2] ),
        .I4(\counter_out_reg_n_0_[4] ),
        .I5(\counter_out_reg_n_0_[5] ),
        .O(plusOp__0[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \counter_out[6]_i_1__0 
       (.I0(\counter_out[8]_i_4__0_n_0 ),
        .I1(\counter_out_reg_n_0_[6] ),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter_out[7]_i_1__0 
       (.I0(\counter_out[8]_i_4__0_n_0 ),
        .I1(\counter_out_reg_n_0_[6] ),
        .I2(\counter_out_reg_n_0_[7] ),
        .O(plusOp__0[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \counter_out[8]_i_1__0 
       (.I0(p_0_in),
        .I1(\flipflops_reg_n_0_[0] ),
        .O(counter_set));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_out[8]_i_2__0 
       (.I0(counter_out_reg__0),
        .O(\counter_out[8]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \counter_out[8]_i_3__0 
       (.I0(\counter_out_reg_n_0_[6] ),
        .I1(\counter_out[8]_i_4__0_n_0 ),
        .I2(\counter_out_reg_n_0_[7] ),
        .O(plusOp__0[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \counter_out[8]_i_4__0 
       (.I0(\counter_out_reg_n_0_[5] ),
        .I1(\counter_out_reg_n_0_[3] ),
        .I2(\counter_out_reg_n_0_[1] ),
        .I3(\counter_out_reg_n_0_[0] ),
        .I4(\counter_out_reg_n_0_[2] ),
        .I5(\counter_out_reg_n_0_[4] ),
        .O(\counter_out[8]_i_4__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[0] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[0]),
        .Q(\counter_out_reg_n_0_[0] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[1] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[1]),
        .Q(\counter_out_reg_n_0_[1] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[2] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[2]),
        .Q(\counter_out_reg_n_0_[2] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[3] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[3]),
        .Q(\counter_out_reg_n_0_[3] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[4] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[4]),
        .Q(\counter_out_reg_n_0_[4] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[5] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[5]),
        .Q(\counter_out_reg_n_0_[5] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[6] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[6]),
        .Q(\counter_out_reg_n_0_[6] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[7] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[7]),
        .Q(\counter_out_reg_n_0_[7] ),
        .R(counter_set));
  FDRE #(
    .INIT(1'b0)) 
    \counter_out_reg[8] 
       (.C(clk),
        .CE(\counter_out[8]_i_2__0_n_0 ),
        .D(plusOp__0[8]),
        .Q(counter_out_reg__0),
        .R(counter_set));
  FDRE \flipflops_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(Q),
        .Q(\flipflops_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \flipflops_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\flipflops_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFD80)) 
    result_i_1__0
       (.I0(counter_out_reg__0),
        .I1(\flipflops_reg_n_0_[0] ),
        .I2(p_0_in),
        .I3(ps2_data_int),
        .O(result_i_1__0_n_0));
  FDRE result_reg
       (.C(clk),
        .CE(1'b1),
        .D(result_i_1__0_n_0),
        .Q(ps2_data_int),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "ps2_mouse_w" *) 
module system_ps2_mouse_0_0_ps2_mouse_w
   (\state_std[4] ,
    \state_std[3] ,
    \state_std[2] ,
    \state_std[1] ,
    \state_std[0] ,
    mouse_data,
    ps2_clock_T,
    ps2_dat_T,
    ps2_dat_O,
    mouse_data_new,
    clk,
    D,
    reset_n);
  output \state_std[4] ;
  output \state_std[3] ;
  output \state_std[2] ;
  output \state_std[1] ;
  output \state_std[0] ;
  output [31:0]mouse_data;
  output ps2_clock_T;
  output ps2_dat_T;
  output ps2_dat_O;
  output mouse_data_new;
  input clk;
  input [1:0]D;
  input reset_n;

  wire [1:0]D;
  wire [25:0]ack1_tout_1s;
  wire [25:1]ack1_tout_1s0;
  wire ack1_tout_1s0_0;
  wire ack1_tout_1s0_carry__0_i_1_n_0;
  wire ack1_tout_1s0_carry__0_i_2_n_0;
  wire ack1_tout_1s0_carry__0_i_3_n_0;
  wire ack1_tout_1s0_carry__0_i_4_n_0;
  wire ack1_tout_1s0_carry__0_n_0;
  wire ack1_tout_1s0_carry__0_n_1;
  wire ack1_tout_1s0_carry__0_n_2;
  wire ack1_tout_1s0_carry__0_n_3;
  wire ack1_tout_1s0_carry__1_i_1_n_0;
  wire ack1_tout_1s0_carry__1_i_2_n_0;
  wire ack1_tout_1s0_carry__1_i_3_n_0;
  wire ack1_tout_1s0_carry__1_i_4_n_0;
  wire ack1_tout_1s0_carry__1_n_0;
  wire ack1_tout_1s0_carry__1_n_1;
  wire ack1_tout_1s0_carry__1_n_2;
  wire ack1_tout_1s0_carry__1_n_3;
  wire ack1_tout_1s0_carry__2_i_1_n_0;
  wire ack1_tout_1s0_carry__2_i_2_n_0;
  wire ack1_tout_1s0_carry__2_i_3_n_0;
  wire ack1_tout_1s0_carry__2_i_4_n_0;
  wire ack1_tout_1s0_carry__2_n_0;
  wire ack1_tout_1s0_carry__2_n_1;
  wire ack1_tout_1s0_carry__2_n_2;
  wire ack1_tout_1s0_carry__2_n_3;
  wire ack1_tout_1s0_carry__3_i_1_n_0;
  wire ack1_tout_1s0_carry__3_i_2_n_0;
  wire ack1_tout_1s0_carry__3_i_3_n_0;
  wire ack1_tout_1s0_carry__3_i_4_n_0;
  wire ack1_tout_1s0_carry__3_n_0;
  wire ack1_tout_1s0_carry__3_n_1;
  wire ack1_tout_1s0_carry__3_n_2;
  wire ack1_tout_1s0_carry__3_n_3;
  wire ack1_tout_1s0_carry__4_i_1_n_0;
  wire ack1_tout_1s0_carry__4_i_2_n_0;
  wire ack1_tout_1s0_carry__4_i_3_n_0;
  wire ack1_tout_1s0_carry__4_i_4_n_0;
  wire ack1_tout_1s0_carry__4_n_0;
  wire ack1_tout_1s0_carry__4_n_1;
  wire ack1_tout_1s0_carry__4_n_2;
  wire ack1_tout_1s0_carry__4_n_3;
  wire ack1_tout_1s0_carry__5_i_1_n_0;
  wire ack1_tout_1s0_carry_i_1_n_0;
  wire ack1_tout_1s0_carry_i_2_n_0;
  wire ack1_tout_1s0_carry_i_3_n_0;
  wire ack1_tout_1s0_carry_i_4_n_0;
  wire ack1_tout_1s0_carry_n_0;
  wire ack1_tout_1s0_carry_n_1;
  wire ack1_tout_1s0_carry_n_2;
  wire ack1_tout_1s0_carry_n_3;
  wire \ack1_tout_1s[0]_i_1_n_0 ;
  wire \ack1_tout_1s[24]_i_4_n_0 ;
  wire clk;
  wire g0_b0_n_0;
  wire [31:0]mouse_data;
  wire \mouse_data[31]_i_3_n_0 ;
  wire [30:0]mouse_data_int;
  wire mouse_data_new;
  wire mouse_data_new_i_2_n_0;
  wire [1:0]packet_byte;
  wire packet_byte0;
  wire \packet_byte[0]_i_1_n_0 ;
  wire \packet_byte[1]_i_1_n_0 ;
  wire ps2_alt_bit0;
  wire \ps2_alt_bit_reg_n_0_[31] ;
  wire ps2_clock_T;
  wire [7:0]ps2_code;
  wire ps2_code_new_prev;
  wire ps2_dat_O;
  wire ps2_dat_T;
  wire ps2_transceiver_0_n_0;
  wire ps2_transceiver_0_n_12;
  wire ps2_transceiver_0_n_23;
  wire ps2_transceiver_0_n_24;
  wire ps2_transceiver_0_n_25;
  wire ps2_transceiver_0_n_27;
  wire ps2_transceiver_0_n_28;
  wire ps2_transceiver_0_n_29;
  wire ps2_transceiver_0_n_30;
  wire ps2_transceiver_0_n_4;
  wire ps2_transceiver_0_n_5;
  wire reset_n;
  wire [4:0]state_std;
  wire \state_std[0]_i_10_n_0 ;
  wire \state_std[0]_i_11_n_0 ;
  wire \state_std[0]_i_12_n_0 ;
  wire \state_std[0]_i_13_n_0 ;
  wire \state_std[0]_i_14_n_0 ;
  wire \state_std[0]_i_2_n_0 ;
  wire \state_std[0]_i_4_n_0 ;
  wire \state_std[0]_i_8_n_0 ;
  wire \state_std[0]_i_9_n_0 ;
  wire \state_std[1]_i_7_n_0 ;
  wire \state_std[1]_i_8_n_0 ;
  wire \state_std[2]_i_2_n_0 ;
  wire \state_std[2]_i_3_n_0 ;
  wire \state_std[4]_i_10_n_0 ;
  wire \state_std[4]_i_1_n_0 ;
  wire \state_std[4]_i_5_n_0 ;
  wire state_std_0_sn_1;
  wire state_std_1_sn_1;
  wire state_std_2_sn_1;
  wire state_std_3_sn_1;
  wire state_std_4_sn_1;
  wire [8:0]tx_cmd;
  wire tx_cmd0;
  wire \tx_cmd[8]_i_3_n_0 ;
  wire \tx_cmd_reg_n_0_[0] ;
  wire \tx_cmd_reg_n_0_[1] ;
  wire \tx_cmd_reg_n_0_[2] ;
  wire \tx_cmd_reg_n_0_[3] ;
  wire \tx_cmd_reg_n_0_[4] ;
  wire \tx_cmd_reg_n_0_[5] ;
  wire \tx_cmd_reg_n_0_[7] ;
  wire \tx_cmd_reg_n_0_[8] ;
  wire tx_ena;
  wire [3:0]NLW_ack1_tout_1s0_carry__5_CO_UNCONNECTED;
  wire [3:1]NLW_ack1_tout_1s0_carry__5_O_UNCONNECTED;

  assign \state_std[0]  = state_std_0_sn_1;
  assign \state_std[1]  = state_std_1_sn_1;
  assign \state_std[2]  = state_std_2_sn_1;
  assign \state_std[3]  = state_std_3_sn_1;
  assign \state_std[4]  = state_std_4_sn_1;
  CARRY4 ack1_tout_1s0_carry
       (.CI(1'b0),
        .CO({ack1_tout_1s0_carry_n_0,ack1_tout_1s0_carry_n_1,ack1_tout_1s0_carry_n_2,ack1_tout_1s0_carry_n_3}),
        .CYINIT(ack1_tout_1s[0]),
        .DI(ack1_tout_1s[4:1]),
        .O(ack1_tout_1s0[4:1]),
        .S({ack1_tout_1s0_carry_i_1_n_0,ack1_tout_1s0_carry_i_2_n_0,ack1_tout_1s0_carry_i_3_n_0,ack1_tout_1s0_carry_i_4_n_0}));
  CARRY4 ack1_tout_1s0_carry__0
       (.CI(ack1_tout_1s0_carry_n_0),
        .CO({ack1_tout_1s0_carry__0_n_0,ack1_tout_1s0_carry__0_n_1,ack1_tout_1s0_carry__0_n_2,ack1_tout_1s0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(ack1_tout_1s[8:5]),
        .O(ack1_tout_1s0[8:5]),
        .S({ack1_tout_1s0_carry__0_i_1_n_0,ack1_tout_1s0_carry__0_i_2_n_0,ack1_tout_1s0_carry__0_i_3_n_0,ack1_tout_1s0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__0_i_1
       (.I0(ack1_tout_1s[8]),
        .O(ack1_tout_1s0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__0_i_2
       (.I0(ack1_tout_1s[7]),
        .O(ack1_tout_1s0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__0_i_3
       (.I0(ack1_tout_1s[6]),
        .O(ack1_tout_1s0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__0_i_4
       (.I0(ack1_tout_1s[5]),
        .O(ack1_tout_1s0_carry__0_i_4_n_0));
  CARRY4 ack1_tout_1s0_carry__1
       (.CI(ack1_tout_1s0_carry__0_n_0),
        .CO({ack1_tout_1s0_carry__1_n_0,ack1_tout_1s0_carry__1_n_1,ack1_tout_1s0_carry__1_n_2,ack1_tout_1s0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(ack1_tout_1s[12:9]),
        .O(ack1_tout_1s0[12:9]),
        .S({ack1_tout_1s0_carry__1_i_1_n_0,ack1_tout_1s0_carry__1_i_2_n_0,ack1_tout_1s0_carry__1_i_3_n_0,ack1_tout_1s0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__1_i_1
       (.I0(ack1_tout_1s[12]),
        .O(ack1_tout_1s0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__1_i_2
       (.I0(ack1_tout_1s[11]),
        .O(ack1_tout_1s0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__1_i_3
       (.I0(ack1_tout_1s[10]),
        .O(ack1_tout_1s0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__1_i_4
       (.I0(ack1_tout_1s[9]),
        .O(ack1_tout_1s0_carry__1_i_4_n_0));
  CARRY4 ack1_tout_1s0_carry__2
       (.CI(ack1_tout_1s0_carry__1_n_0),
        .CO({ack1_tout_1s0_carry__2_n_0,ack1_tout_1s0_carry__2_n_1,ack1_tout_1s0_carry__2_n_2,ack1_tout_1s0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(ack1_tout_1s[16:13]),
        .O(ack1_tout_1s0[16:13]),
        .S({ack1_tout_1s0_carry__2_i_1_n_0,ack1_tout_1s0_carry__2_i_2_n_0,ack1_tout_1s0_carry__2_i_3_n_0,ack1_tout_1s0_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__2_i_1
       (.I0(ack1_tout_1s[16]),
        .O(ack1_tout_1s0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__2_i_2
       (.I0(ack1_tout_1s[15]),
        .O(ack1_tout_1s0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__2_i_3
       (.I0(ack1_tout_1s[14]),
        .O(ack1_tout_1s0_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__2_i_4
       (.I0(ack1_tout_1s[13]),
        .O(ack1_tout_1s0_carry__2_i_4_n_0));
  CARRY4 ack1_tout_1s0_carry__3
       (.CI(ack1_tout_1s0_carry__2_n_0),
        .CO({ack1_tout_1s0_carry__3_n_0,ack1_tout_1s0_carry__3_n_1,ack1_tout_1s0_carry__3_n_2,ack1_tout_1s0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(ack1_tout_1s[20:17]),
        .O(ack1_tout_1s0[20:17]),
        .S({ack1_tout_1s0_carry__3_i_1_n_0,ack1_tout_1s0_carry__3_i_2_n_0,ack1_tout_1s0_carry__3_i_3_n_0,ack1_tout_1s0_carry__3_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__3_i_1
       (.I0(ack1_tout_1s[20]),
        .O(ack1_tout_1s0_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__3_i_2
       (.I0(ack1_tout_1s[19]),
        .O(ack1_tout_1s0_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__3_i_3
       (.I0(ack1_tout_1s[18]),
        .O(ack1_tout_1s0_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__3_i_4
       (.I0(ack1_tout_1s[17]),
        .O(ack1_tout_1s0_carry__3_i_4_n_0));
  CARRY4 ack1_tout_1s0_carry__4
       (.CI(ack1_tout_1s0_carry__3_n_0),
        .CO({ack1_tout_1s0_carry__4_n_0,ack1_tout_1s0_carry__4_n_1,ack1_tout_1s0_carry__4_n_2,ack1_tout_1s0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(ack1_tout_1s[24:21]),
        .O(ack1_tout_1s0[24:21]),
        .S({ack1_tout_1s0_carry__4_i_1_n_0,ack1_tout_1s0_carry__4_i_2_n_0,ack1_tout_1s0_carry__4_i_3_n_0,ack1_tout_1s0_carry__4_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__4_i_1
       (.I0(ack1_tout_1s[24]),
        .O(ack1_tout_1s0_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__4_i_2
       (.I0(ack1_tout_1s[23]),
        .O(ack1_tout_1s0_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__4_i_3
       (.I0(ack1_tout_1s[22]),
        .O(ack1_tout_1s0_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__4_i_4
       (.I0(ack1_tout_1s[21]),
        .O(ack1_tout_1s0_carry__4_i_4_n_0));
  CARRY4 ack1_tout_1s0_carry__5
       (.CI(ack1_tout_1s0_carry__4_n_0),
        .CO(NLW_ack1_tout_1s0_carry__5_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_ack1_tout_1s0_carry__5_O_UNCONNECTED[3:1],ack1_tout_1s0[25]}),
        .S({1'b0,1'b0,1'b0,ack1_tout_1s0_carry__5_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry__5_i_1
       (.I0(ack1_tout_1s[25]),
        .O(ack1_tout_1s0_carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry_i_1
       (.I0(ack1_tout_1s[4]),
        .O(ack1_tout_1s0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry_i_2
       (.I0(ack1_tout_1s[3]),
        .O(ack1_tout_1s0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry_i_3
       (.I0(ack1_tout_1s[2]),
        .O(ack1_tout_1s0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ack1_tout_1s0_carry_i_4
       (.I0(ack1_tout_1s[1]),
        .O(ack1_tout_1s0_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \ack1_tout_1s[0]_i_1 
       (.I0(ack1_tout_1s[0]),
        .O(\ack1_tout_1s[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ack1_tout_1s[24]_i_4 
       (.I0(state_std_0_sn_1),
        .I1(reset_n),
        .O(\ack1_tout_1s[24]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[0] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(\ack1_tout_1s[0]_i_1_n_0 ),
        .Q(ack1_tout_1s[0]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[10] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[10]),
        .Q(ack1_tout_1s[10]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[11] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[11]),
        .Q(ack1_tout_1s[11]),
        .R(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[12] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[12]),
        .Q(ack1_tout_1s[12]),
        .S(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[13] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[13]),
        .Q(ack1_tout_1s[13]),
        .S(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[14] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[14]),
        .Q(ack1_tout_1s[14]),
        .S(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[15] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[15]),
        .Q(ack1_tout_1s[15]),
        .S(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[16] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[16]),
        .Q(ack1_tout_1s[16]),
        .R(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[17] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[17]),
        .Q(ack1_tout_1s[17]),
        .S(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[18] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[18]),
        .Q(ack1_tout_1s[18]),
        .R(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[19] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[19]),
        .Q(ack1_tout_1s[19]),
        .S(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[1] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[1]),
        .Q(ack1_tout_1s[1]),
        .R(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[20] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[20]),
        .Q(ack1_tout_1s[20]),
        .S(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[21] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[21]),
        .Q(ack1_tout_1s[21]),
        .S(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[22] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[22]),
        .Q(ack1_tout_1s[22]),
        .S(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[23] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[23]),
        .Q(ack1_tout_1s[23]),
        .S(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[24] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[24]),
        .Q(ack1_tout_1s[24]),
        .R(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[25] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[25]),
        .Q(ack1_tout_1s[25]),
        .S(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[2] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[2]),
        .Q(ack1_tout_1s[2]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[3] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[3]),
        .Q(ack1_tout_1s[3]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[4] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[4]),
        .Q(ack1_tout_1s[4]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[5] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[5]),
        .Q(ack1_tout_1s[5]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[6] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[6]),
        .Q(ack1_tout_1s[6]),
        .R(ps2_transceiver_0_n_4));
  FDSE #(
    .INIT(1'b1)) 
    \ack1_tout_1s_reg[7] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[7]),
        .Q(ack1_tout_1s[7]),
        .S(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[8] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[8]),
        .Q(ack1_tout_1s[8]),
        .R(ps2_transceiver_0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    \ack1_tout_1s_reg[9] 
       (.C(clk),
        .CE(ack1_tout_1s0_0),
        .D(ack1_tout_1s0[9]),
        .Q(ack1_tout_1s[9]),
        .R(ps2_transceiver_0_n_4));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00095551)) 
    g0_b0
       (.I0(state_std_0_sn_1),
        .I1(state_std_1_sn_1),
        .I2(state_std_2_sn_1),
        .I3(state_std_3_sn_1),
        .I4(state_std_4_sn_1),
        .O(g0_b0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \mouse_data[31]_i_3 
       (.I0(state_std_2_sn_1),
        .I1(state_std_4_sn_1),
        .O(\mouse_data[31]_i_3_n_0 ));
  FDRE \mouse_data_int_reg[0] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[0]),
        .Q(mouse_data_int[0]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[10] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[2]),
        .Q(mouse_data_int[10]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[11] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[3]),
        .Q(mouse_data_int[11]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[12] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[4]),
        .Q(mouse_data_int[12]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[13] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[5]),
        .Q(mouse_data_int[13]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[14] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[6]),
        .Q(mouse_data_int[14]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[15] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[7]),
        .Q(mouse_data_int[15]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[16] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[0]),
        .Q(mouse_data_int[16]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[17] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[1]),
        .Q(mouse_data_int[17]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[18] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[2]),
        .Q(mouse_data_int[18]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[19] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[3]),
        .Q(mouse_data_int[19]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[1] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[1]),
        .Q(mouse_data_int[1]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[20] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[4]),
        .Q(mouse_data_int[20]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[21] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[5]),
        .Q(mouse_data_int[21]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[22] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[6]),
        .Q(mouse_data_int[22]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[23] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_24),
        .D(ps2_code[7]),
        .Q(mouse_data_int[23]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[24] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[0]),
        .Q(mouse_data_int[24]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[25] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[1]),
        .Q(mouse_data_int[25]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[26] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[2]),
        .Q(mouse_data_int[26]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[27] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[3]),
        .Q(mouse_data_int[27]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[28] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[4]),
        .Q(mouse_data_int[28]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[29] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[5]),
        .Q(mouse_data_int[29]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[2] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[2]),
        .Q(mouse_data_int[2]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[30] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_23),
        .D(ps2_code[6]),
        .Q(mouse_data_int[30]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[3] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[3]),
        .Q(mouse_data_int[3]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[4] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[4]),
        .Q(mouse_data_int[4]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[5] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[5]),
        .Q(mouse_data_int[5]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[6] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[6]),
        .Q(mouse_data_int[6]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[7] 
       (.C(clk),
        .CE(ps2_alt_bit0),
        .D(ps2_code[7]),
        .Q(mouse_data_int[7]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[8] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[0]),
        .Q(mouse_data_int[8]),
        .R(1'b0));
  FDRE \mouse_data_int_reg[9] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_25),
        .D(ps2_code[1]),
        .Q(mouse_data_int[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mouse_data_new_i_2
       (.I0(packet_byte[0]),
        .I1(packet_byte[1]),
        .O(mouse_data_new_i_2_n_0));
  FDCE mouse_data_new_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(ps2_transceiver_0_n_0),
        .D(ps2_transceiver_0_n_29),
        .Q(mouse_data_new));
  FDCE \mouse_data_reg[0] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[0]),
        .Q(mouse_data[0]));
  FDCE \mouse_data_reg[10] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[10]),
        .Q(mouse_data[10]));
  FDCE \mouse_data_reg[11] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[11]),
        .Q(mouse_data[11]));
  FDCE \mouse_data_reg[12] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[12]),
        .Q(mouse_data[12]));
  FDCE \mouse_data_reg[13] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[13]),
        .Q(mouse_data[13]));
  FDCE \mouse_data_reg[14] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[14]),
        .Q(mouse_data[14]));
  FDCE \mouse_data_reg[15] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[15]),
        .Q(mouse_data[15]));
  FDCE \mouse_data_reg[16] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[16]),
        .Q(mouse_data[16]));
  FDCE \mouse_data_reg[17] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[17]),
        .Q(mouse_data[17]));
  FDCE \mouse_data_reg[18] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[18]),
        .Q(mouse_data[18]));
  FDCE \mouse_data_reg[19] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[19]),
        .Q(mouse_data[19]));
  FDCE \mouse_data_reg[1] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[1]),
        .Q(mouse_data[1]));
  FDCE \mouse_data_reg[20] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[20]),
        .Q(mouse_data[20]));
  FDCE \mouse_data_reg[21] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[21]),
        .Q(mouse_data[21]));
  FDCE \mouse_data_reg[22] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[22]),
        .Q(mouse_data[22]));
  FDCE \mouse_data_reg[23] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[23]),
        .Q(mouse_data[23]));
  FDCE \mouse_data_reg[24] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[24]),
        .Q(mouse_data[24]));
  FDCE \mouse_data_reg[25] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[25]),
        .Q(mouse_data[25]));
  FDCE \mouse_data_reg[26] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[26]),
        .Q(mouse_data[26]));
  FDCE \mouse_data_reg[27] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[27]),
        .Q(mouse_data[27]));
  FDCE \mouse_data_reg[28] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[28]),
        .Q(mouse_data[28]));
  FDCE \mouse_data_reg[29] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[29]),
        .Q(mouse_data[29]));
  FDCE \mouse_data_reg[2] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[2]),
        .Q(mouse_data[2]));
  FDCE \mouse_data_reg[30] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[30]),
        .Q(mouse_data[30]));
  FDCE \mouse_data_reg[31] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(\ps2_alt_bit_reg_n_0_[31] ),
        .Q(mouse_data[31]));
  FDCE \mouse_data_reg[3] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[3]),
        .Q(mouse_data[3]));
  FDCE \mouse_data_reg[4] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[4]),
        .Q(mouse_data[4]));
  FDCE \mouse_data_reg[5] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[5]),
        .Q(mouse_data[5]));
  FDCE \mouse_data_reg[6] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[6]),
        .Q(mouse_data[6]));
  FDCE \mouse_data_reg[7] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[7]),
        .Q(mouse_data[7]));
  FDCE \mouse_data_reg[8] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[8]),
        .Q(mouse_data[8]));
  FDCE \mouse_data_reg[9] 
       (.C(clk),
        .CE(ps2_transceiver_0_n_27),
        .CLR(ps2_transceiver_0_n_0),
        .D(mouse_data_int[9]),
        .Q(mouse_data[9]));
  LUT6 #(
    .INIT(64'hFFFF7FFF00008000)) 
    \packet_byte[0]_i_1 
       (.I0(state_std_0_sn_1),
        .I1(reset_n),
        .I2(state_std_4_sn_1),
        .I3(state_std_2_sn_1),
        .I4(ps2_transceiver_0_n_12),
        .I5(packet_byte[0]),
        .O(\packet_byte[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \packet_byte[1]_i_1 
       (.I0(packet_byte[0]),
        .I1(packet_byte0),
        .I2(packet_byte[1]),
        .O(\packet_byte[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \packet_byte_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\packet_byte[0]_i_1_n_0 ),
        .Q(packet_byte[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \packet_byte_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\packet_byte[1]_i_1_n_0 ),
        .Q(packet_byte[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \ps2_alt_bit_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(ps2_transceiver_0_n_5),
        .Q(\ps2_alt_bit_reg_n_0_[31] ),
        .R(1'b0));
  FDRE ps2_code_new_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(ps2_transceiver_0_n_30),
        .Q(ps2_code_new_prev),
        .R(1'b0));
  system_ps2_mouse_0_0_ps2_transceiver ps2_transceiver_0
       (.D(\ps2_alt_bit_reg_n_0_[31] ),
        .E(tx_cmd0),
        .Q({\tx_cmd_reg_n_0_[8] ,\tx_cmd_reg_n_0_[7] ,\tx_cmd_reg_n_0_[5] ,\tx_cmd_reg_n_0_[4] ,\tx_cmd_reg_n_0_[3] ,\tx_cmd_reg_n_0_[2] ,\tx_cmd_reg_n_0_[1] ,\tx_cmd_reg_n_0_[0] }),
        .ack1_tout_1s0_0(ack1_tout_1s0_0),
        .\ack1_tout_1s_reg[15] (\state_std[0]_i_2_n_0 ),
        .\ack1_tout_1s_reg[7] (ps2_transceiver_0_n_4),
        .clk(clk),
        .\mouse_data_int_reg[16] (ps2_transceiver_0_n_24),
        .\mouse_data_int_reg[24] (ps2_transceiver_0_n_23),
        .\mouse_data_int_reg[7] (ps2_code),
        .\mouse_data_int_reg[8] (ps2_transceiver_0_n_25),
        .mouse_data_new(mouse_data_new),
        .mouse_data_new_reg(ps2_transceiver_0_n_29),
        .\mouse_data_reg[0] (ps2_transceiver_0_n_27),
        .packet_byte(packet_byte),
        .packet_byte0(packet_byte0),
        .\packet_byte_reg[0] (ps2_transceiver_0_n_12),
        .\packet_byte_reg[0]_0 (mouse_data_new_i_2_n_0),
        .ps2_alt_bit0(ps2_alt_bit0),
        .\ps2_alt_bit_reg[31] (ps2_transceiver_0_n_5),
        .ps2_clock_T(ps2_clock_T),
        .ps2_code_new_prev(ps2_code_new_prev),
        .ps2_code_new_prev_reg(ps2_transceiver_0_n_30),
        .ps2_dat_I(D),
        .ps2_dat_O(ps2_dat_O),
        .ps2_dat_T(ps2_dat_T),
        .ps2_dat_T_reg_0(ps2_transceiver_0_n_0),
        .reset_n(reset_n),
        .state_std(state_std),
        .\state_std_reg[0] (state_std_0_sn_1),
        .\state_std_reg[0]_0 (\state_std[2]_i_2_n_0 ),
        .\state_std_reg[0]_1 (\ack1_tout_1s[24]_i_4_n_0 ),
        .\state_std_reg[0]_2 (\state_std[4]_i_5_n_0 ),
        .\state_std_reg[0]_3 (\state_std[4]_i_10_n_0 ),
        .\state_std_reg[0]_4 (g0_b0_n_0),
        .\state_std_reg[1] (state_std_1_sn_1),
        .\state_std_reg[1]_0 (tx_cmd[5]),
        .\state_std_reg[1]_1 (\state_std[1]_i_7_n_0 ),
        .\state_std_reg[2] (state_std_2_sn_1),
        .\state_std_reg[2]_0 (\mouse_data[31]_i_3_n_0 ),
        .\state_std_reg[3] (state_std_3_sn_1),
        .\state_std_reg[3]_0 (\state_std[0]_i_4_n_0 ),
        .\state_std_reg[4] (state_std_4_sn_1),
        .\state_std_reg[4]_0 (\state_std[0]_i_14_n_0 ),
        .\state_std_reg[4]_1 (\state_std[2]_i_3_n_0 ),
        .\state_std_reg[4]_2 (\tx_cmd[8]_i_3_n_0 ),
        .\state_std_reg[4]_3 (\state_std[1]_i_8_n_0 ),
        .tx_ena(tx_ena),
        .tx_ena_reg(ps2_transceiver_0_n_28));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_std[0]_i_10 
       (.I0(ack1_tout_1s[7]),
        .I1(ack1_tout_1s[6]),
        .I2(ack1_tout_1s[9]),
        .I3(ack1_tout_1s[8]),
        .O(\state_std[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_std[0]_i_11 
       (.I0(ack1_tout_1s[11]),
        .I1(ack1_tout_1s[10]),
        .I2(ack1_tout_1s[13]),
        .I3(ack1_tout_1s[12]),
        .O(\state_std[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_std[0]_i_12 
       (.I0(ack1_tout_1s[3]),
        .I1(ack1_tout_1s[2]),
        .I2(ack1_tout_1s[5]),
        .I3(ack1_tout_1s[4]),
        .O(\state_std[0]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state_std[0]_i_13 
       (.I0(ack1_tout_1s[24]),
        .I1(ack1_tout_1s[25]),
        .I2(ack1_tout_1s[22]),
        .I3(ack1_tout_1s[23]),
        .I4(ack1_tout_1s[1]),
        .I5(ack1_tout_1s[0]),
        .O(\state_std[0]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \state_std[0]_i_14 
       (.I0(state_std_4_sn_1),
        .I1(state_std_0_sn_1),
        .I2(state_std_2_sn_1),
        .I3(state_std_1_sn_1),
        .O(\state_std[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state_std[0]_i_2 
       (.I0(\state_std[0]_i_8_n_0 ),
        .I1(\state_std[0]_i_9_n_0 ),
        .I2(\state_std[0]_i_10_n_0 ),
        .I3(\state_std[0]_i_11_n_0 ),
        .I4(\state_std[0]_i_12_n_0 ),
        .I5(\state_std[0]_i_13_n_0 ),
        .O(\state_std[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state_std[0]_i_4 
       (.I0(state_std_3_sn_1),
        .I1(state_std_4_sn_1),
        .O(\state_std[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_std[0]_i_8 
       (.I0(ack1_tout_1s[15]),
        .I1(ack1_tout_1s[14]),
        .I2(ack1_tout_1s[17]),
        .I3(ack1_tout_1s[16]),
        .O(\state_std[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_std[0]_i_9 
       (.I0(ack1_tout_1s[19]),
        .I1(ack1_tout_1s[18]),
        .I2(ack1_tout_1s[21]),
        .I3(ack1_tout_1s[20]),
        .O(\state_std[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_std[1]_i_7 
       (.I0(state_std_1_sn_1),
        .I1(state_std_2_sn_1),
        .O(\state_std[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_std[1]_i_8 
       (.I0(state_std_4_sn_1),
        .I1(state_std_0_sn_1),
        .O(\state_std[1]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \state_std[2]_i_2 
       (.I0(state_std_0_sn_1),
        .I1(state_std_2_sn_1),
        .I2(state_std_4_sn_1),
        .O(\state_std[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \state_std[2]_i_3 
       (.I0(state_std_4_sn_1),
        .I1(state_std_3_sn_1),
        .I2(state_std_2_sn_1),
        .I3(state_std_1_sn_1),
        .O(\state_std[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \state_std[4]_i_1 
       (.I0(state_std_0_sn_1),
        .I1(state_std_2_sn_1),
        .I2(state_std_4_sn_1),
        .I3(state_std_3_sn_1),
        .O(\state_std[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \state_std[4]_i_10 
       (.I0(state_std_0_sn_1),
        .I1(state_std_4_sn_1),
        .O(\state_std[4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state_std[4]_i_5 
       (.I0(state_std_0_sn_1),
        .I1(state_std_4_sn_1),
        .I2(state_std_2_sn_1),
        .I3(state_std_1_sn_1),
        .O(\state_std[4]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \state_std_reg[0] 
       (.C(clk),
        .CE(\state_std[4]_i_1_n_0 ),
        .CLR(ps2_transceiver_0_n_0),
        .D(state_std[0]),
        .Q(state_std_0_sn_1));
  FDCE #(
    .INIT(1'b0)) 
    \state_std_reg[1] 
       (.C(clk),
        .CE(\state_std[4]_i_1_n_0 ),
        .CLR(ps2_transceiver_0_n_0),
        .D(state_std[1]),
        .Q(state_std_1_sn_1));
  FDCE #(
    .INIT(1'b0)) 
    \state_std_reg[2] 
       (.C(clk),
        .CE(\state_std[4]_i_1_n_0 ),
        .CLR(ps2_transceiver_0_n_0),
        .D(state_std[2]),
        .Q(state_std_2_sn_1));
  FDCE #(
    .INIT(1'b0)) 
    \state_std_reg[3] 
       (.C(clk),
        .CE(\state_std[4]_i_1_n_0 ),
        .CLR(ps2_transceiver_0_n_0),
        .D(state_std[3]),
        .Q(state_std_3_sn_1));
  FDCE #(
    .INIT(1'b0)) 
    \state_std_reg[4] 
       (.C(clk),
        .CE(\state_std[4]_i_1_n_0 ),
        .CLR(ps2_transceiver_0_n_0),
        .D(state_std[4]),
        .Q(state_std_4_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \tx_cmd[0]_i_1 
       (.I0(state_std_1_sn_1),
        .I1(state_std_4_sn_1),
        .O(tx_cmd[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \tx_cmd[1]_i_1 
       (.I0(state_std_1_sn_1),
        .O(tx_cmd[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0F01)) 
    \tx_cmd[2]_i_1 
       (.I0(state_std_3_sn_1),
        .I1(state_std_4_sn_1),
        .I2(state_std_2_sn_1),
        .I3(state_std_1_sn_1),
        .O(tx_cmd[2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h000D)) 
    \tx_cmd[3]_i_1 
       (.I0(state_std_2_sn_1),
        .I1(state_std_1_sn_1),
        .I2(state_std_4_sn_1),
        .I3(state_std_3_sn_1),
        .O(tx_cmd[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \tx_cmd[4]_i_1 
       (.I0(state_std_1_sn_1),
        .I1(state_std_3_sn_1),
        .I2(state_std_2_sn_1),
        .O(tx_cmd[4]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \tx_cmd[5]_i_1 
       (.I0(state_std_1_sn_1),
        .I1(state_std_2_sn_1),
        .O(tx_cmd[5]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \tx_cmd[7]_i_1 
       (.I0(state_std_1_sn_1),
        .I1(state_std_3_sn_1),
        .O(tx_cmd[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h888F)) 
    \tx_cmd[8]_i_2 
       (.I0(state_std_3_sn_1),
        .I1(state_std_2_sn_1),
        .I2(state_std_4_sn_1),
        .I3(state_std_1_sn_1),
        .O(tx_cmd[8]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h545F)) 
    \tx_cmd[8]_i_3 
       (.I0(state_std_4_sn_1),
        .I1(state_std_3_sn_1),
        .I2(state_std_2_sn_1),
        .I3(state_std_1_sn_1),
        .O(\tx_cmd[8]_i_3_n_0 ));
  FDRE \tx_cmd_reg[0] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[0]),
        .Q(\tx_cmd_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[1] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[1]),
        .Q(\tx_cmd_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[2] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[2]),
        .Q(\tx_cmd_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[3] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[3]),
        .Q(\tx_cmd_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[4] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[4]),
        .Q(\tx_cmd_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[5] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[5]),
        .Q(\tx_cmd_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[7] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[7]),
        .Q(\tx_cmd_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \tx_cmd_reg[8] 
       (.C(clk),
        .CE(tx_cmd0),
        .D(tx_cmd[8]),
        .Q(\tx_cmd_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    tx_ena_reg
       (.C(clk),
        .CE(1'b1),
        .D(ps2_transceiver_0_n_28),
        .Q(tx_ena),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "ps2_transceiver" *) 
module system_ps2_mouse_0_0_ps2_transceiver
   (ps2_dat_T_reg_0,
    ps2_clock_T,
    ps2_dat_T,
    ps2_dat_O,
    \ack1_tout_1s_reg[7] ,
    \ps2_alt_bit_reg[31] ,
    packet_byte0,
    state_std,
    \packet_byte_reg[0] ,
    \mouse_data_int_reg[7] ,
    ack1_tout_1s0_0,
    ps2_alt_bit0,
    \mouse_data_int_reg[24] ,
    \mouse_data_int_reg[16] ,
    \mouse_data_int_reg[8] ,
    E,
    \mouse_data_reg[0] ,
    tx_ena_reg,
    mouse_data_new_reg,
    ps2_code_new_prev_reg,
    clk,
    \state_std_reg[4] ,
    \state_std_reg[3] ,
    \state_std_reg[1] ,
    \state_std_reg[0] ,
    packet_byte,
    D,
    tx_ena,
    reset_n,
    Q,
    \ack1_tout_1s_reg[15] ,
    \state_std_reg[3]_0 ,
    \state_std_reg[4]_0 ,
    \state_std_reg[2] ,
    \state_std_reg[0]_0 ,
    \state_std_reg[4]_1 ,
    \state_std_reg[0]_1 ,
    ps2_code_new_prev,
    \state_std_reg[2]_0 ,
    \state_std_reg[1]_0 ,
    \state_std_reg[0]_2 ,
    \state_std_reg[0]_3 ,
    \state_std_reg[4]_2 ,
    \state_std_reg[1]_1 ,
    \state_std_reg[4]_3 ,
    \state_std_reg[0]_4 ,
    \packet_byte_reg[0]_0 ,
    mouse_data_new,
    ps2_dat_I);
  output ps2_dat_T_reg_0;
  output ps2_clock_T;
  output ps2_dat_T;
  output ps2_dat_O;
  output \ack1_tout_1s_reg[7] ;
  output \ps2_alt_bit_reg[31] ;
  output packet_byte0;
  output [4:0]state_std;
  output \packet_byte_reg[0] ;
  output [7:0]\mouse_data_int_reg[7] ;
  output ack1_tout_1s0_0;
  output ps2_alt_bit0;
  output \mouse_data_int_reg[24] ;
  output \mouse_data_int_reg[16] ;
  output \mouse_data_int_reg[8] ;
  output [0:0]E;
  output [0:0]\mouse_data_reg[0] ;
  output tx_ena_reg;
  output mouse_data_new_reg;
  output ps2_code_new_prev_reg;
  input clk;
  input \state_std_reg[4] ;
  input \state_std_reg[3] ;
  input \state_std_reg[1] ;
  input \state_std_reg[0] ;
  input [1:0]packet_byte;
  input [0:0]D;
  input tx_ena;
  input reset_n;
  input [7:0]Q;
  input \ack1_tout_1s_reg[15] ;
  input \state_std_reg[3]_0 ;
  input \state_std_reg[4]_0 ;
  input \state_std_reg[2] ;
  input \state_std_reg[0]_0 ;
  input \state_std_reg[4]_1 ;
  input \state_std_reg[0]_1 ;
  input ps2_code_new_prev;
  input \state_std_reg[2]_0 ;
  input [0:0]\state_std_reg[1]_0 ;
  input \state_std_reg[0]_2 ;
  input \state_std_reg[0]_3 ;
  input \state_std_reg[4]_2 ;
  input \state_std_reg[1]_1 ;
  input \state_std_reg[4]_3 ;
  input \state_std_reg[0]_4 ;
  input \packet_byte_reg[0]_0 ;
  input mouse_data_new;
  input [1:0]ps2_dat_I;

  wire [0:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire [7:0]Q;
  wire ack1_tout_1s0_0;
  wire \ack1_tout_1s[24]_i_3_n_0 ;
  wire \ack1_tout_1s[24]_i_5_n_0 ;
  wire \ack1_tout_1s_reg[15] ;
  wire \ack1_tout_1s_reg[7] ;
  wire bit_cnt0;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1_n_0 ;
  wire \bit_cnt[2]_i_1_n_0 ;
  wire \bit_cnt[3]_i_2_n_0 ;
  wire \bit_cnt_reg_n_0_[0] ;
  wire \bit_cnt_reg_n_0_[1] ;
  wire \bit_cnt_reg_n_0_[2] ;
  wire \bit_cnt_reg_n_0_[3] ;
  wire clk;
  wire debounce_ps2_clk_n_1;
  wire debounce_ps2_clk_n_2;
  wire debounce_ps2_clk_n_5;
  wire debounce_ps2_clk_n_6;
  wire debounce_ps2_data_n_1;
  wire [12:1]in22;
  wire \mouse_data_int_reg[16] ;
  wire \mouse_data_int_reg[24] ;
  wire [7:0]\mouse_data_int_reg[7] ;
  wire \mouse_data_int_reg[8] ;
  wire mouse_data_new;
  wire mouse_data_new_reg;
  wire [0:0]\mouse_data_reg[0] ;
  wire p_2_in;
  wire p_3_in;
  wire p_4_in;
  wire p_5_in;
  wire p_6_in;
  wire [1:0]packet_byte;
  wire packet_byte0;
  wire \packet_byte_reg[0] ;
  wire \packet_byte_reg[0]_0 ;
  wire ps2_alt_bit0;
  wire \ps2_alt_bit_reg[31] ;
  wire ps2_clk_int;
  wire ps2_clk_int_prev;
  wire ps2_clock_T;
  wire ps2_clock_T_i_1_n_0;
  wire ps2_clock_T_i_2_n_0;
  wire ps2_clock_T_i_3_n_0;
  wire ps2_clock_T_i_4_n_0;
  wire \ps2_code[7]_i_1_n_0 ;
  wire \ps2_code[7]_i_2_n_0 ;
  wire \ps2_code[7]_i_3_n_0 ;
  wire \ps2_code[7]_i_4_n_0 ;
  wire \ps2_code[7]_i_5_n_0 ;
  wire \ps2_code[7]_i_6_n_0 ;
  wire \ps2_code[7]_i_7_n_0 ;
  wire \ps2_code[7]_i_8_n_0 ;
  wire ps2_code_new;
  wire ps2_code_new_i_1_n_0;
  wire ps2_code_new_i_2_n_0;
  wire ps2_code_new_prev;
  wire ps2_code_new_prev_reg;
  wire [1:0]ps2_dat_I;
  wire ps2_dat_O;
  wire ps2_dat_O_i_1_n_0;
  wire ps2_dat_O_i_2_n_0;
  wire ps2_dat_O_i_3_n_0;
  wire ps2_dat_O_i_4_n_0;
  wire ps2_dat_O_i_5_n_0;
  wire ps2_dat_T;
  wire ps2_dat_T_i_1_n_0;
  wire ps2_dat_T_i_2_n_0;
  wire ps2_dat_T_reg_0;
  wire ps2_data_int;
  wire [9:0]ps2_word;
  wire \ps2_word[10]_i_1_n_0 ;
  wire \ps2_word[10]_i_2_n_0 ;
  wire \ps2_word[7]_i_1_n_0 ;
  wire \ps2_word_reg_n_0_[0] ;
  wire \ps2_word_reg_n_0_[10] ;
  wire \ps2_word_reg_n_0_[1] ;
  wire \ps2_word_reg_n_0_[7] ;
  wire \ps2_word_reg_n_0_[8] ;
  wire \ps2_word_reg_n_0_[9] ;
  wire reset_n;
  (* RTL_KEEP = "yes" *) wire [1:0]state;
  wire [4:0]state_std;
  wire \state_std[0]_i_15_n_0 ;
  wire \state_std[0]_i_16_n_0 ;
  wire \state_std[0]_i_17_n_0 ;
  wire \state_std[0]_i_18_n_0 ;
  wire \state_std[0]_i_19_n_0 ;
  wire \state_std[0]_i_3_n_0 ;
  wire \state_std[0]_i_5_n_0 ;
  wire \state_std[0]_i_6_n_0 ;
  wire \state_std[0]_i_7_n_0 ;
  wire \state_std[1]_i_2_n_0 ;
  wire \state_std[1]_i_3_n_0 ;
  wire \state_std[1]_i_4_n_0 ;
  wire \state_std[1]_i_5_n_0 ;
  wire \state_std[1]_i_6_n_0 ;
  wire \state_std[2]_i_4_n_0 ;
  wire \state_std[2]_i_5_n_0 ;
  wire \state_std[2]_i_6_n_0 ;
  wire \state_std[2]_i_7_n_0 ;
  wire \state_std[2]_i_8_n_0 ;
  wire \state_std[3]_i_2_n_0 ;
  wire \state_std[3]_i_3_n_0 ;
  wire \state_std[4]_i_11_n_0 ;
  wire \state_std[4]_i_3_n_0 ;
  wire \state_std[4]_i_4_n_0 ;
  wire \state_std[4]_i_6_n_0 ;
  wire \state_std[4]_i_7_n_0 ;
  wire \state_std[4]_i_8_n_0 ;
  wire \state_std[4]_i_9_n_0 ;
  wire \state_std_reg[0] ;
  wire \state_std_reg[0]_0 ;
  wire \state_std_reg[0]_1 ;
  wire \state_std_reg[0]_2 ;
  wire \state_std_reg[0]_3 ;
  wire \state_std_reg[0]_4 ;
  wire \state_std_reg[1] ;
  wire [0:0]\state_std_reg[1]_0 ;
  wire \state_std_reg[1]_1 ;
  wire \state_std_reg[2] ;
  wire \state_std_reg[2]_0 ;
  wire \state_std_reg[3] ;
  wire \state_std_reg[3]_0 ;
  wire \state_std_reg[4] ;
  wire \state_std_reg[4]_0 ;
  wire \state_std_reg[4]_1 ;
  wire \state_std_reg[4]_2 ;
  wire \state_std_reg[4]_3 ;
  wire [1:0]sync_ffs;
  wire timer0;
  wire \timer[0]_i_1_n_0 ;
  wire \timer[12]_i_11_n_0 ;
  wire \timer[12]_i_12_n_0 ;
  wire \timer[12]_i_13_n_0 ;
  wire \timer[12]_i_14_n_0 ;
  wire \timer[12]_i_15_n_0 ;
  wire \timer[12]_i_16_n_0 ;
  wire \timer[12]_i_18_n_0 ;
  wire \timer[12]_i_19_n_0 ;
  wire \timer[12]_i_4_n_0 ;
  wire \timer[12]_i_5_n_0 ;
  wire \timer[12]_i_6_n_0 ;
  wire \timer[12]_i_7_n_0 ;
  wire \timer_reg[12]_i_3_n_1 ;
  wire \timer_reg[12]_i_3_n_2 ;
  wire \timer_reg[12]_i_3_n_3 ;
  wire \timer_reg[4]_i_1_n_0 ;
  wire \timer_reg[4]_i_1_n_1 ;
  wire \timer_reg[4]_i_1_n_2 ;
  wire \timer_reg[4]_i_1_n_3 ;
  wire \timer_reg[8]_i_1_n_0 ;
  wire \timer_reg[8]_i_1_n_1 ;
  wire \timer_reg[8]_i_1_n_2 ;
  wire \timer_reg[8]_i_1_n_3 ;
  wire \timer_reg_n_0_[0] ;
  wire \timer_reg_n_0_[10] ;
  wire \timer_reg_n_0_[11] ;
  wire \timer_reg_n_0_[12] ;
  wire \timer_reg_n_0_[1] ;
  wire \timer_reg_n_0_[2] ;
  wire \timer_reg_n_0_[3] ;
  wire \timer_reg_n_0_[4] ;
  wire \timer_reg_n_0_[5] ;
  wire \timer_reg_n_0_[6] ;
  wire \timer_reg_n_0_[7] ;
  wire \timer_reg_n_0_[8] ;
  wire \timer_reg_n_0_[9] ;
  wire tx_busy;
  wire tx_busy_i_1_n_0;
  wire tx_ena;
  wire tx_ena_reg;
  wire [3:3]\NLW_timer_reg[12]_i_3_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(\bit_cnt_reg_n_0_[3] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(\bit_cnt_reg_n_0_[1] ),
        .I5(\bit_cnt_reg_n_0_[0] ),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "inhibit:01,transact:10,tx_complete:11,receive:00" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(ps2_dat_T_reg_0),
        .D(debounce_ps2_data_n_1),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "inhibit:01,transact:10,tx_complete:11,receive:00" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(ps2_dat_T_reg_0),
        .D(debounce_ps2_clk_n_5),
        .Q(state[1]));
  LUT5 #(
    .INIT(32'h00000100)) 
    \ack1_tout_1s[24]_i_1 
       (.I0(\state_std_reg[4] ),
        .I1(\state_std_reg[3] ),
        .I2(\state_std_reg[1] ),
        .I3(\ack1_tout_1s[24]_i_3_n_0 ),
        .I4(\state_std_reg[0] ),
        .O(\ack1_tout_1s_reg[7] ));
  LUT6 #(
    .INIT(64'h000000FF00000080)) 
    \ack1_tout_1s[24]_i_2 
       (.I0(\state_std_reg[0]_1 ),
        .I1(\ack1_tout_1s[24]_i_5_n_0 ),
        .I2(\ack1_tout_1s_reg[15] ),
        .I3(\state_std_reg[3]_0 ),
        .I4(\state_std_reg[1] ),
        .I5(\ack1_tout_1s[24]_i_3_n_0 ),
        .O(ack1_tout_1s0_0));
  LUT4 #(
    .INIT(16'h1000)) 
    \ack1_tout_1s[24]_i_3 
       (.I0(\state_std_reg[2] ),
        .I1(\state_std_reg[0] ),
        .I2(reset_n),
        .I3(tx_busy),
        .O(\ack1_tout_1s[24]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \ack1_tout_1s[24]_i_5 
       (.I0(ps2_code_new),
        .I1(ps2_code_new_prev),
        .I2(\state_std_reg[2] ),
        .O(\ack1_tout_1s[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \bit_cnt[0]_i_1 
       (.I0(state[1]),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .O(\bit_cnt[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h48)) 
    \bit_cnt[1]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(state[1]),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .O(\bit_cnt[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7080)) 
    \bit_cnt[2]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(state[1]),
        .I3(\bit_cnt_reg_n_0_[2] ),
        .O(\bit_cnt[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7F008000)) 
    \bit_cnt[3]_i_2 
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .I3(state[1]),
        .I4(\bit_cnt_reg_n_0_[3] ),
        .O(\bit_cnt[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[0] 
       (.C(clk),
        .CE(bit_cnt0),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .Q(\bit_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[1] 
       (.C(clk),
        .CE(bit_cnt0),
        .D(\bit_cnt[1]_i_1_n_0 ),
        .Q(\bit_cnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[2] 
       (.C(clk),
        .CE(bit_cnt0),
        .D(\bit_cnt[2]_i_1_n_0 ),
        .Q(\bit_cnt_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[3] 
       (.C(clk),
        .CE(bit_cnt0),
        .D(\bit_cnt[3]_i_2_n_0 ),
        .Q(\bit_cnt_reg_n_0_[3] ),
        .R(1'b0));
  system_ps2_mouse_0_0_debounce debounce_ps2_clk
       (.D(debounce_ps2_clk_n_5),
        .E(debounce_ps2_clk_n_2),
        .\FSM_sequential_state_reg[0] (\timer[12]_i_4_n_0 ),
        .\FSM_sequential_state_reg[0]_0 (\timer[12]_i_19_n_0 ),
        .\FSM_sequential_state_reg[1] (\timer[12]_i_16_n_0 ),
        .Q(sync_ffs[0]),
        .\bit_cnt_reg[0] (bit_cnt0),
        .clk(clk),
        .out(state),
        .ps2_clk_int(ps2_clk_int),
        .ps2_clk_int_prev(ps2_clk_int_prev),
        .ps2_clk_int_prev_reg(debounce_ps2_clk_n_6),
        .ps2_data_int(ps2_data_int),
        .reset_n(reset_n),
        .timer0(timer0),
        .\timer_reg[0] (\timer[12]_i_5_n_0 ),
        .\timer_reg[11] (\timer[12]_i_14_n_0 ),
        .\timer_reg[11]_0 (ps2_dat_O_i_4_n_0),
        .\timer_reg[12] (debounce_ps2_clk_n_1),
        .\timer_reg[12]_0 (\timer[12]_i_18_n_0 ),
        .\timer_reg[12]_1 (\timer_reg_n_0_[12] ),
        .\timer_reg[3] (\timer[12]_i_6_n_0 ),
        .\timer_reg[4] (\timer[12]_i_7_n_0 ),
        .\timer_reg[9] (\timer[12]_i_11_n_0 ),
        .\timer_reg[9]_0 (\timer[12]_i_15_n_0 ),
        .tx_ena(tx_ena));
  system_ps2_mouse_0_0_debounce_0 debounce_ps2_data
       (.D(debounce_ps2_data_n_1),
        .Q(sync_ffs[1]),
        .\bit_cnt_reg[3] (\FSM_sequential_state[0]_i_3_n_0 ),
        .clk(clk),
        .out(state),
        .ps2_clk_int(ps2_clk_int),
        .ps2_data_int(ps2_data_int),
        .\timer_reg[12] (ps2_clock_T_i_2_n_0),
        .tx_ena(tx_ena));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \mouse_data[31]_i_1 
       (.I0(packet_byte[0]),
        .I1(packet_byte[1]),
        .I2(ps2_code_new_prev),
        .I3(ps2_code_new),
        .I4(\state_std_reg[0] ),
        .I5(\state_std_reg[2]_0 ),
        .O(\mouse_data_reg[0] ));
  LUT1 #(
    .INIT(2'h1)) 
    \mouse_data[31]_i_2 
       (.I0(reset_n),
        .O(ps2_dat_T_reg_0));
  LUT3 #(
    .INIT(8'h20)) 
    \mouse_data_int[15]_i_1 
       (.I0(packet_byte0),
        .I1(packet_byte[1]),
        .I2(packet_byte[0]),
        .O(\mouse_data_int_reg[8] ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \mouse_data_int[23]_i_1 
       (.I0(packet_byte0),
        .I1(packet_byte[0]),
        .I2(packet_byte[1]),
        .O(\mouse_data_int_reg[16] ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \mouse_data_int[30]_i_1 
       (.I0(packet_byte0),
        .I1(packet_byte[1]),
        .I2(packet_byte[0]),
        .O(\mouse_data_int_reg[24] ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \mouse_data_int[7]_i_1 
       (.I0(packet_byte0),
        .I1(packet_byte[1]),
        .I2(packet_byte[0]),
        .O(ps2_alt_bit0));
  LUT6 #(
    .INIT(64'hEFEFFFFF20000000)) 
    mouse_data_new_i_1
       (.I0(ps2_code_new_prev),
        .I1(\state_std_reg[2]_0 ),
        .I2(\state_std_reg[0] ),
        .I3(\packet_byte_reg[0]_0 ),
        .I4(ps2_code_new),
        .I5(mouse_data_new),
        .O(mouse_data_new_reg));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \packet_byte[0]_i_2 
       (.I0(ps2_code_new_prev),
        .I1(ps2_code_new),
        .O(\packet_byte_reg[0] ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \packet_byte[1]_i_2 
       (.I0(ps2_code_new_prev),
        .I1(ps2_code_new),
        .I2(\state_std_reg[2] ),
        .I3(\state_std_reg[4] ),
        .I4(reset_n),
        .I5(\state_std_reg[0] ),
        .O(packet_byte0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFD02)) 
    \ps2_alt_bit[31]_i_1 
       (.I0(packet_byte0),
        .I1(packet_byte[1]),
        .I2(packet_byte[0]),
        .I3(D),
        .O(\ps2_alt_bit_reg[31] ));
  FDRE ps2_clk_int_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(debounce_ps2_clk_n_6),
        .Q(ps2_clk_int_prev),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hF3FF3131)) 
    ps2_clock_T_i_1
       (.I0(tx_ena),
        .I1(state[0]),
        .I2(state[1]),
        .I3(ps2_clock_T_i_2_n_0),
        .I4(ps2_clock_T),
        .O(ps2_clock_T_i_1_n_0));
  LUT5 #(
    .INIT(32'h333F3337)) 
    ps2_clock_T_i_2
       (.I0(ps2_clock_T_i_3_n_0),
        .I1(\timer_reg_n_0_[12] ),
        .I2(\timer_reg_n_0_[11] ),
        .I3(\timer_reg_n_0_[10] ),
        .I4(ps2_clock_T_i_4_n_0),
        .O(ps2_clock_T_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    ps2_clock_T_i_3
       (.I0(\timer_reg_n_0_[6] ),
        .I1(\timer_reg_n_0_[3] ),
        .I2(\timer_reg_n_0_[5] ),
        .I3(\timer_reg_n_0_[4] ),
        .O(ps2_clock_T_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    ps2_clock_T_i_4
       (.I0(\timer_reg_n_0_[9] ),
        .I1(\timer_reg_n_0_[7] ),
        .I2(\timer_reg_n_0_[8] ),
        .O(ps2_clock_T_i_4_n_0));
  FDCE ps2_clock_T_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(ps2_dat_T_reg_0),
        .D(ps2_clock_T_i_1_n_0),
        .Q(ps2_clock_T));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \ps2_code[7]_i_1 
       (.I0(\ps2_code[7]_i_2_n_0 ),
        .I1(\ps2_word_reg_n_0_[0] ),
        .I2(\ps2_word_reg_n_0_[10] ),
        .I3(tx_ena),
        .I4(\ps2_code[7]_i_3_n_0 ),
        .I5(\ps2_code[7]_i_4_n_0 ),
        .O(\ps2_code[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFF7F)) 
    \ps2_code[7]_i_2 
       (.I0(\timer_reg_n_0_[9] ),
        .I1(\timer_reg_n_0_[7] ),
        .I2(\timer_reg_n_0_[0] ),
        .I3(\ps2_code[7]_i_5_n_0 ),
        .I4(\ps2_code[7]_i_6_n_0 ),
        .O(\ps2_code[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ps2_code[7]_i_3 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\ps2_code[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \ps2_code[7]_i_4 
       (.I0(\ps2_code[7]_i_7_n_0 ),
        .I1(p_4_in),
        .I2(p_3_in),
        .I3(p_6_in),
        .I4(p_5_in),
        .I5(\ps2_code[7]_i_8_n_0 ),
        .O(\ps2_code[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ps2_code[7]_i_5 
       (.I0(\timer_reg_n_0_[4] ),
        .I1(\timer_reg_n_0_[3] ),
        .I2(\timer_reg_n_0_[11] ),
        .I3(\timer_reg_n_0_[6] ),
        .O(\ps2_code[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \ps2_code[7]_i_6 
       (.I0(\timer_reg_n_0_[2] ),
        .I1(\timer_reg_n_0_[1] ),
        .I2(\timer_reg_n_0_[5] ),
        .I3(\timer_reg_n_0_[12] ),
        .I4(\timer_reg_n_0_[10] ),
        .I5(\timer_reg_n_0_[8] ),
        .O(\ps2_code[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ps2_code[7]_i_7 
       (.I0(p_2_in),
        .I1(\ps2_word_reg_n_0_[7] ),
        .O(\ps2_code[7]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \ps2_code[7]_i_8 
       (.I0(\ps2_word_reg_n_0_[1] ),
        .I1(\ps2_word_reg_n_0_[9] ),
        .I2(\ps2_word_reg_n_0_[8] ),
        .O(\ps2_code[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00FFFFFF00002000)) 
    ps2_code_new_i_1
       (.I0(\ps2_code[7]_i_4_n_0 ),
        .I1(\ps2_word_reg_n_0_[0] ),
        .I2(\ps2_word_reg_n_0_[10] ),
        .I3(ps2_code_new_i_2_n_0),
        .I4(\ps2_code[7]_i_2_n_0 ),
        .I5(ps2_code_new),
        .O(ps2_code_new_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    ps2_code_new_i_2
       (.I0(state[1]),
        .I1(state[0]),
        .I2(tx_ena),
        .O(ps2_code_new_i_2_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    ps2_code_new_prev_i_1
       (.I0(ps2_code_new),
        .I1(reset_n),
        .I2(ps2_code_new_prev),
        .O(ps2_code_new_prev_reg));
  FDCE ps2_code_new_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(ps2_dat_T_reg_0),
        .D(ps2_code_new_i_1_n_0),
        .Q(ps2_code_new));
  FDCE \ps2_code_reg[0] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(\ps2_word_reg_n_0_[1] ),
        .Q(\mouse_data_int_reg[7] [0]));
  FDCE \ps2_code_reg[1] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(p_6_in),
        .Q(\mouse_data_int_reg[7] [1]));
  FDCE \ps2_code_reg[2] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(p_5_in),
        .Q(\mouse_data_int_reg[7] [2]));
  FDCE \ps2_code_reg[3] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(p_4_in),
        .Q(\mouse_data_int_reg[7] [3]));
  FDCE \ps2_code_reg[4] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(p_3_in),
        .Q(\mouse_data_int_reg[7] [4]));
  FDCE \ps2_code_reg[5] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(p_2_in),
        .Q(\mouse_data_int_reg[7] [5]));
  FDCE \ps2_code_reg[6] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(\ps2_word_reg_n_0_[7] ),
        .Q(\mouse_data_int_reg[7] [6]));
  FDCE \ps2_code_reg[7] 
       (.C(clk),
        .CE(\ps2_code[7]_i_1_n_0 ),
        .CLR(ps2_dat_T_reg_0),
        .D(\ps2_word_reg_n_0_[8] ),
        .Q(\mouse_data_int_reg[7] [7]));
  LUT6 #(
    .INIT(64'hAAEFEFEFAA202020)) 
    ps2_dat_O_i_1
       (.I0(\ps2_word_reg_n_0_[0] ),
        .I1(ps2_dat_O_i_2_n_0),
        .I2(ps2_dat_O_i_3_n_0),
        .I3(ps2_dat_O_i_4_n_0),
        .I4(ps2_dat_O_i_5_n_0),
        .I5(ps2_dat_O),
        .O(ps2_dat_O_i_1_n_0));
  LUT4 #(
    .INIT(16'hA8FF)) 
    ps2_dat_O_i_2
       (.I0(\bit_cnt_reg_n_0_[3] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .I3(state[1]),
        .O(ps2_dat_O_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ps2_dat_O_i_3
       (.I0(reset_n),
        .I1(state[0]),
        .O(ps2_dat_O_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAAAAAA)) 
    ps2_dat_O_i_4
       (.I0(\timer_reg_n_0_[11] ),
        .I1(ps2_clock_T_i_3_n_0),
        .I2(\timer_reg_n_0_[8] ),
        .I3(\timer_reg_n_0_[7] ),
        .I4(\timer_reg_n_0_[9] ),
        .I5(\timer_reg_n_0_[10] ),
        .O(ps2_dat_O_i_4_n_0));
  LUT4 #(
    .INIT(16'h0800)) 
    ps2_dat_O_i_5
       (.I0(reset_n),
        .I1(\timer_reg_n_0_[12] ),
        .I2(state[1]),
        .I3(state[0]),
        .O(ps2_dat_O_i_5_n_0));
  FDRE ps2_dat_O_reg
       (.C(clk),
        .CE(1'b1),
        .D(ps2_dat_O_i_1_n_0),
        .Q(ps2_dat_O),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF33AAFF0033AA0F)) 
    ps2_dat_T_i_1
       (.I0(ps2_clock_T_i_2_n_0),
        .I1(ps2_dat_T_i_2_n_0),
        .I2(tx_ena),
        .I3(state[0]),
        .I4(state[1]),
        .I5(ps2_dat_T),
        .O(ps2_dat_T_i_1_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    ps2_dat_T_i_2
       (.I0(\bit_cnt_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(\bit_cnt_reg_n_0_[3] ),
        .O(ps2_dat_T_i_2_n_0));
  FDPE ps2_dat_T_reg
       (.C(clk),
        .CE(1'b1),
        .D(ps2_dat_T_i_1_n_0),
        .PRE(ps2_dat_T_reg_0),
        .Q(ps2_dat_T));
  LUT3 #(
    .INIT(8'hD0)) 
    \ps2_word[0]_i_1 
       (.I0(tx_ena),
        .I1(state[1]),
        .I2(\ps2_word_reg_n_0_[1] ),
        .O(ps2_word[0]));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \ps2_word[10]_i_1 
       (.I0(ps2_data_int),
        .I1(\ps2_word[10]_i_2_n_0 ),
        .I2(ps2_clk_int_prev),
        .I3(ps2_clk_int),
        .I4(ps2_dat_O_i_3_n_0),
        .I5(\ps2_word_reg_n_0_[10] ),
        .O(\ps2_word[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \ps2_word[10]_i_2 
       (.I0(state[1]),
        .I1(tx_ena),
        .O(\ps2_word[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[1]_i_1 
       (.I0(p_6_in),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[0]),
        .O(ps2_word[1]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[2]_i_1 
       (.I0(p_5_in),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[1]),
        .O(ps2_word[2]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[3]_i_1 
       (.I0(p_4_in),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[2]),
        .O(ps2_word[3]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[4]_i_1 
       (.I0(p_3_in),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[3]),
        .O(ps2_word[4]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[5]_i_1 
       (.I0(p_2_in),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[4]),
        .O(ps2_word[5]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[6]_i_1 
       (.I0(\ps2_word_reg_n_0_[7] ),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[5]),
        .O(ps2_word[6]));
  LUT5 #(
    .INIT(32'hCFCCAAAA)) 
    \ps2_word[7]_i_1 
       (.I0(\ps2_word_reg_n_0_[7] ),
        .I1(\ps2_word_reg_n_0_[8] ),
        .I2(state[1]),
        .I3(tx_ena),
        .I4(debounce_ps2_clk_n_2),
        .O(\ps2_word[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[8]_i_1 
       (.I0(\ps2_word_reg_n_0_[9] ),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[6]),
        .O(ps2_word[8]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \ps2_word[9]_i_2 
       (.I0(\ps2_word_reg_n_0_[10] ),
        .I1(state[1]),
        .I2(tx_ena),
        .I3(Q[7]),
        .O(ps2_word[9]));
  FDRE \ps2_word_reg[0] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[0]),
        .Q(\ps2_word_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \ps2_word_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\ps2_word[10]_i_1_n_0 ),
        .Q(\ps2_word_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \ps2_word_reg[1] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[1]),
        .Q(\ps2_word_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \ps2_word_reg[2] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[2]),
        .Q(p_6_in),
        .R(1'b0));
  FDRE \ps2_word_reg[3] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[3]),
        .Q(p_5_in),
        .R(1'b0));
  FDRE \ps2_word_reg[4] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[4]),
        .Q(p_4_in),
        .R(1'b0));
  FDRE \ps2_word_reg[5] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[5]),
        .Q(p_3_in),
        .R(1'b0));
  FDRE \ps2_word_reg[6] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[6]),
        .Q(p_2_in),
        .R(1'b0));
  FDRE \ps2_word_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\ps2_word[7]_i_1_n_0 ),
        .Q(\ps2_word_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \ps2_word_reg[8] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[8]),
        .Q(\ps2_word_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \ps2_word_reg[9] 
       (.C(clk),
        .CE(debounce_ps2_clk_n_2),
        .D(ps2_word[9]),
        .Q(\ps2_word_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFC8)) 
    \state_std[0]_i_1 
       (.I0(\ack1_tout_1s_reg[15] ),
        .I1(\state_std[0]_i_3_n_0 ),
        .I2(\state_std_reg[3]_0 ),
        .I3(\state_std[0]_i_5_n_0 ),
        .I4(\state_std[0]_i_6_n_0 ),
        .I5(\state_std[0]_i_7_n_0 ),
        .O(state_std[0]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \state_std[0]_i_15 
       (.I0(\state_std_reg[3] ),
        .I1(\state_std_reg[4] ),
        .I2(\mouse_data_int_reg[7] [4]),
        .I3(\mouse_data_int_reg[7] [6]),
        .I4(\state_std_reg[2] ),
        .I5(\state_std_reg[1] ),
        .O(\state_std[0]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \state_std[0]_i_16 
       (.I0(\state_std_reg[2] ),
        .I1(\state_std_reg[4] ),
        .I2(\mouse_data_int_reg[7] [2]),
        .O(\state_std[0]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h2E00002E)) 
    \state_std[0]_i_17 
       (.I0(\state_std_reg[1] ),
        .I1(tx_busy),
        .I2(\state_std_reg[0] ),
        .I3(\mouse_data_int_reg[7] [1]),
        .I4(\mouse_data_int_reg[7] [0]),
        .O(\state_std[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h00B000B000B00000)) 
    \state_std[0]_i_18 
       (.I0(ps2_code_new_prev),
        .I1(ps2_code_new),
        .I2(\state_std_reg[0] ),
        .I3(\state_std_reg[4] ),
        .I4(\state_std_reg[2] ),
        .I5(\state_std_reg[1] ),
        .O(\state_std[0]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h0004000444444404)) 
    \state_std[0]_i_19 
       (.I0(\state_std_reg[0] ),
        .I1(tx_busy),
        .I2(\state_std_reg[1] ),
        .I3(\state_std_reg[2] ),
        .I4(\state_std_reg[3] ),
        .I5(\state_std_reg[4] ),
        .O(\state_std[0]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0000450045454500)) 
    \state_std[0]_i_3 
       (.I0(\state_std_reg[2] ),
        .I1(ps2_code_new_prev),
        .I2(ps2_code_new),
        .I3(\state_std_reg[0] ),
        .I4(tx_busy),
        .I5(\state_std_reg[1] ),
        .O(\state_std[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h444444444444F444)) 
    \state_std[0]_i_5 
       (.I0(tx_busy),
        .I1(\state_std_reg[4]_0 ),
        .I2(\state_std[4]_i_9_n_0 ),
        .I3(\state_std[0]_i_15_n_0 ),
        .I4(\state_std_reg[0] ),
        .I5(\packet_byte_reg[0] ),
        .O(\state_std[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \state_std[0]_i_6 
       (.I0(\packet_byte_reg[0] ),
        .I1(\state_std_reg[2] ),
        .I2(\state_std_reg[4] ),
        .I3(\state_std[4]_i_9_n_0 ),
        .I4(\mouse_data_int_reg[7] [4]),
        .I5(\mouse_data_int_reg[7] [6]),
        .O(\state_std[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4000)) 
    \state_std[0]_i_7 
       (.I0(\packet_byte_reg[0] ),
        .I1(\state_std[0]_i_16_n_0 ),
        .I2(\state_std[0]_i_17_n_0 ),
        .I3(\state_std[4]_i_8_n_0 ),
        .I4(\state_std[0]_i_18_n_0 ),
        .I5(\state_std[0]_i_19_n_0 ),
        .O(\state_std[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFEEEEEE)) 
    \state_std[1]_i_1 
       (.I0(\state_std[1]_i_2_n_0 ),
        .I1(\state_std[1]_i_3_n_0 ),
        .I2(\state_std_reg[4] ),
        .I3(\state_std_reg[1] ),
        .I4(\state_std[1]_i_4_n_0 ),
        .I5(\state_std[1]_i_5_n_0 ),
        .O(state_std[1]));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    \state_std[1]_i_2 
       (.I0(\state_std_reg[1] ),
        .I1(\state_std_reg[2]_0 ),
        .I2(\state_std[3]_i_3_n_0 ),
        .I3(\mouse_data_int_reg[7] [6]),
        .I4(\mouse_data_int_reg[7] [4]),
        .I5(\state_std[4]_i_9_n_0 ),
        .O(\state_std[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAEAAAAAAAAAAA)) 
    \state_std[1]_i_3 
       (.I0(\state_std[1]_i_6_n_0 ),
        .I1(\state_std[4]_i_8_n_0 ),
        .I2(\state_std[4]_i_7_n_0 ),
        .I3(\state_std_reg[1]_1 ),
        .I4(\mouse_data_int_reg[7] [2]),
        .I5(\state_std_reg[4]_3 ),
        .O(\state_std[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55550004)) 
    \state_std[1]_i_4 
       (.I0(\state_std_reg[0] ),
        .I1(\state_std[4]_i_9_n_0 ),
        .I2(\mouse_data_int_reg[7] [4]),
        .I3(\mouse_data_int_reg[7] [6]),
        .I4(\state_std_reg[3] ),
        .I5(\packet_byte_reg[0] ),
        .O(\state_std[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000D00000F0D0)) 
    \state_std[1]_i_5 
       (.I0(ps2_code_new),
        .I1(ps2_code_new_prev),
        .I2(\state_std_reg[1] ),
        .I3(\state_std_reg[2] ),
        .I4(\state_std_reg[0] ),
        .I5(\state_std_reg[4] ),
        .O(\state_std[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \state_std[1]_i_6 
       (.I0(\state_std_reg[1] ),
        .I1(\state_std_reg[2] ),
        .I2(\state_std_reg[0] ),
        .I3(\state_std_reg[4] ),
        .I4(tx_busy),
        .O(\state_std[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \state_std[2]_i_1 
       (.I0(\state_std_reg[0]_0 ),
        .I1(\state_std[4]_i_4_n_0 ),
        .I2(\state_std_reg[4]_1 ),
        .I3(\state_std[2]_i_4_n_0 ),
        .I4(\state_std[2]_i_5_n_0 ),
        .I5(\state_std[2]_i_6_n_0 ),
        .O(state_std[2]));
  LUT6 #(
    .INIT(64'hC400000000000000)) 
    \state_std[2]_i_4 
       (.I0(\state_std_reg[1] ),
        .I1(\state_std_reg[2] ),
        .I2(\state_std_reg[4] ),
        .I3(\mouse_data_int_reg[7] [6]),
        .I4(\mouse_data_int_reg[7] [4]),
        .I5(\state_std[4]_i_9_n_0 ),
        .O(\state_std[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAEAAAA)) 
    \state_std[2]_i_5 
       (.I0(\state_std[2]_i_7_n_0 ),
        .I1(\state_std[4]_i_8_n_0 ),
        .I2(\state_std_reg[3]_0 ),
        .I3(\mouse_data_int_reg[7] [1]),
        .I4(\state_std[2]_i_8_n_0 ),
        .I5(\state_std[3]_i_3_n_0 ),
        .O(\state_std[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hD0)) 
    \state_std[2]_i_6 
       (.I0(ps2_code_new),
        .I1(ps2_code_new_prev),
        .I2(\state_std_reg[2] ),
        .O(\state_std[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \state_std[2]_i_7 
       (.I0(\state_std_reg[1] ),
        .I1(\state_std_reg[2] ),
        .I2(\state_std_reg[0] ),
        .I3(\state_std_reg[4] ),
        .I4(tx_busy),
        .O(\state_std[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state_std[2]_i_8 
       (.I0(\state_std_reg[2] ),
        .I1(\state_std_reg[1] ),
        .I2(\mouse_data_int_reg[7] [2]),
        .I3(\mouse_data_int_reg[7] [0]),
        .O(\state_std[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000CEEE00002000)) 
    \state_std[3]_i_1 
       (.I0(\state_std[3]_i_2_n_0 ),
        .I1(\state_std[3]_i_3_n_0 ),
        .I2(\state_std_reg[2] ),
        .I3(\state_std_reg[1] ),
        .I4(\state_std_reg[4] ),
        .I5(\state_std_reg[3] ),
        .O(state_std[3]));
  LUT3 #(
    .INIT(8'h80)) 
    \state_std[3]_i_2 
       (.I0(\mouse_data_int_reg[7] [6]),
        .I1(\mouse_data_int_reg[7] [4]),
        .I2(\state_std[4]_i_9_n_0 ),
        .O(\state_std[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \state_std[3]_i_3 
       (.I0(ps2_code_new),
        .I1(ps2_code_new_prev),
        .I2(\state_std_reg[0] ),
        .O(\state_std[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBFBBBBB00000000)) 
    \state_std[4]_i_11 
       (.I0(ps2_code_new_prev),
        .I1(ps2_code_new),
        .I2(\state_std_reg[1] ),
        .I3(\state_std_reg[2] ),
        .I4(\state_std_reg[0] ),
        .I5(\state_std_reg[4] ),
        .O(\state_std[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAAEA)) 
    \state_std[4]_i_2 
       (.I0(\state_std[4]_i_3_n_0 ),
        .I1(\state_std[4]_i_4_n_0 ),
        .I2(\state_std_reg[3] ),
        .I3(\state_std_reg[1]_0 ),
        .I4(\state_std_reg[0]_2 ),
        .I5(\state_std[4]_i_6_n_0 ),
        .O(state_std[4]));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \state_std[4]_i_3 
       (.I0(\state_std[4]_i_7_n_0 ),
        .I1(\state_std_reg[0] ),
        .I2(\mouse_data_int_reg[7] [2]),
        .I3(\state_std_reg[2] ),
        .I4(\state_std_reg[4] ),
        .I5(\state_std[4]_i_8_n_0 ),
        .O(\state_std[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \state_std[4]_i_4 
       (.I0(\state_std[4]_i_9_n_0 ),
        .I1(\mouse_data_int_reg[7] [4]),
        .I2(\mouse_data_int_reg[7] [6]),
        .I3(\state_std_reg[0] ),
        .I4(ps2_code_new_prev),
        .I5(ps2_code_new),
        .O(\state_std[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \state_std[4]_i_6 
       (.I0(\state_std[4]_i_9_n_0 ),
        .I1(\mouse_data_int_reg[7] [4]),
        .I2(\mouse_data_int_reg[7] [6]),
        .I3(\state_std_reg[2]_0 ),
        .I4(\state_std_reg[0]_3 ),
        .I5(\state_std[4]_i_11_n_0 ),
        .O(\state_std[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \state_std[4]_i_7 
       (.I0(\mouse_data_int_reg[7] [0]),
        .I1(\mouse_data_int_reg[7] [1]),
        .O(\state_std[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \state_std[4]_i_8 
       (.I0(\mouse_data_int_reg[7] [7]),
        .I1(\mouse_data_int_reg[7] [4]),
        .I2(\mouse_data_int_reg[7] [6]),
        .I3(\mouse_data_int_reg[7] [5]),
        .I4(\mouse_data_int_reg[7] [3]),
        .O(\state_std[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \state_std[4]_i_9 
       (.I0(\mouse_data_int_reg[7] [1]),
        .I1(\mouse_data_int_reg[7] [3]),
        .I2(\mouse_data_int_reg[7] [5]),
        .I3(\mouse_data_int_reg[7] [7]),
        .I4(\mouse_data_int_reg[7] [2]),
        .I5(\mouse_data_int_reg[7] [0]),
        .O(\state_std[4]_i_9_n_0 ));
  FDRE \sync_ffs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(ps2_dat_I[0]),
        .Q(sync_ffs[0]),
        .R(1'b0));
  FDRE \sync_ffs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(ps2_dat_I[1]),
        .Q(sync_ffs[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \timer[0]_i_1 
       (.I0(\timer_reg_n_0_[0] ),
        .O(\timer[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \timer[12]_i_11 
       (.I0(\timer_reg_n_0_[9] ),
        .I1(\timer_reg_n_0_[10] ),
        .I2(\timer_reg_n_0_[12] ),
        .I3(state[1]),
        .I4(reset_n),
        .O(\timer[12]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \timer[12]_i_12 
       (.I0(reset_n),
        .I1(state[1]),
        .O(\timer[12]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \timer[12]_i_13 
       (.I0(\timer_reg_n_0_[12] ),
        .I1(\timer_reg_n_0_[10] ),
        .I2(\timer_reg_n_0_[8] ),
        .O(\timer[12]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \timer[12]_i_14 
       (.I0(\timer_reg_n_0_[11] ),
        .I1(\timer_reg_n_0_[10] ),
        .I2(\timer_reg_n_0_[4] ),
        .I3(\timer_reg_n_0_[5] ),
        .I4(\timer_reg_n_0_[3] ),
        .I5(\timer_reg_n_0_[6] ),
        .O(\timer[12]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000007FFFFFFFFF)) 
    \timer[12]_i_15 
       (.I0(\timer_reg_n_0_[9] ),
        .I1(\timer_reg_n_0_[7] ),
        .I2(\timer_reg_n_0_[8] ),
        .I3(\timer_reg_n_0_[10] ),
        .I4(\timer_reg_n_0_[11] ),
        .I5(\timer_reg_n_0_[12] ),
        .O(\timer[12]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \timer[12]_i_16 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(reset_n),
        .O(\timer[12]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \timer[12]_i_18 
       (.I0(\timer_reg_n_0_[12] ),
        .I1(\timer_reg_n_0_[11] ),
        .I2(state[1]),
        .I3(reset_n),
        .O(\timer[12]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \timer[12]_i_19 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\timer[12]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \timer[12]_i_4 
       (.I0(state[0]),
        .I1(reset_n),
        .I2(tx_ena),
        .I3(state[1]),
        .O(\timer[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \timer[12]_i_5 
       (.I0(\timer_reg_n_0_[0] ),
        .I1(reset_n),
        .I2(state[1]),
        .I3(\ps2_code[7]_i_6_n_0 ),
        .O(\timer[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \timer[12]_i_6 
       (.I0(\timer_reg_n_0_[3] ),
        .I1(\timer[12]_i_12_n_0 ),
        .I2(\timer_reg_n_0_[5] ),
        .I3(\timer_reg_n_0_[12] ),
        .I4(\timer_reg_n_0_[10] ),
        .I5(\timer_reg_n_0_[8] ),
        .O(\timer[12]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0004444444444444)) 
    \timer[12]_i_7 
       (.I0(\timer[12]_i_13_n_0 ),
        .I1(\timer[12]_i_12_n_0 ),
        .I2(\timer_reg_n_0_[4] ),
        .I3(\timer_reg_n_0_[5] ),
        .I4(\timer_reg_n_0_[6] ),
        .I5(\timer_reg_n_0_[7] ),
        .O(\timer[12]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[0] 
       (.C(clk),
        .CE(timer0),
        .D(\timer[0]_i_1_n_0 ),
        .Q(\timer_reg_n_0_[0] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[10] 
       (.C(clk),
        .CE(timer0),
        .D(in22[10]),
        .Q(\timer_reg_n_0_[10] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[11] 
       (.C(clk),
        .CE(timer0),
        .D(in22[11]),
        .Q(\timer_reg_n_0_[11] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[12] 
       (.C(clk),
        .CE(timer0),
        .D(in22[12]),
        .Q(\timer_reg_n_0_[12] ),
        .R(debounce_ps2_clk_n_1));
  CARRY4 \timer_reg[12]_i_3 
       (.CI(\timer_reg[8]_i_1_n_0 ),
        .CO({\NLW_timer_reg[12]_i_3_CO_UNCONNECTED [3],\timer_reg[12]_i_3_n_1 ,\timer_reg[12]_i_3_n_2 ,\timer_reg[12]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in22[12:9]),
        .S({\timer_reg_n_0_[12] ,\timer_reg_n_0_[11] ,\timer_reg_n_0_[10] ,\timer_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[1] 
       (.C(clk),
        .CE(timer0),
        .D(in22[1]),
        .Q(\timer_reg_n_0_[1] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[2] 
       (.C(clk),
        .CE(timer0),
        .D(in22[2]),
        .Q(\timer_reg_n_0_[2] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[3] 
       (.C(clk),
        .CE(timer0),
        .D(in22[3]),
        .Q(\timer_reg_n_0_[3] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[4] 
       (.C(clk),
        .CE(timer0),
        .D(in22[4]),
        .Q(\timer_reg_n_0_[4] ),
        .R(debounce_ps2_clk_n_1));
  CARRY4 \timer_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\timer_reg[4]_i_1_n_0 ,\timer_reg[4]_i_1_n_1 ,\timer_reg[4]_i_1_n_2 ,\timer_reg[4]_i_1_n_3 }),
        .CYINIT(\timer_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in22[4:1]),
        .S({\timer_reg_n_0_[4] ,\timer_reg_n_0_[3] ,\timer_reg_n_0_[2] ,\timer_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[5] 
       (.C(clk),
        .CE(timer0),
        .D(in22[5]),
        .Q(\timer_reg_n_0_[5] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[6] 
       (.C(clk),
        .CE(timer0),
        .D(in22[6]),
        .Q(\timer_reg_n_0_[6] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[7] 
       (.C(clk),
        .CE(timer0),
        .D(in22[7]),
        .Q(\timer_reg_n_0_[7] ),
        .R(debounce_ps2_clk_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[8] 
       (.C(clk),
        .CE(timer0),
        .D(in22[8]),
        .Q(\timer_reg_n_0_[8] ),
        .R(debounce_ps2_clk_n_1));
  CARRY4 \timer_reg[8]_i_1 
       (.CI(\timer_reg[4]_i_1_n_0 ),
        .CO({\timer_reg[8]_i_1_n_0 ,\timer_reg[8]_i_1_n_1 ,\timer_reg[8]_i_1_n_2 ,\timer_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in22[8:5]),
        .S({\timer_reg_n_0_[8] ,\timer_reg_n_0_[7] ,\timer_reg_n_0_[6] ,\timer_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_reg[9] 
       (.C(clk),
        .CE(timer0),
        .D(in22[9]),
        .Q(\timer_reg_n_0_[9] ),
        .R(debounce_ps2_clk_n_1));
  LUT4 #(
    .INIT(16'hFE02)) 
    tx_busy_i_1
       (.I0(tx_ena),
        .I1(state[0]),
        .I2(state[1]),
        .I3(tx_busy),
        .O(tx_busy_i_1_n_0));
  FDCE tx_busy_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(ps2_dat_T_reg_0),
        .D(tx_busy_i_1_n_0),
        .Q(tx_busy));
  LUT6 #(
    .INIT(64'h00E0002000200020)) 
    \tx_cmd[8]_i_1 
       (.I0(\state_std_reg[4]_2 ),
        .I1(\state_std_reg[0] ),
        .I2(reset_n),
        .I3(tx_busy),
        .I4(\state_std_reg[4] ),
        .I5(\state_std_reg[1] ),
        .O(E));
  LUT4 #(
    .INIT(16'h7F40)) 
    tx_ena_i_1
       (.I0(tx_busy),
        .I1(reset_n),
        .I2(\state_std_reg[0]_4 ),
        .I3(tx_ena),
        .O(tx_ena_reg));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
