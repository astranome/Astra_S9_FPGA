// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Oct  4 03:44:23 2023
// Host        : UUBP-THINK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gener4_rgb2dvi_0_0_sim_netlist.v
// Design      : gener4_rgb2dvi_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockGen
   (SerialClk,
    PixelClk,
    in0,
    PixelClk_0,
    aRst_n);
  output SerialClk;
  output PixelClk;
  output in0;
  input PixelClk_0;
  input aRst_n;

  wire CLKFBIN;
  wire PixelClk;
  wire PixelClk_0;
  wire RST;
  wire SerialClk;
  wire aPixelClkLckd;
  wire aRst_n;
  wire in0;
  wire oOut;
  wire pLockWasLost0_n_0;
  wire \pLocked_q_reg_n_0_[0] ;
  wire \pLocked_q_reg_n_0_[1] ;
  wire pRst;
  wire p_1_in;
  wire \NLW_GenPLL.DVI_ClkGenerator_CLKOUT2_UNCONNECTED ;
  wire \NLW_GenPLL.DVI_ClkGenerator_CLKOUT3_UNCONNECTED ;
  wire \NLW_GenPLL.DVI_ClkGenerator_CLKOUT4_UNCONNECTED ;
  wire \NLW_GenPLL.DVI_ClkGenerator_CLKOUT5_UNCONNECTED ;
  wire \NLW_GenPLL.DVI_ClkGenerator_DRDY_UNCONNECTED ;
  wire [15:0]\NLW_GenPLL.DVI_ClkGenerator_DO_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  PLLE2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT(20),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(18.750000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE(4),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(20),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.000000),
    .STARTUP_WAIT("FALSE")) 
    \GenPLL.DVI_ClkGenerator 
       (.CLKFBIN(CLKFBIN),
        .CLKFBOUT(CLKFBIN),
        .CLKIN1(PixelClk_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKOUT0(SerialClk),
        .CLKOUT1(PixelClk),
        .CLKOUT2(\NLW_GenPLL.DVI_ClkGenerator_CLKOUT2_UNCONNECTED ),
        .CLKOUT3(\NLW_GenPLL.DVI_ClkGenerator_CLKOUT3_UNCONNECTED ),
        .CLKOUT4(\NLW_GenPLL.DVI_ClkGenerator_CLKOUT4_UNCONNECTED ),
        .CLKOUT5(\NLW_GenPLL.DVI_ClkGenerator_CLKOUT5_UNCONNECTED ),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(\NLW_GenPLL.DVI_ClkGenerator_DO_UNCONNECTED [15:0]),
        .DRDY(\NLW_GenPLL.DVI_ClkGenerator_DRDY_UNCONNECTED ),
        .DWE(1'b0),
        .LOCKED(aPixelClkLckd),
        .PWRDWN(1'b0),
        .RST(RST));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ResetBridge_5 LockLostReset
       (.AR(pRst),
        .PixelClk(PixelClk_0),
        .aRst_n(aRst_n));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncAsync__parameterized1 PLL_LockSyncAsync
       (.D(oOut),
        .PixelClk(PixelClk_0),
        .pLockWasLost_reg(aPixelClkLckd));
  LUT1 #(
    .INIT(2'h1)) 
    aRst_int_inferred_i_1__0
       (.I0(aPixelClkLckd),
        .O(in0));
  LUT3 #(
    .INIT(8'h70)) 
    pLockWasLost0
       (.I0(\pLocked_q_reg_n_0_[1] ),
        .I1(\pLocked_q_reg_n_0_[0] ),
        .I2(p_1_in),
        .O(pLockWasLost0_n_0));
  FDPE pLockWasLost_reg
       (.C(PixelClk_0),
        .CE(1'b1),
        .D(pLockWasLost0_n_0),
        .PRE(pRst),
        .Q(RST));
  FDCE #(
    .INIT(1'b1)) 
    \pLocked_q_reg[0] 
       (.C(PixelClk_0),
        .CE(1'b1),
        .CLR(pRst),
        .D(oOut),
        .Q(\pLocked_q_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b1)) 
    \pLocked_q_reg[1] 
       (.C(PixelClk_0),
        .CE(1'b1),
        .CLR(pRst),
        .D(\pLocked_q_reg_n_0_[0] ),
        .Q(\pLocked_q_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b1)) 
    \pLocked_q_reg[2] 
       (.C(PixelClk_0),
        .CE(1'b1),
        .CLR(pRst),
        .D(\pLocked_q_reg_n_0_[1] ),
        .Q(p_1_in));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES
   (TMDS_Clk_p,
    TMDS_Clk_n,
    SerialClk,
    PixelClk,
    aRst);
  output TMDS_Clk_p;
  output TMDS_Clk_n;
  input SerialClk;
  input PixelClk;
  input aRst;

  wire I;
  wire PixelClk;
  wire SHIFTIN1;
  wire SHIFTIN2;
  wire SerialClk;
  wire TMDS_Clk_n;
  wire TMDS_Clk_p;
  wire aRst;
  wire NLW_SerializerMaster_OFB_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED;
  wire NLW_SerializerMaster_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerMaster_TFB_UNCONNECTED;
  wire NLW_SerializerMaster_TQ_UNCONNECTED;
  wire NLW_SerializerSlave_OFB_UNCONNECTED;
  wire NLW_SerializerSlave_OQ_UNCONNECTED;
  wire NLW_SerializerSlave_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerSlave_TFB_UNCONNECTED;
  wire NLW_SerializerSlave_TQ_UNCONNECTED;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS OutputBuffer
       (.I(I),
        .O(TMDS_Clk_p),
        .OB(TMDS_Clk_n));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerMaster
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(1'b1),
        .D2(1'b1),
        .D3(1'b1),
        .D4(1'b1),
        .D5(1'b1),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_SerializerMaster_OFB_UNCONNECTED),
        .OQ(I),
        .RST(aRst),
        .SHIFTIN1(SHIFTIN1),
        .SHIFTIN2(SHIFTIN2),
        .SHIFTOUT1(NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerMaster_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerMaster_TFB_UNCONNECTED),
        .TQ(NLW_SerializerMaster_TQ_UNCONNECTED));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerSlave
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(1'b0),
        .D4(1'b0),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_SerializerSlave_OFB_UNCONNECTED),
        .OQ(NLW_SerializerSlave_OQ_UNCONNECTED),
        .RST(aRst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(SHIFTIN1),
        .SHIFTOUT2(SHIFTIN2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerSlave_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerSlave_TFB_UNCONNECTED),
        .TQ(NLW_SerializerSlave_TQ_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "OutputSERDES" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES_0
   (TMDS_Data_p,
    TMDS_Data_n,
    SerialClk,
    PixelClk,
    pDataOut,
    aRst);
  output [0:0]TMDS_Data_p;
  output [0:0]TMDS_Data_n;
  input SerialClk;
  input PixelClk;
  input [9:0]pDataOut;
  input aRst;

  wire I;
  wire PixelClk;
  wire SHIFTIN1;
  wire SHIFTIN2;
  wire SerialClk;
  wire [0:0]TMDS_Data_n;
  wire [0:0]TMDS_Data_p;
  wire aRst;
  wire [9:0]pDataOut;
  wire NLW_SerializerMaster_OFB_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED;
  wire NLW_SerializerMaster_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerMaster_TFB_UNCONNECTED;
  wire NLW_SerializerMaster_TQ_UNCONNECTED;
  wire NLW_SerializerSlave_OFB_UNCONNECTED;
  wire NLW_SerializerSlave_OQ_UNCONNECTED;
  wire NLW_SerializerSlave_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerSlave_TFB_UNCONNECTED;
  wire NLW_SerializerSlave_TQ_UNCONNECTED;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS OutputBuffer
       (.I(I),
        .O(TMDS_Data_p),
        .OB(TMDS_Data_n));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b1),
    .IS_D2_INVERTED(1'b1),
    .IS_D3_INVERTED(1'b1),
    .IS_D4_INVERTED(1'b1),
    .IS_D5_INVERTED(1'b1),
    .IS_D6_INVERTED(1'b1),
    .IS_D7_INVERTED(1'b1),
    .IS_D8_INVERTED(1'b1),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerMaster
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(pDataOut[0]),
        .D2(pDataOut[1]),
        .D3(pDataOut[2]),
        .D4(pDataOut[3]),
        .D5(pDataOut[4]),
        .D6(pDataOut[5]),
        .D7(pDataOut[6]),
        .D8(pDataOut[7]),
        .OCE(1'b1),
        .OFB(NLW_SerializerMaster_OFB_UNCONNECTED),
        .OQ(I),
        .RST(aRst),
        .SHIFTIN1(SHIFTIN1),
        .SHIFTIN2(SHIFTIN2),
        .SHIFTOUT1(NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerMaster_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerMaster_TFB_UNCONNECTED),
        .TQ(NLW_SerializerMaster_TQ_UNCONNECTED));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b1),
    .IS_D4_INVERTED(1'b1),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerSlave
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(pDataOut[8]),
        .D4(pDataOut[9]),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_SerializerSlave_OFB_UNCONNECTED),
        .OQ(NLW_SerializerSlave_OQ_UNCONNECTED),
        .RST(aRst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(SHIFTIN1),
        .SHIFTOUT2(SHIFTIN2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerSlave_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerSlave_TFB_UNCONNECTED),
        .TQ(NLW_SerializerSlave_TQ_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "OutputSERDES" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES_2
   (TMDS_Data_p,
    TMDS_Data_n,
    SerialClk,
    PixelClk,
    pDataOut,
    out);
  output [0:0]TMDS_Data_p;
  output [0:0]TMDS_Data_n;
  input SerialClk;
  input PixelClk;
  input [9:0]pDataOut;
  input [0:0]out;

  wire I;
  wire PixelClk;
  wire SHIFTIN1;
  wire SHIFTIN2;
  wire SerialClk;
  wire [0:0]TMDS_Data_n;
  wire [0:0]TMDS_Data_p;
  wire [0:0]out;
  wire [9:0]pDataOut;
  wire NLW_SerializerMaster_OFB_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED;
  wire NLW_SerializerMaster_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerMaster_TFB_UNCONNECTED;
  wire NLW_SerializerMaster_TQ_UNCONNECTED;
  wire NLW_SerializerSlave_OFB_UNCONNECTED;
  wire NLW_SerializerSlave_OQ_UNCONNECTED;
  wire NLW_SerializerSlave_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerSlave_TFB_UNCONNECTED;
  wire NLW_SerializerSlave_TQ_UNCONNECTED;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS OutputBuffer
       (.I(I),
        .O(TMDS_Data_p),
        .OB(TMDS_Data_n));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerMaster
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(pDataOut[0]),
        .D2(pDataOut[1]),
        .D3(pDataOut[2]),
        .D4(pDataOut[3]),
        .D5(pDataOut[4]),
        .D6(pDataOut[5]),
        .D7(pDataOut[6]),
        .D8(pDataOut[7]),
        .OCE(1'b1),
        .OFB(NLW_SerializerMaster_OFB_UNCONNECTED),
        .OQ(I),
        .RST(out),
        .SHIFTIN1(SHIFTIN1),
        .SHIFTIN2(SHIFTIN2),
        .SHIFTOUT1(NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerMaster_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerMaster_TFB_UNCONNECTED),
        .TQ(NLW_SerializerMaster_TQ_UNCONNECTED));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b0),
    .IS_D4_INVERTED(1'b0),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerSlave
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(pDataOut[8]),
        .D4(pDataOut[9]),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_SerializerSlave_OFB_UNCONNECTED),
        .OQ(NLW_SerializerSlave_OQ_UNCONNECTED),
        .RST(out),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(SHIFTIN1),
        .SHIFTOUT2(SHIFTIN2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerSlave_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerSlave_TFB_UNCONNECTED),
        .TQ(NLW_SerializerSlave_TQ_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "OutputSERDES" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES_4
   (TMDS_Data_p,
    TMDS_Data_n,
    SerialClk,
    PixelClk,
    pDataOut,
    out);
  output [0:0]TMDS_Data_p;
  output [0:0]TMDS_Data_n;
  input SerialClk;
  input PixelClk;
  input [9:0]pDataOut;
  input [0:0]out;

  wire I;
  wire PixelClk;
  wire SHIFTIN1;
  wire SHIFTIN2;
  wire SerialClk;
  wire [0:0]TMDS_Data_n;
  wire [0:0]TMDS_Data_p;
  wire [0:0]out;
  wire [9:0]pDataOut;
  wire NLW_SerializerMaster_OFB_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED;
  wire NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED;
  wire NLW_SerializerMaster_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerMaster_TFB_UNCONNECTED;
  wire NLW_SerializerMaster_TQ_UNCONNECTED;
  wire NLW_SerializerSlave_OFB_UNCONNECTED;
  wire NLW_SerializerSlave_OQ_UNCONNECTED;
  wire NLW_SerializerSlave_TBYTEOUT_UNCONNECTED;
  wire NLW_SerializerSlave_TFB_UNCONNECTED;
  wire NLW_SerializerSlave_TQ_UNCONNECTED;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS OutputBuffer
       (.I(I),
        .O(TMDS_Data_p),
        .OB(TMDS_Data_n));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b1),
    .IS_D2_INVERTED(1'b1),
    .IS_D3_INVERTED(1'b1),
    .IS_D4_INVERTED(1'b1),
    .IS_D5_INVERTED(1'b1),
    .IS_D6_INVERTED(1'b1),
    .IS_D7_INVERTED(1'b1),
    .IS_D8_INVERTED(1'b1),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("MASTER"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerMaster
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(pDataOut[0]),
        .D2(pDataOut[1]),
        .D3(pDataOut[2]),
        .D4(pDataOut[3]),
        .D5(pDataOut[4]),
        .D6(pDataOut[5]),
        .D7(pDataOut[6]),
        .D8(pDataOut[7]),
        .OCE(1'b1),
        .OFB(NLW_SerializerMaster_OFB_UNCONNECTED),
        .OQ(I),
        .RST(out),
        .SHIFTIN1(SHIFTIN1),
        .SHIFTIN2(SHIFTIN2),
        .SHIFTOUT1(NLW_SerializerMaster_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_SerializerMaster_SHIFTOUT2_UNCONNECTED),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerMaster_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerMaster_TFB_UNCONNECTED),
        .TQ(NLW_SerializerMaster_TQ_UNCONNECTED));
  (* box_type = "PRIMITIVE" *) 
  OSERDESE2 #(
    .DATA_RATE_OQ("DDR"),
    .DATA_RATE_TQ("SDR"),
    .DATA_WIDTH(10),
    .INIT_OQ(1'b0),
    .INIT_TQ(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .IS_D3_INVERTED(1'b1),
    .IS_D4_INVERTED(1'b1),
    .IS_D5_INVERTED(1'b0),
    .IS_D6_INVERTED(1'b0),
    .IS_D7_INVERTED(1'b0),
    .IS_D8_INVERTED(1'b0),
    .IS_T1_INVERTED(1'b0),
    .IS_T2_INVERTED(1'b0),
    .IS_T3_INVERTED(1'b0),
    .IS_T4_INVERTED(1'b0),
    .SERDES_MODE("SLAVE"),
    .SRVAL_OQ(1'b0),
    .SRVAL_TQ(1'b0),
    .TBYTE_CTL("FALSE"),
    .TBYTE_SRC("FALSE"),
    .TRISTATE_WIDTH(1)) 
    SerializerSlave
       (.CLK(SerialClk),
        .CLKDIV(PixelClk),
        .D1(1'b0),
        .D2(1'b0),
        .D3(pDataOut[8]),
        .D4(pDataOut[9]),
        .D5(1'b0),
        .D6(1'b0),
        .D7(1'b0),
        .D8(1'b0),
        .OCE(1'b1),
        .OFB(NLW_SerializerSlave_OFB_UNCONNECTED),
        .OQ(NLW_SerializerSlave_OQ_UNCONNECTED),
        .RST(out),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(SHIFTIN1),
        .SHIFTOUT2(SHIFTIN2),
        .T1(1'b0),
        .T2(1'b0),
        .T3(1'b0),
        .T4(1'b0),
        .TBYTEIN(1'b0),
        .TBYTEOUT(NLW_SerializerSlave_TBYTEOUT_UNCONNECTED),
        .TCE(1'b0),
        .TFB(NLW_SerializerSlave_TFB_UNCONNECTED),
        .TQ(NLW_SerializerSlave_TQ_UNCONNECTED));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ResetBridge
   (out,
    in0,
    PixelClk);
  output [0:0]out;
  input in0;
  input PixelClk;

  wire PixelClk;
  (* RTL_KEEP = "true" *) wire aRst_int;
  wire [0:0]out;

  assign aRst_int = in0;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncAsync SyncAsyncx
       (.AS(aRst_int),
        .PixelClk(PixelClk),
        .out(out));
endmodule

(* ORIG_REF_NAME = "ResetBridge" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ResetBridge_5
   (AR,
    aRst_n,
    PixelClk);
  output [0:0]AR;
  input aRst_n;
  input PixelClk;

  wire [0:0]AR;
  wire PixelClk;
  (* RTL_KEEP = "true" *) wire aRst_int_0;
  wire aRst_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncAsync_6 SyncAsyncx
       (.AR(AR),
        .AS(aRst_int_0),
        .PixelClk(PixelClk));
  LUT1 #(
    .INIT(2'h1)) 
    aRst_int_inferred_i_1
       (.I0(aRst_n),
        .O(aRst_int_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncAsync
   (out,
    PixelClk,
    AS);
  output [0:0]out;
  input PixelClk;
  input [0:0]AS;

  wire [0:0]AS;
  wire PixelClk;
  (* async_reg = "true" *) wire [1:0]oSyncStages;

  assign out[0] = oSyncStages[1];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \oSyncStages_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(AS),
        .Q(oSyncStages[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \oSyncStages_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(oSyncStages[0]),
        .PRE(AS),
        .Q(oSyncStages[1]));
endmodule

(* ORIG_REF_NAME = "SyncAsync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncAsync_6
   (AR,
    PixelClk,
    AS);
  output [0:0]AR;
  input PixelClk;
  input [0:0]AS;

  wire [0:0]AS;
  wire PixelClk;
  (* async_reg = "true" *) wire [1:0]oSyncStages;

  assign AR[0] = oSyncStages[1];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \oSyncStages_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(AS),
        .Q(oSyncStages[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \oSyncStages_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(oSyncStages[0]),
        .PRE(AS),
        .Q(oSyncStages[1]));
endmodule

(* ORIG_REF_NAME = "SyncAsync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncAsync__parameterized1
   (D,
    PixelClk,
    pLockWasLost_reg);
  output [0:0]D;
  input PixelClk;
  input [0:0]pLockWasLost_reg;

  wire PixelClk;
  (* async_reg = "true" *) wire [1:0]oSyncStages;
  wire [0:0]pLockWasLost_reg;

  assign D[0] = oSyncStages[1];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \oSyncStages_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(pLockWasLost_reg),
        .Q(oSyncStages[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \oSyncStages_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(oSyncStages[0]),
        .Q(oSyncStages[1]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_TMDS_Encoder
   (SR,
    pDataOut,
    vid_pHSync,
    PixelClk,
    vid_pVSync,
    vid_pVDE,
    vid_pData);
  output [0:0]SR;
  output [9:0]pDataOut;
  input vid_pHSync;
  input PixelClk;
  input vid_pVSync;
  input vid_pVDE;
  input [7:0]vid_pData;

  wire \DataEncoders[2].DataEncoder/pVde_2 ;
  wire PixelClk;
  wire [0:0]SR;
  wire [4:1]cnt_t_2;
  wire [4:1]cnt_t_3;
  wire \cnt_t_3[2]_i_2_n_0 ;
  wire \cnt_t_3[2]_i_3_n_0 ;
  wire \cnt_t_3[2]_i_4_n_0 ;
  wire \cnt_t_3[3]_i_2_n_0 ;
  wire \cnt_t_3[3]_i_3_n_0 ;
  wire \cnt_t_3[3]_i_4_n_0 ;
  wire \cnt_t_3[3]_i_5_n_0 ;
  wire \cnt_t_3[4]_i_10_n_0 ;
  wire \cnt_t_3[4]_i_11_n_0 ;
  wire \cnt_t_3[4]_i_12_n_0 ;
  wire \cnt_t_3[4]_i_13_n_0 ;
  wire \cnt_t_3[4]_i_14_n_0 ;
  wire \cnt_t_3[4]_i_15_n_0 ;
  wire \cnt_t_3[4]_i_3_n_0 ;
  wire \cnt_t_3[4]_i_4_n_0 ;
  wire \cnt_t_3[4]_i_5_n_0 ;
  wire \cnt_t_3[4]_i_6__0_n_0 ;
  wire \cnt_t_3[4]_i_7_n_0 ;
  wire \cnt_t_3[4]_i_8__0_n_0 ;
  wire \cnt_t_3[4]_i_9__0_n_0 ;
  wire [3:1]minusOp;
  wire [3:1]n0q_m_2;
  wire \n0q_m_2[2]_i_1__0_n_0 ;
  wire \n1d_1[0]_i_2_n_0 ;
  wire \n1d_1[1]_i_2_n_0 ;
  wire \n1d_1[2]_i_2_n_0 ;
  wire \n1d_1[3]_i_2_n_0 ;
  wire \n1d_1[3]_i_3_n_0 ;
  wire \n1d_1[3]_i_4_n_0 ;
  wire \n1d_1_reg_n_0_[0] ;
  wire \n1d_1_reg_n_0_[1] ;
  wire \n1d_1_reg_n_0_[2] ;
  wire \n1d_1_reg_n_0_[3] ;
  wire [3:1]n1q_m_1;
  wire \n1q_m_2[0]_i_1__0_n_0 ;
  wire \n1q_m_2[3]_i_2_n_0 ;
  wire \n1q_m_2[3]_i_3_n_0 ;
  wire \n1q_m_2[3]_i_4__0_n_0 ;
  wire \n1q_m_2[3]_i_5_n_0 ;
  wire \n1q_m_2[3]_i_6__0_n_0 ;
  wire \n1q_m_2_reg_n_0_[0] ;
  wire \n1q_m_2_reg_n_0_[1] ;
  wire \n1q_m_2_reg_n_0_[2] ;
  wire \n1q_m_2_reg_n_0_[3] ;
  wire pC0_1;
  wire pC0_2;
  wire pC1_1;
  wire pC1_2;
  wire [9:0]pDataOutRaw;
  wire \pDataOutRaw[0]_i_1__1_n_0 ;
  wire \pDataOutRaw[1]_i_1__1_n_0 ;
  wire \pDataOutRaw[3]_i_1__1_n_0 ;
  wire \pDataOutRaw[5]_i_1__1_n_0 ;
  wire \pDataOutRaw[7]_i_1__1_n_0 ;
  wire \pDataOutRaw[9]_i_1_n_0 ;
  wire \pDataOut_1_reg_n_0_[0] ;
  wire \pDataOut_1_reg_n_0_[1] ;
  wire pVde_1;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in10_in;
  wire p_0_in2_in;
  wire p_0_in4_in;
  wire p_0_in6_in;
  wire p_0_in6_in_1;
  wire p_0_in7_in;
  wire p_0_in8_in;
  wire p_0_in8_in_0;
  wire p_0_in9_in;
  wire p_1_in12_in;
  wire \q_m_2[1]_i_1__0_n_0 ;
  wire \q_m_2[6]_i_1__0_n_0 ;
  wire \q_m_2[7]_i_2_n_0 ;
  wire \q_m_2[8]_i_1_n_0 ;
  wire \q_m_2_reg_n_0_[0] ;
  wire \q_m_2_reg_n_0_[1] ;
  wire \q_m_2_reg_n_0_[2] ;
  wire \q_m_2_reg_n_0_[3] ;
  wire \q_m_2_reg_n_0_[4] ;
  wire \q_m_2_reg_n_0_[5] ;
  wire \q_m_2_reg_n_0_[6] ;
  wire \q_m_2_reg_n_0_[7] ;
  wire [9:2]q_out_20_in;
  wire [3:0]sum_bits;
  wire [7:0]vid_pData;
  wire vid_pHSync;
  wire vid_pVDE;
  wire vid_pVSync;

  assign pDataOut[9:0] = pDataOutRaw;
  LUT6 #(
    .INIT(64'h9669966969969696)) 
    \cnt_t_3[1]_i_1 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(n0q_m_2[1]),
        .I2(cnt_t_3[1]),
        .I3(\cnt_t_3[4]_i_4_n_0 ),
        .I4(\cnt_t_3[2]_i_4_n_0 ),
        .I5(p_0_in),
        .O(cnt_t_2[1]));
  LUT6 #(
    .INIT(64'h95569AA6A55AAAAA)) 
    \cnt_t_3[2]_i_1 
       (.I0(\cnt_t_3[2]_i_2_n_0 ),
        .I1(\cnt_t_3[4]_i_4_n_0 ),
        .I2(p_0_in),
        .I3(cnt_t_3[1]),
        .I4(\cnt_t_3[2]_i_3_n_0 ),
        .I5(\cnt_t_3[2]_i_4_n_0 ),
        .O(cnt_t_2[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h96699696)) 
    \cnt_t_3[2]_i_2 
       (.I0(cnt_t_3[2]),
        .I1(\n1q_m_2_reg_n_0_[2] ),
        .I2(n0q_m_2[2]),
        .I3(n0q_m_2[1]),
        .I4(\n1q_m_2_reg_n_0_[1] ),
        .O(\cnt_t_3[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_t_3[2]_i_3 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(n0q_m_2[1]),
        .O(\cnt_t_3[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFD0000FFFDFFFD)) 
    \cnt_t_3[2]_i_4 
       (.I0(\n1q_m_2_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\n1q_m_2_reg_n_0_[0] ),
        .I3(\n1q_m_2_reg_n_0_[3] ),
        .I4(cnt_t_3[4]),
        .I5(\cnt_t_3[4]_i_12_n_0 ),
        .O(\cnt_t_3[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \cnt_t_3[3]_i_1 
       (.I0(\cnt_t_3[3]_i_2_n_0 ),
        .I1(\cnt_t_3[3]_i_3_n_0 ),
        .I2(\cnt_t_3[4]_i_4_n_0 ),
        .I3(\cnt_t_3[3]_i_4_n_0 ),
        .I4(\cnt_t_3[4]_i_6__0_n_0 ),
        .I5(\cnt_t_3[3]_i_5_n_0 ),
        .O(cnt_t_2[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \cnt_t_3[3]_i_2 
       (.I0(cnt_t_3[3]),
        .I1(\cnt_t_3[4]_i_9__0_n_0 ),
        .O(\cnt_t_3[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h099FFFFF0000099F)) 
    \cnt_t_3[3]_i_3 
       (.I0(n0q_m_2[1]),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(cnt_t_3[1]),
        .I3(p_0_in),
        .I4(cnt_t_3[2]),
        .I5(\cnt_t_3[4]_i_11_n_0 ),
        .O(\cnt_t_3[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEE88EE88E8888)) 
    \cnt_t_3[3]_i_4 
       (.I0(cnt_t_3[2]),
        .I1(\cnt_t_3[4]_i_11_n_0 ),
        .I2(n0q_m_2[1]),
        .I3(\n1q_m_2_reg_n_0_[1] ),
        .I4(cnt_t_3[1]),
        .I5(p_0_in),
        .O(\cnt_t_3[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h9BBF04DF04DF9BBF)) 
    \cnt_t_3[3]_i_5 
       (.I0(n0q_m_2[1]),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(cnt_t_3[1]),
        .I3(cnt_t_3[2]),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .I5(n0q_m_2[2]),
        .O(\cnt_t_3[3]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_t_3[4]_i_1 
       (.I0(\DataEncoders[2].DataEncoder/pVde_2 ),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h099F)) 
    \cnt_t_3[4]_i_10 
       (.I0(n0q_m_2[1]),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(cnt_t_3[1]),
        .I3(p_0_in),
        .O(\cnt_t_3[4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    \cnt_t_3[4]_i_11 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(n0q_m_2[1]),
        .I2(n0q_m_2[2]),
        .I3(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \cnt_t_3[4]_i_12 
       (.I0(cnt_t_3[3]),
        .I1(cnt_t_3[1]),
        .I2(cnt_t_3[2]),
        .O(\cnt_t_3[4]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h066F)) 
    \cnt_t_3[4]_i_13 
       (.I0(n0q_m_2[1]),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(cnt_t_3[1]),
        .I3(p_0_in),
        .O(\cnt_t_3[4]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \cnt_t_3[4]_i_14 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[0] ),
        .I2(\n1q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA2FB)) 
    \cnt_t_3[4]_i_15 
       (.I0(n0q_m_2[2]),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(n0q_m_2[1]),
        .I3(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h001DFF1DFFE200E2)) 
    \cnt_t_3[4]_i_2 
       (.I0(\cnt_t_3[4]_i_3_n_0 ),
        .I1(\cnt_t_3[4]_i_4_n_0 ),
        .I2(\cnt_t_3[4]_i_5_n_0 ),
        .I3(\cnt_t_3[4]_i_6__0_n_0 ),
        .I4(\cnt_t_3[4]_i_7_n_0 ),
        .I5(\cnt_t_3[4]_i_8__0_n_0 ),
        .O(cnt_t_2[4]));
  LUT5 #(
    .INIT(32'h71771171)) 
    \cnt_t_3[4]_i_3 
       (.I0(cnt_t_3[3]),
        .I1(\cnt_t_3[4]_i_9__0_n_0 ),
        .I2(\cnt_t_3[4]_i_10_n_0 ),
        .I3(cnt_t_3[2]),
        .I4(\cnt_t_3[4]_i_11_n_0 ),
        .O(\cnt_t_3[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFCABFCABFCABFCBB)) 
    \cnt_t_3[4]_i_4 
       (.I0(\cnt_t_3[4]_i_12_n_0 ),
        .I1(\n1q_m_2_reg_n_0_[3] ),
        .I2(\n1q_m_2_reg_n_0_[2] ),
        .I3(cnt_t_3[4]),
        .I4(\n1q_m_2_reg_n_0_[1] ),
        .I5(\n1q_m_2_reg_n_0_[0] ),
        .O(\cnt_t_3[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h8EFF008E)) 
    \cnt_t_3[4]_i_5 
       (.I0(cnt_t_3[2]),
        .I1(\cnt_t_3[4]_i_11_n_0 ),
        .I2(\cnt_t_3[4]_i_13_n_0 ),
        .I3(\cnt_t_3[4]_i_9__0_n_0 ),
        .I4(cnt_t_3[3]),
        .O(\cnt_t_3[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04550404)) 
    \cnt_t_3[4]_i_6__0 
       (.I0(p_0_in),
        .I1(\cnt_t_3[4]_i_12_n_0 ),
        .I2(cnt_t_3[4]),
        .I3(\cnt_t_3[4]_i_14_n_0 ),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'h00007F077F07FFFF)) 
    \cnt_t_3[4]_i_7 
       (.I0(\cnt_t_3[2]_i_3_n_0 ),
        .I1(cnt_t_3[1]),
        .I2(cnt_t_3[2]),
        .I3(\cnt_t_3[4]_i_11_n_0 ),
        .I4(cnt_t_3[3]),
        .I5(\cnt_t_3[4]_i_9__0_n_0 ),
        .O(\cnt_t_3[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h6A56)) 
    \cnt_t_3[4]_i_8__0 
       (.I0(cnt_t_3[4]),
        .I1(\cnt_t_3[4]_i_15_n_0 ),
        .I2(n0q_m_2[3]),
        .I3(\n1q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'h66A655659959AA9A)) 
    \cnt_t_3[4]_i_9__0 
       (.I0(\n1q_m_2_reg_n_0_[3] ),
        .I1(n0q_m_2[2]),
        .I2(\n1q_m_2_reg_n_0_[1] ),
        .I3(n0q_m_2[1]),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .I5(n0q_m_2[3]),
        .O(\cnt_t_3[4]_i_9__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[1]),
        .Q(cnt_t_3[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[2]),
        .Q(cnt_t_3[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[3]),
        .Q(cnt_t_3[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[4]),
        .Q(cnt_t_3[4]),
        .R(SR));
  LUT6 #(
    .INIT(64'h6696696669669969)) 
    \n0q_m_2[1]_i_1 
       (.I0(\n1q_m_2[3]_i_2_n_0 ),
        .I1(\n1q_m_2[3]_i_3_n_0 ),
        .I2(\n1q_m_2[3]_i_4__0_n_0 ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\n1q_m_2[3]_i_6__0_n_0 ),
        .I5(\n1q_m_2[3]_i_5_n_0 ),
        .O(minusOp[1]));
  LUT6 #(
    .INIT(64'hEF8EF7FF0800EF8E)) 
    \n0q_m_2[2]_i_1__0 
       (.I0(\n1q_m_2[3]_i_5_n_0 ),
        .I1(\n1q_m_2[3]_i_6__0_n_0 ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(\n1q_m_2[3]_i_4__0_n_0 ),
        .I4(\n1q_m_2[3]_i_3_n_0 ),
        .I5(\n1q_m_2[3]_i_2_n_0 ),
        .O(\n0q_m_2[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    \n0q_m_2[3]_i_1 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\n1q_m_2[3]_i_6__0_n_0 ),
        .I2(\n1q_m_2[3]_i_5_n_0 ),
        .I3(\n1q_m_2[3]_i_4__0_n_0 ),
        .I4(\n1q_m_2[3]_i_3_n_0 ),
        .I5(\n1q_m_2[3]_i_2_n_0 ),
        .O(minusOp[3]));
  FDRE \n0q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(minusOp[1]),
        .Q(n0q_m_2[1]),
        .R(1'b0));
  FDRE \n0q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[2]_i_1__0_n_0 ),
        .Q(n0q_m_2[2]),
        .R(1'b0));
  FDRE \n0q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(minusOp[3]),
        .Q(n0q_m_2[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \n1d_1[0]_i_1 
       (.I0(vid_pData[7]),
        .I1(vid_pData[0]),
        .I2(\n1d_1[0]_i_2_n_0 ),
        .I3(vid_pData[5]),
        .I4(vid_pData[6]),
        .I5(vid_pData[4]),
        .O(sum_bits[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \n1d_1[0]_i_2 
       (.I0(vid_pData[1]),
        .I1(vid_pData[3]),
        .I2(vid_pData[2]),
        .O(\n1d_1[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \n1d_1[1]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[1]_i_2_n_0 ),
        .I2(\n1d_1[3]_i_3_n_0 ),
        .O(sum_bits[1]));
  LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
    \n1d_1[1]_i_2 
       (.I0(vid_pData[4]),
        .I1(vid_pData[5]),
        .I2(vid_pData[6]),
        .I3(vid_pData[1]),
        .I4(vid_pData[2]),
        .I5(vid_pData[3]),
        .O(\n1d_1[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7E7E7EE87EE8E8E8)) 
    \n1d_1[2]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[3]_i_3_n_0 ),
        .I2(\n1d_1[2]_i_2_n_0 ),
        .I3(vid_pData[3]),
        .I4(vid_pData[2]),
        .I5(vid_pData[1]),
        .O(sum_bits[2]));
  LUT3 #(
    .INIT(8'hE8)) 
    \n1d_1[2]_i_2 
       (.I0(vid_pData[6]),
        .I1(vid_pData[5]),
        .I2(vid_pData[4]),
        .O(\n1d_1[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \n1d_1[3]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[3]_i_3_n_0 ),
        .I2(vid_pData[4]),
        .I3(vid_pData[5]),
        .I4(vid_pData[6]),
        .I5(\n1d_1[3]_i_4_n_0 ),
        .O(sum_bits[3]));
  LUT6 #(
    .INIT(64'h9600009600969600)) 
    \n1d_1[3]_i_2 
       (.I0(vid_pData[5]),
        .I1(vid_pData[6]),
        .I2(vid_pData[4]),
        .I3(vid_pData[7]),
        .I4(vid_pData[0]),
        .I5(\n1d_1[0]_i_2_n_0 ),
        .O(\n1d_1[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    \n1d_1[3]_i_3 
       (.I0(vid_pData[0]),
        .I1(vid_pData[7]),
        .I2(vid_pData[2]),
        .I3(vid_pData[3]),
        .I4(vid_pData[1]),
        .O(\n1d_1[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \n1d_1[3]_i_4 
       (.I0(vid_pData[3]),
        .I1(vid_pData[2]),
        .I2(vid_pData[1]),
        .O(\n1d_1[3]_i_4_n_0 ));
  FDRE \n1d_1_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(sum_bits[0]),
        .Q(\n1d_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \n1d_1_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(sum_bits[1]),
        .Q(\n1d_1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n1d_1_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(sum_bits[2]),
        .Q(\n1d_1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n1d_1_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(sum_bits[3]),
        .Q(\n1d_1_reg_n_0_[3] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \n1q_m_2[0]_i_1__0 
       (.I0(\n1q_m_2[3]_i_5_n_0 ),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(p_0_in2_in),
        .I3(\n1q_m_2[3]_i_4__0_n_0 ),
        .O(\n1q_m_2[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h96C33C963C96693C)) 
    \n1q_m_2[1]_i_1 
       (.I0(\n1q_m_2[3]_i_4__0_n_0 ),
        .I1(\n1q_m_2[3]_i_3_n_0 ),
        .I2(\n1q_m_2[3]_i_2_n_0 ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\n1q_m_2[3]_i_5_n_0 ),
        .I5(\n1q_m_2[3]_i_6__0_n_0 ),
        .O(n1q_m_1[1]));
  LUT6 #(
    .INIT(64'h2BBFFFFD00022BBF)) 
    \n1q_m_2[2]_i_1 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\n1q_m_2[3]_i_5_n_0 ),
        .I2(\n1q_m_2[3]_i_6__0_n_0 ),
        .I3(\n1q_m_2[3]_i_4__0_n_0 ),
        .I4(\n1q_m_2[3]_i_2_n_0 ),
        .I5(\n1q_m_2[3]_i_3_n_0 ),
        .O(n1q_m_1[2]));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    \n1q_m_2[3]_i_1 
       (.I0(\n1q_m_2[3]_i_2_n_0 ),
        .I1(\n1q_m_2[3]_i_3_n_0 ),
        .I2(\n1q_m_2[3]_i_4__0_n_0 ),
        .I3(\n1q_m_2[3]_i_5_n_0 ),
        .I4(\n1q_m_2[3]_i_6__0_n_0 ),
        .I5(\pDataOut_1_reg_n_0_[0] ),
        .O(n1q_m_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h96C33C96)) 
    \n1q_m_2[3]_i_2 
       (.I0(p_0_in2_in),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(p_0_in0_in),
        .I4(\q_m_2[8]_i_1_n_0 ),
        .O(\n1q_m_2[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h3693)) 
    \n1q_m_2[3]_i_3 
       (.I0(p_0_in6_in_1),
        .I1(\q_m_2[7]_i_2_n_0 ),
        .I2(\q_m_2[8]_i_1_n_0 ),
        .I3(p_0_in8_in_0),
        .O(\n1q_m_2[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \n1q_m_2[3]_i_4__0 
       (.I0(\q_m_2[7]_i_2_n_0 ),
        .I1(\q_m_2[8]_i_1_n_0 ),
        .I2(p_0_in8_in_0),
        .O(\n1q_m_2[3]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \n1q_m_2[3]_i_5 
       (.I0(p_0_in6_in_1),
        .I1(\q_m_2[7]_i_2_n_0 ),
        .I2(\q_m_2[8]_i_1_n_0 ),
        .I3(p_0_in10_in),
        .I4(p_0_in8_in_0),
        .O(\n1q_m_2[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \n1q_m_2[3]_i_6__0 
       (.I0(p_0_in2_in),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .O(\n1q_m_2[3]_i_6__0_n_0 ));
  FDRE \n1q_m_2_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[0]_i_1__0_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(n1q_m_1[1]),
        .Q(\n1q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(n1q_m_1[2]),
        .Q(\n1q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(n1q_m_1[3]),
        .Q(\n1q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE pC0_1_reg
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pHSync),
        .Q(pC0_1),
        .R(1'b0));
  FDRE pC0_2_reg
       (.C(PixelClk),
        .CE(1'b1),
        .D(pC0_1),
        .Q(pC0_2),
        .R(1'b0));
  FDRE pC1_1_reg
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pVSync),
        .Q(pC1_1),
        .R(1'b0));
  FDRE pC1_2_reg
       (.C(PixelClk),
        .CE(1'b1),
        .D(pC1_1),
        .Q(pC1_2),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0DFDFD0D0D0DFDFD)) 
    \pDataOutRaw[0]_i_1__1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(\cnt_t_3[4]_i_6__0_n_0 ),
        .I4(\q_m_2_reg_n_0_[0] ),
        .I5(\cnt_t_3[4]_i_4_n_0 ),
        .O(\pDataOutRaw[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0DFDFD0D0D0DFDFD)) 
    \pDataOutRaw[1]_i_1__1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(\cnt_t_3[4]_i_6__0_n_0 ),
        .I4(\q_m_2_reg_n_0_[1] ),
        .I5(\cnt_t_3[4]_i_4_n_0 ),
        .O(\pDataOutRaw[1]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0FF000FF22222222)) 
    \pDataOutRaw[2]_i_1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\cnt_t_3[4]_i_6__0_n_0 ),
        .I3(\q_m_2_reg_n_0_[2] ),
        .I4(\cnt_t_3[4]_i_4_n_0 ),
        .I5(\DataEncoders[2].DataEncoder/pVde_2 ),
        .O(q_out_20_in[2]));
  LUT6 #(
    .INIT(64'h0DFDFD0D0D0DFDFD)) 
    \pDataOutRaw[3]_i_1__1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(\cnt_t_3[4]_i_6__0_n_0 ),
        .I4(\q_m_2_reg_n_0_[3] ),
        .I5(\cnt_t_3[4]_i_4_n_0 ),
        .O(\pDataOutRaw[3]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0FF000FF22222222)) 
    \pDataOutRaw[4]_i_1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\cnt_t_3[4]_i_6__0_n_0 ),
        .I3(\q_m_2_reg_n_0_[4] ),
        .I4(\cnt_t_3[4]_i_4_n_0 ),
        .I5(\DataEncoders[2].DataEncoder/pVde_2 ),
        .O(q_out_20_in[4]));
  LUT6 #(
    .INIT(64'h0DFDFD0D0D0DFDFD)) 
    \pDataOutRaw[5]_i_1__1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(\cnt_t_3[4]_i_6__0_n_0 ),
        .I4(\q_m_2_reg_n_0_[5] ),
        .I5(\cnt_t_3[4]_i_4_n_0 ),
        .O(\pDataOutRaw[5]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0FF000FF22222222)) 
    \pDataOutRaw[6]_i_1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\cnt_t_3[4]_i_6__0_n_0 ),
        .I3(\q_m_2_reg_n_0_[6] ),
        .I4(\cnt_t_3[4]_i_4_n_0 ),
        .I5(\DataEncoders[2].DataEncoder/pVde_2 ),
        .O(q_out_20_in[6]));
  LUT6 #(
    .INIT(64'h0DFDFD0D0D0DFDFD)) 
    \pDataOutRaw[7]_i_1__1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(\cnt_t_3[4]_i_6__0_n_0 ),
        .I4(\q_m_2_reg_n_0_[7] ),
        .I5(\cnt_t_3[4]_i_4_n_0 ),
        .O(\pDataOutRaw[7]_i_1__1_n_0 ));
  LUT4 #(
    .INIT(16'hF202)) 
    \pDataOutRaw[8]_i_1 
       (.I0(pC1_2),
        .I1(pC0_2),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(p_0_in),
        .O(q_out_20_in[8]));
  LUT3 #(
    .INIT(8'h01)) 
    \pDataOutRaw[9]_i_1 
       (.I0(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I1(pC0_2),
        .I2(pC1_2),
        .O(\pDataOutRaw[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFB0B0BF)) 
    \pDataOutRaw[9]_i_2 
       (.I0(\cnt_t_3[4]_i_6__0_n_0 ),
        .I1(\cnt_t_3[4]_i_4_n_0 ),
        .I2(\DataEncoders[2].DataEncoder/pVde_2 ),
        .I3(pC0_2),
        .I4(pC1_2),
        .O(q_out_20_in[9]));
  FDRE \pDataOutRaw_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[0]_i_1__1_n_0 ),
        .Q(pDataOutRaw[0]),
        .R(\pDataOutRaw[9]_i_1_n_0 ));
  FDRE \pDataOutRaw_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[1]_i_1__1_n_0 ),
        .Q(pDataOutRaw[1]),
        .R(\pDataOutRaw[9]_i_1_n_0 ));
  FDSE \pDataOutRaw_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(q_out_20_in[2]),
        .Q(pDataOutRaw[2]),
        .S(\pDataOutRaw[9]_i_1_n_0 ));
  FDRE \pDataOutRaw_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[3]_i_1__1_n_0 ),
        .Q(pDataOutRaw[3]),
        .R(\pDataOutRaw[9]_i_1_n_0 ));
  FDSE \pDataOutRaw_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(q_out_20_in[4]),
        .Q(pDataOutRaw[4]),
        .S(\pDataOutRaw[9]_i_1_n_0 ));
  FDRE \pDataOutRaw_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[5]_i_1__1_n_0 ),
        .Q(pDataOutRaw[5]),
        .R(\pDataOutRaw[9]_i_1_n_0 ));
  FDSE \pDataOutRaw_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(q_out_20_in[6]),
        .Q(pDataOutRaw[6]),
        .S(\pDataOutRaw[9]_i_1_n_0 ));
  FDRE \pDataOutRaw_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[7]_i_1__1_n_0 ),
        .Q(pDataOutRaw[7]),
        .R(\pDataOutRaw[9]_i_1_n_0 ));
  FDSE \pDataOutRaw_reg[8] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(q_out_20_in[8]),
        .Q(pDataOutRaw[8]),
        .S(\pDataOutRaw[9]_i_1_n_0 ));
  FDSE \pDataOutRaw_reg[9] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(q_out_20_in[9]),
        .Q(pDataOutRaw[9]),
        .S(\pDataOutRaw[9]_i_1_n_0 ));
  FDRE \pDataOut_1_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[0]),
        .Q(\pDataOut_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \pDataOut_1_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[1]),
        .Q(\pDataOut_1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \pDataOut_1_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[2]),
        .Q(p_0_in0_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[3]),
        .Q(p_0_in2_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[4]),
        .Q(p_0_in4_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[5]),
        .Q(p_0_in6_in_1),
        .R(1'b0));
  FDRE \pDataOut_1_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[6]),
        .Q(p_0_in8_in_0),
        .R(1'b0));
  FDRE \pDataOut_1_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[7]),
        .Q(p_0_in10_in),
        .R(1'b0));
  FDRE pVde_1_reg
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pVDE),
        .Q(pVde_1),
        .R(1'b0));
  FDRE pVde_2_reg
       (.C(PixelClk),
        .CE(1'b1),
        .D(pVde_1),
        .Q(\DataEncoders[2].DataEncoder/pVde_2 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAA55AA5599669566)) 
    \q_m_2[1]_i_1__0 
       (.I0(\pDataOut_1_reg_n_0_[1] ),
        .I1(\n1d_1_reg_n_0_[2] ),
        .I2(\n1d_1_reg_n_0_[0] ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\n1d_1_reg_n_0_[1] ),
        .I5(\n1d_1_reg_n_0_[3] ),
        .O(\q_m_2[1]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \q_m_2[2]_i_1 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(p_0_in0_in),
        .O(p_0_in9_in));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \q_m_2[3]_i_1 
       (.I0(\q_m_2[8]_i_1_n_0 ),
        .I1(p_0_in0_in),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(p_0_in2_in),
        .O(p_0_in8_in));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \q_m_2[4]_i_1 
       (.I0(p_0_in2_in),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(p_0_in0_in),
        .I4(p_0_in4_in),
        .O(p_0_in7_in));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \q_m_2[5]_i_1 
       (.I0(\q_m_2[8]_i_1_n_0 ),
        .I1(\q_m_2[7]_i_2_n_0 ),
        .I2(p_0_in6_in_1),
        .O(p_0_in6_in));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \q_m_2[6]_i_1__0 
       (.I0(p_0_in8_in_0),
        .I1(\q_m_2[7]_i_2_n_0 ),
        .I2(p_0_in6_in_1),
        .O(\q_m_2[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \q_m_2[7]_i_1__0 
       (.I0(\q_m_2[8]_i_1_n_0 ),
        .I1(\q_m_2[7]_i_2_n_0 ),
        .I2(p_0_in6_in_1),
        .I3(p_0_in10_in),
        .I4(p_0_in8_in_0),
        .O(p_1_in12_in));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \q_m_2[7]_i_2 
       (.I0(p_0_in4_in),
        .I1(p_0_in0_in),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(p_0_in2_in),
        .O(\q_m_2[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00105555)) 
    \q_m_2[8]_i_1 
       (.I0(\n1d_1_reg_n_0_[3] ),
        .I1(\n1d_1_reg_n_0_[1] ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(\n1d_1_reg_n_0_[0] ),
        .I4(\n1d_1_reg_n_0_[2] ),
        .O(\q_m_2[8]_i_1_n_0 ));
  FDRE \q_m_2_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOut_1_reg_n_0_[0] ),
        .Q(\q_m_2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[1]_i_1__0_n_0 ),
        .Q(\q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_0_in9_in),
        .Q(\q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_0_in8_in),
        .Q(\q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \q_m_2_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_0_in7_in),
        .Q(\q_m_2_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \q_m_2_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_0_in6_in),
        .Q(\q_m_2_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \q_m_2_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[6]_i_1__0_n_0 ),
        .Q(\q_m_2_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \q_m_2_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_1_in12_in),
        .Q(\q_m_2_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \q_m_2_reg[8] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[8]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "TMDS_Encoder" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_TMDS_Encoder_1
   (Q,
    PixelClk,
    vid_pData,
    SR);
  output [9:0]Q;
  input PixelClk;
  input [7:0]vid_pData;
  input [0:0]SR;

  wire PixelClk;
  wire [9:0]Q;
  wire [0:0]SR;
  wire [4:1]cnt_t_2;
  wire \cnt_t_3[2]_i_2__0_n_0 ;
  wire \cnt_t_3[2]_i_3__0_n_0 ;
  wire \cnt_t_3[2]_i_4__0_n_0 ;
  wire \cnt_t_3[3]_i_2__0_n_0 ;
  wire \cnt_t_3[3]_i_3__0_n_0 ;
  wire \cnt_t_3[3]_i_4__0_n_0 ;
  wire \cnt_t_3[3]_i_5__0_n_0 ;
  wire \cnt_t_3[3]_i_6_n_0 ;
  wire \cnt_t_3[3]_i_7_n_0 ;
  wire \cnt_t_3[4]_i_2__0_n_0 ;
  wire \cnt_t_3[4]_i_3__0_n_0 ;
  wire \cnt_t_3[4]_i_4__0_n_0 ;
  wire \cnt_t_3[4]_i_5__1_n_0 ;
  wire \cnt_t_3[4]_i_6_n_0 ;
  wire \cnt_t_3[4]_i_7__0_n_0 ;
  wire \cnt_t_3[4]_i_8__1_n_0 ;
  wire \cnt_t_3[4]_i_9_n_0 ;
  wire \cnt_t_3_reg_n_0_[1] ;
  wire \cnt_t_3_reg_n_0_[2] ;
  wire \cnt_t_3_reg_n_0_[3] ;
  wire \cnt_t_3_reg_n_0_[4] ;
  wire \n0q_m_2[1]_i_1__0_n_0 ;
  wire \n0q_m_2[2]_i_1_n_0 ;
  wire \n0q_m_2[3]_i_1__0_n_0 ;
  wire \n0q_m_2_reg_n_0_[1] ;
  wire \n0q_m_2_reg_n_0_[2] ;
  wire \n0q_m_2_reg_n_0_[3] ;
  wire \n1d_1[0]_i_1_n_0 ;
  wire \n1d_1[0]_i_2_n_0 ;
  wire \n1d_1[1]_i_1_n_0 ;
  wire \n1d_1[1]_i_2_n_0 ;
  wire \n1d_1[2]_i_1_n_0 ;
  wire \n1d_1[2]_i_2_n_0 ;
  wire \n1d_1[3]_i_1_n_0 ;
  wire \n1d_1[3]_i_2_n_0 ;
  wire \n1d_1[3]_i_3_n_0 ;
  wire \n1d_1[3]_i_4_n_0 ;
  wire \n1d_1_reg_n_0_[0] ;
  wire \n1d_1_reg_n_0_[1] ;
  wire \n1d_1_reg_n_0_[2] ;
  wire \n1d_1_reg_n_0_[3] ;
  wire \n1q_m_2[0]_i_1_n_0 ;
  wire \n1q_m_2[1]_i_1__0_n_0 ;
  wire \n1q_m_2[2]_i_1__0_n_0 ;
  wire \n1q_m_2[3]_i_1__0_n_0 ;
  wire \n1q_m_2[3]_i_2__0_n_0 ;
  wire \n1q_m_2[3]_i_3__0_n_0 ;
  wire \n1q_m_2[3]_i_4_n_0 ;
  wire \n1q_m_2[3]_i_5__0_n_0 ;
  wire \n1q_m_2[3]_i_6_n_0 ;
  wire \n1q_m_2_reg_n_0_[0] ;
  wire \n1q_m_2_reg_n_0_[1] ;
  wire \n1q_m_2_reg_n_0_[2] ;
  wire \n1q_m_2_reg_n_0_[3] ;
  wire \pDataOutRaw[0]_i_1_n_0 ;
  wire \pDataOutRaw[1]_i_1_n_0 ;
  wire \pDataOutRaw[2]_i_1__0_n_0 ;
  wire \pDataOutRaw[3]_i_1_n_0 ;
  wire \pDataOutRaw[4]_i_1__0_n_0 ;
  wire \pDataOutRaw[5]_i_1_n_0 ;
  wire \pDataOutRaw[6]_i_1__0_n_0 ;
  wire \pDataOutRaw[7]_i_1_n_0 ;
  wire \pDataOutRaw[9]_i_1__0_n_0 ;
  wire \pDataOutRaw[9]_i_2__0_n_0 ;
  wire \pDataOut_1_reg_n_0_[0] ;
  wire \pDataOut_1_reg_n_0_[1] ;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in10_in;
  wire p_0_in2_in;
  wire p_0_in4_in;
  wire p_0_in6_in;
  wire p_0_in8_in;
  wire \q_m_2[1]_i_1_n_0 ;
  wire \q_m_2[2]_i_1__0_n_0 ;
  wire \q_m_2[3]_i_1__0_n_0 ;
  wire \q_m_2[4]_i_1__0_n_0 ;
  wire \q_m_2[5]_i_1__0_n_0 ;
  wire \q_m_2[6]_i_1_n_0 ;
  wire \q_m_2[7]_i_1_n_0 ;
  wire \q_m_2[7]_i_2__0_n_0 ;
  wire \q_m_2[8]_i_1__0_n_0 ;
  wire \q_m_2_reg_n_0_[0] ;
  wire \q_m_2_reg_n_0_[1] ;
  wire \q_m_2_reg_n_0_[2] ;
  wire \q_m_2_reg_n_0_[3] ;
  wire \q_m_2_reg_n_0_[4] ;
  wire \q_m_2_reg_n_0_[5] ;
  wire \q_m_2_reg_n_0_[6] ;
  wire \q_m_2_reg_n_0_[7] ;
  wire [7:0]vid_pData;

  LUT6 #(
    .INIT(64'h9669966969969696)) 
    \cnt_t_3[1]_i_1__0 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(\cnt_t_3[3]_i_4__0_n_0 ),
        .I4(\cnt_t_3[2]_i_4__0_n_0 ),
        .I5(p_0_in),
        .O(cnt_t_2[1]));
  LUT6 #(
    .INIT(64'h95569AA6A55AAAAA)) 
    \cnt_t_3[2]_i_1__0 
       (.I0(\cnt_t_3[2]_i_2__0_n_0 ),
        .I1(\cnt_t_3[3]_i_4__0_n_0 ),
        .I2(p_0_in),
        .I3(\cnt_t_3_reg_n_0_[1] ),
        .I4(\cnt_t_3[2]_i_3__0_n_0 ),
        .I5(\cnt_t_3[2]_i_4__0_n_0 ),
        .O(cnt_t_2[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h96699696)) 
    \cnt_t_3[2]_i_2__0 
       (.I0(\cnt_t_3_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[2] ),
        .I2(\n0q_m_2_reg_n_0_[2] ),
        .I3(\n0q_m_2_reg_n_0_[1] ),
        .I4(\n1q_m_2_reg_n_0_[1] ),
        .O(\cnt_t_3[2]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_t_3[2]_i_3__0 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .O(\cnt_t_3[2]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFD0000FFFDFFFD)) 
    \cnt_t_3[2]_i_4__0 
       (.I0(\n1q_m_2_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\n1q_m_2_reg_n_0_[0] ),
        .I3(\n1q_m_2_reg_n_0_[3] ),
        .I4(\cnt_t_3_reg_n_0_[4] ),
        .I5(\cnt_t_3[4]_i_5__1_n_0 ),
        .O(\cnt_t_3[2]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAA999A966655565)) 
    \cnt_t_3[3]_i_1__0 
       (.I0(\cnt_t_3[3]_i_2__0_n_0 ),
        .I1(\cnt_t_3[4]_i_2__0_n_0 ),
        .I2(\cnt_t_3[3]_i_3__0_n_0 ),
        .I3(\cnt_t_3[3]_i_4__0_n_0 ),
        .I4(\cnt_t_3[3]_i_5__0_n_0 ),
        .I5(\cnt_t_3[3]_i_6_n_0 ),
        .O(cnt_t_2[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \cnt_t_3[3]_i_2__0 
       (.I0(\cnt_t_3_reg_n_0_[3] ),
        .I1(\cnt_t_3[4]_i_7__0_n_0 ),
        .O(\cnt_t_3[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h099FFFFF0000099F)) 
    \cnt_t_3[3]_i_3__0 
       (.I0(\n0q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\cnt_t_3_reg_n_0_[2] ),
        .I5(\cnt_t_3[3]_i_7_n_0 ),
        .O(\cnt_t_3[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFCABFCABFCABFCBB)) 
    \cnt_t_3[3]_i_4__0 
       (.I0(\cnt_t_3[4]_i_5__1_n_0 ),
        .I1(\n1q_m_2_reg_n_0_[3] ),
        .I2(\n1q_m_2_reg_n_0_[2] ),
        .I3(\cnt_t_3_reg_n_0_[4] ),
        .I4(\n1q_m_2_reg_n_0_[1] ),
        .I5(\n1q_m_2_reg_n_0_[0] ),
        .O(\cnt_t_3[3]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEE88EE88E8888)) 
    \cnt_t_3[3]_i_5__0 
       (.I0(\cnt_t_3_reg_n_0_[2] ),
        .I1(\cnt_t_3[3]_i_7_n_0 ),
        .I2(\n0q_m_2_reg_n_0_[1] ),
        .I3(\n1q_m_2_reg_n_0_[1] ),
        .I4(\cnt_t_3_reg_n_0_[1] ),
        .I5(p_0_in),
        .O(\cnt_t_3[3]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h9BBF04DF04DF9BBF)) 
    \cnt_t_3[3]_i_6 
       (.I0(\n0q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(\cnt_t_3_reg_n_0_[2] ),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .I5(\n0q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    \cnt_t_3[3]_i_7 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .I2(\n0q_m_2_reg_n_0_[2] ),
        .I3(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h04550404)) 
    \cnt_t_3[4]_i_2__0 
       (.I0(p_0_in),
        .I1(\cnt_t_3[4]_i_5__1_n_0 ),
        .I2(\cnt_t_3_reg_n_0_[4] ),
        .I3(\cnt_t_3[4]_i_6_n_0 ),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB8830034477CF)) 
    \cnt_t_3[4]_i_3__0 
       (.I0(\cnt_t_3[3]_i_5__0_n_0 ),
        .I1(\cnt_t_3[3]_i_4__0_n_0 ),
        .I2(\cnt_t_3[3]_i_3__0_n_0 ),
        .I3(\cnt_t_3_reg_n_0_[3] ),
        .I4(\cnt_t_3[4]_i_7__0_n_0 ),
        .I5(\cnt_t_3[4]_i_8__1_n_0 ),
        .O(\cnt_t_3[4]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hA9956AA96AA9566A)) 
    \cnt_t_3[4]_i_4__0 
       (.I0(\cnt_t_3_reg_n_0_[4] ),
        .I1(\cnt_t_3_reg_n_0_[3] ),
        .I2(\cnt_t_3[4]_i_9_n_0 ),
        .I3(\n0q_m_2_reg_n_0_[3] ),
        .I4(\n1q_m_2_reg_n_0_[3] ),
        .I5(\cnt_t_3[3]_i_6_n_0 ),
        .O(\cnt_t_3[4]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \cnt_t_3[4]_i_5__1 
       (.I0(\cnt_t_3_reg_n_0_[3] ),
        .I1(\cnt_t_3_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_5__1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \cnt_t_3[4]_i_6 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[0] ),
        .I2(\n1q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hDF4520BA20BADF45)) 
    \cnt_t_3[4]_i_7__0 
       (.I0(\n1q_m_2_reg_n_0_[2] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .I2(\n1q_m_2_reg_n_0_[1] ),
        .I3(\n0q_m_2_reg_n_0_[2] ),
        .I4(\n0q_m_2_reg_n_0_[3] ),
        .I5(\n1q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_7__0_n_0 ));
  LUT4 #(
    .INIT(16'hA665)) 
    \cnt_t_3[4]_i_8__1 
       (.I0(\cnt_t_3_reg_n_0_[4] ),
        .I1(\n1q_m_2_reg_n_0_[3] ),
        .I2(\cnt_t_3[4]_i_9_n_0 ),
        .I3(\n0q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_8__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hA2FB)) 
    \cnt_t_3[4]_i_9 
       (.I0(\n0q_m_2_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\n0q_m_2_reg_n_0_[1] ),
        .I3(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[1]),
        .Q(\cnt_t_3_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[2]),
        .Q(\cnt_t_3_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[3]),
        .Q(\cnt_t_3_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[4]),
        .Q(\cnt_t_3_reg_n_0_[4] ),
        .R(SR));
  MUXF7 \cnt_t_3_reg[4]_i_1 
       (.I0(\cnt_t_3[4]_i_3__0_n_0 ),
        .I1(\cnt_t_3[4]_i_4__0_n_0 ),
        .O(cnt_t_2[4]),
        .S(\cnt_t_3[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h6696696696996696)) 
    \n0q_m_2[1]_i_1__0 
       (.I0(\n1q_m_2[3]_i_2__0_n_0 ),
        .I1(\n1q_m_2[3]_i_3__0_n_0 ),
        .I2(\n1q_m_2[3]_i_4_n_0 ),
        .I3(\n1q_m_2[3]_i_5__0_n_0 ),
        .I4(\pDataOut_1_reg_n_0_[0] ),
        .I5(\n1q_m_2[3]_i_6_n_0 ),
        .O(\n0q_m_2[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hBB2BBDBB2B22BB2B)) 
    \n0q_m_2[2]_i_1 
       (.I0(\n1q_m_2[3]_i_2__0_n_0 ),
        .I1(\n1q_m_2[3]_i_3__0_n_0 ),
        .I2(\n1q_m_2[3]_i_4_n_0 ),
        .I3(\n1q_m_2[3]_i_5__0_n_0 ),
        .I4(\pDataOut_1_reg_n_0_[0] ),
        .I5(\n1q_m_2[3]_i_6_n_0 ),
        .O(\n0q_m_2[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \n0q_m_2[3]_i_1__0 
       (.I0(\n1q_m_2[3]_i_2__0_n_0 ),
        .I1(\n1q_m_2[3]_i_3__0_n_0 ),
        .I2(\n1q_m_2[3]_i_4_n_0 ),
        .I3(\n1q_m_2[3]_i_5__0_n_0 ),
        .I4(\pDataOut_1_reg_n_0_[0] ),
        .I5(\n1q_m_2[3]_i_6_n_0 ),
        .O(\n0q_m_2[3]_i_1__0_n_0 ));
  FDRE \n0q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[1]_i_1__0_n_0 ),
        .Q(\n0q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n0q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[2]_i_1_n_0 ),
        .Q(\n0q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n0q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[3]_i_1__0_n_0 ),
        .Q(\n0q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \n1d_1[0]_i_1 
       (.I0(vid_pData[7]),
        .I1(vid_pData[0]),
        .I2(\n1d_1[0]_i_2_n_0 ),
        .I3(vid_pData[5]),
        .I4(vid_pData[6]),
        .I5(vid_pData[4]),
        .O(\n1d_1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \n1d_1[0]_i_2 
       (.I0(vid_pData[1]),
        .I1(vid_pData[3]),
        .I2(vid_pData[2]),
        .O(\n1d_1[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \n1d_1[1]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[1]_i_2_n_0 ),
        .I2(\n1d_1[3]_i_3_n_0 ),
        .O(\n1d_1[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
    \n1d_1[1]_i_2 
       (.I0(vid_pData[4]),
        .I1(vid_pData[5]),
        .I2(vid_pData[6]),
        .I3(vid_pData[1]),
        .I4(vid_pData[2]),
        .I5(vid_pData[3]),
        .O(\n1d_1[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7E7E7EE87EE8E8E8)) 
    \n1d_1[2]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[3]_i_3_n_0 ),
        .I2(\n1d_1[2]_i_2_n_0 ),
        .I3(vid_pData[3]),
        .I4(vid_pData[2]),
        .I5(vid_pData[1]),
        .O(\n1d_1[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \n1d_1[2]_i_2 
       (.I0(vid_pData[6]),
        .I1(vid_pData[5]),
        .I2(vid_pData[4]),
        .O(\n1d_1[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \n1d_1[3]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[3]_i_3_n_0 ),
        .I2(vid_pData[4]),
        .I3(vid_pData[5]),
        .I4(vid_pData[6]),
        .I5(\n1d_1[3]_i_4_n_0 ),
        .O(\n1d_1[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9600009600969600)) 
    \n1d_1[3]_i_2 
       (.I0(vid_pData[5]),
        .I1(vid_pData[6]),
        .I2(vid_pData[4]),
        .I3(vid_pData[7]),
        .I4(vid_pData[0]),
        .I5(\n1d_1[0]_i_2_n_0 ),
        .O(\n1d_1[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    \n1d_1[3]_i_3 
       (.I0(vid_pData[0]),
        .I1(vid_pData[7]),
        .I2(vid_pData[2]),
        .I3(vid_pData[3]),
        .I4(vid_pData[1]),
        .O(\n1d_1[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \n1d_1[3]_i_4 
       (.I0(vid_pData[3]),
        .I1(vid_pData[2]),
        .I2(vid_pData[1]),
        .O(\n1d_1[3]_i_4_n_0 ));
  FDRE \n1d_1_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[0]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \n1d_1_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[1]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n1d_1_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[2]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n1d_1_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[3]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \n1q_m_2[0]_i_1 
       (.I0(\n1q_m_2[3]_i_6_n_0 ),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\n1q_m_2[3]_i_5__0_n_0 ),
        .I3(\q_m_2[7]_i_2__0_n_0 ),
        .I4(\q_m_2[8]_i_1__0_n_0 ),
        .I5(p_0_in8_in),
        .O(\n1q_m_2[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4D24B2DBB2DB4D24)) 
    \n1q_m_2[1]_i_1__0 
       (.I0(\n1q_m_2[3]_i_4_n_0 ),
        .I1(\n1q_m_2[3]_i_6_n_0 ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(\n1q_m_2[3]_i_5__0_n_0 ),
        .I4(\n1q_m_2[3]_i_3__0_n_0 ),
        .I5(\n1q_m_2[3]_i_2__0_n_0 ),
        .O(\n1q_m_2[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hDF4D0400FBFFDF4D)) 
    \n1q_m_2[2]_i_1__0 
       (.I0(\n1q_m_2[3]_i_6_n_0 ),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\n1q_m_2[3]_i_5__0_n_0 ),
        .I3(\n1q_m_2[3]_i_4_n_0 ),
        .I4(\n1q_m_2[3]_i_3__0_n_0 ),
        .I5(\n1q_m_2[3]_i_2__0_n_0 ),
        .O(\n1q_m_2[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \n1q_m_2[3]_i_1__0 
       (.I0(\n1q_m_2[3]_i_2__0_n_0 ),
        .I1(\n1q_m_2[3]_i_3__0_n_0 ),
        .I2(\n1q_m_2[3]_i_4_n_0 ),
        .I3(\n1q_m_2[3]_i_5__0_n_0 ),
        .I4(\pDataOut_1_reg_n_0_[0] ),
        .I5(\n1q_m_2[3]_i_6_n_0 ),
        .O(\n1q_m_2[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h8E71718E)) 
    \n1q_m_2[3]_i_2__0 
       (.I0(\q_m_2[8]_i_1__0_n_0 ),
        .I1(p_0_in2_in),
        .I2(p_0_in0_in),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\pDataOut_1_reg_n_0_[1] ),
        .O(\n1q_m_2[3]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h5695)) 
    \n1q_m_2[3]_i_3__0 
       (.I0(\q_m_2[7]_i_2__0_n_0 ),
        .I1(p_0_in6_in),
        .I2(\q_m_2[8]_i_1__0_n_0 ),
        .I3(p_0_in8_in),
        .O(\n1q_m_2[3]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \n1q_m_2[3]_i_4 
       (.I0(p_0_in8_in),
        .I1(\q_m_2[8]_i_1__0_n_0 ),
        .I2(\q_m_2[7]_i_2__0_n_0 ),
        .O(\n1q_m_2[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \n1q_m_2[3]_i_5__0 
       (.I0(\pDataOut_1_reg_n_0_[1] ),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(p_0_in2_in),
        .O(\n1q_m_2[3]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \n1q_m_2[3]_i_6 
       (.I0(\q_m_2[8]_i_1__0_n_0 ),
        .I1(p_0_in6_in),
        .I2(\q_m_2[7]_i_2__0_n_0 ),
        .I3(p_0_in8_in),
        .I4(p_0_in10_in),
        .O(\n1q_m_2[3]_i_6_n_0 ));
  FDRE \n1q_m_2_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[0]_i_1_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[1]_i_1__0_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[2]_i_1__0_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[3]_i_1__0_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[0]_i_1 
       (.I0(\pDataOutRaw[9]_i_2__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[0] ),
        .O(\pDataOutRaw[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[1]_i_1 
       (.I0(\pDataOutRaw[9]_i_2__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[1] ),
        .O(\pDataOutRaw[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h39)) 
    \pDataOutRaw[2]_i_1__0 
       (.I0(\cnt_t_3[3]_i_4__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[2] ),
        .I2(\cnt_t_3[4]_i_2__0_n_0 ),
        .O(\pDataOutRaw[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[3]_i_1 
       (.I0(\pDataOutRaw[9]_i_2__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[3] ),
        .O(\pDataOutRaw[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h39)) 
    \pDataOutRaw[4]_i_1__0 
       (.I0(\cnt_t_3[3]_i_4__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[4] ),
        .I2(\cnt_t_3[4]_i_2__0_n_0 ),
        .O(\pDataOutRaw[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[5]_i_1 
       (.I0(\pDataOutRaw[9]_i_2__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[5] ),
        .O(\pDataOutRaw[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h39)) 
    \pDataOutRaw[6]_i_1__0 
       (.I0(\cnt_t_3[3]_i_4__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[6] ),
        .I2(\cnt_t_3[4]_i_2__0_n_0 ),
        .O(\pDataOutRaw[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[7]_i_1 
       (.I0(\pDataOutRaw[9]_i_2__0_n_0 ),
        .I1(\q_m_2_reg_n_0_[7] ),
        .O(\pDataOutRaw[7]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \pDataOutRaw[9]_i_1__0 
       (.I0(\pDataOutRaw[9]_i_2__0_n_0 ),
        .O(\pDataOutRaw[9]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hEEFFEE1FE200E213)) 
    \pDataOutRaw[9]_i_2__0 
       (.I0(\n1q_m_2_reg_n_0_[3] ),
        .I1(\n1q_m_2_reg_n_0_[2] ),
        .I2(\cnt_t_3[4]_i_6_n_0 ),
        .I3(\cnt_t_3_reg_n_0_[4] ),
        .I4(\cnt_t_3[4]_i_5__1_n_0 ),
        .I5(p_0_in),
        .O(\pDataOutRaw[9]_i_2__0_n_0 ));
  FDRE \pDataOutRaw_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE \pDataOutRaw_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDSE \pDataOutRaw_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[2]_i_1__0_n_0 ),
        .Q(Q[2]),
        .S(SR));
  FDRE \pDataOutRaw_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(SR));
  FDSE \pDataOutRaw_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .S(SR));
  FDRE \pDataOutRaw_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(SR));
  FDSE \pDataOutRaw_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .S(SR));
  FDRE \pDataOutRaw_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[7]_i_1_n_0 ),
        .Q(Q[7]),
        .R(SR));
  FDSE \pDataOutRaw_reg[8] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(Q[8]),
        .S(SR));
  FDSE \pDataOutRaw_reg[9] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[9]_i_1__0_n_0 ),
        .Q(Q[9]),
        .S(SR));
  FDRE \pDataOut_1_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[0]),
        .Q(\pDataOut_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \pDataOut_1_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[1]),
        .Q(\pDataOut_1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \pDataOut_1_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[2]),
        .Q(p_0_in0_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[3]),
        .Q(p_0_in2_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[4]),
        .Q(p_0_in4_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[5]),
        .Q(p_0_in6_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[6]),
        .Q(p_0_in8_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[7]),
        .Q(p_0_in10_in),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA9A9A99956565656)) 
    \q_m_2[1]_i_1 
       (.I0(\pDataOut_1_reg_n_0_[1] ),
        .I1(\n1d_1_reg_n_0_[3] ),
        .I2(\n1d_1_reg_n_0_[2] ),
        .I3(\n1d_1_reg_n_0_[0] ),
        .I4(\n1d_1_reg_n_0_[1] ),
        .I5(\pDataOut_1_reg_n_0_[0] ),
        .O(\q_m_2[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \q_m_2[2]_i_1__0 
       (.I0(p_0_in0_in),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .O(\q_m_2[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \q_m_2[3]_i_1__0 
       (.I0(\q_m_2[8]_i_1__0_n_0 ),
        .I1(p_0_in2_in),
        .I2(p_0_in0_in),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\pDataOut_1_reg_n_0_[1] ),
        .O(\q_m_2[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \q_m_2[4]_i_1__0 
       (.I0(p_0_in2_in),
        .I1(p_0_in0_in),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(\pDataOut_1_reg_n_0_[1] ),
        .I4(p_0_in4_in),
        .O(\q_m_2[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \q_m_2[5]_i_1__0 
       (.I0(\q_m_2[7]_i_2__0_n_0 ),
        .I1(p_0_in6_in),
        .I2(\q_m_2[8]_i_1__0_n_0 ),
        .O(\q_m_2[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \q_m_2[6]_i_1 
       (.I0(\q_m_2[7]_i_2__0_n_0 ),
        .I1(p_0_in6_in),
        .I2(p_0_in8_in),
        .O(\q_m_2[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \q_m_2[7]_i_1 
       (.I0(p_0_in10_in),
        .I1(p_0_in8_in),
        .I2(\q_m_2[7]_i_2__0_n_0 ),
        .I3(p_0_in6_in),
        .I4(\q_m_2[8]_i_1__0_n_0 ),
        .O(\q_m_2[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \q_m_2[7]_i_2__0 
       (.I0(p_0_in4_in),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(p_0_in0_in),
        .I4(p_0_in2_in),
        .O(\q_m_2[7]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h000002FF)) 
    \q_m_2[8]_i_1__0 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\n1d_1_reg_n_0_[1] ),
        .I2(\n1d_1_reg_n_0_[0] ),
        .I3(\n1d_1_reg_n_0_[2] ),
        .I4(\n1d_1_reg_n_0_[3] ),
        .O(\q_m_2[8]_i_1__0_n_0 ));
  FDRE \q_m_2_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOut_1_reg_n_0_[0] ),
        .Q(\q_m_2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[1]_i_1_n_0 ),
        .Q(\q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[2]_i_1__0_n_0 ),
        .Q(\q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[3]_i_1__0_n_0 ),
        .Q(\q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \q_m_2_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[4]_i_1__0_n_0 ),
        .Q(\q_m_2_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \q_m_2_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[5]_i_1__0_n_0 ),
        .Q(\q_m_2_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \q_m_2_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[6]_i_1_n_0 ),
        .Q(\q_m_2_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \q_m_2_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[7]_i_1_n_0 ),
        .Q(\q_m_2_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \q_m_2_reg[8] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[8]_i_1__0_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "TMDS_Encoder" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_TMDS_Encoder_3
   (pDataOut,
    PixelClk,
    vid_pData,
    SR);
  output [9:0]pDataOut;
  input PixelClk;
  input [7:0]vid_pData;
  input [0:0]SR;

  wire PixelClk;
  wire [0:0]SR;
  wire [4:1]cnt_t_2;
  wire \cnt_t_3[2]_i_2__1_n_0 ;
  wire \cnt_t_3[2]_i_3__1_n_0 ;
  wire \cnt_t_3[2]_i_4__1_n_0 ;
  wire \cnt_t_3[3]_i_2__1_n_0 ;
  wire \cnt_t_3[3]_i_3__1_n_0 ;
  wire \cnt_t_3[3]_i_4__1_n_0 ;
  wire \cnt_t_3[3]_i_5__1_n_0 ;
  wire \cnt_t_3[4]_i_10__0_n_0 ;
  wire \cnt_t_3[4]_i_11__0_n_0 ;
  wire \cnt_t_3[4]_i_12__0_n_0 ;
  wire \cnt_t_3[4]_i_13__0_n_0 ;
  wire \cnt_t_3[4]_i_14__0_n_0 ;
  wire \cnt_t_3[4]_i_2__1_n_0 ;
  wire \cnt_t_3[4]_i_3__1_n_0 ;
  wire \cnt_t_3[4]_i_4__1_n_0 ;
  wire \cnt_t_3[4]_i_5__0_n_0 ;
  wire \cnt_t_3[4]_i_6__1_n_0 ;
  wire \cnt_t_3[4]_i_7__1_n_0 ;
  wire \cnt_t_3[4]_i_8_n_0 ;
  wire \cnt_t_3[4]_i_9__1_n_0 ;
  wire \cnt_t_3_reg_n_0_[1] ;
  wire \cnt_t_3_reg_n_0_[2] ;
  wire \cnt_t_3_reg_n_0_[3] ;
  wire \cnt_t_3_reg_n_0_[4] ;
  wire \n0q_m_2[1]_i_1__1_n_0 ;
  wire \n0q_m_2[2]_i_1__1_n_0 ;
  wire \n0q_m_2[3]_i_1__1_n_0 ;
  wire \n0q_m_2_reg_n_0_[1] ;
  wire \n0q_m_2_reg_n_0_[2] ;
  wire \n0q_m_2_reg_n_0_[3] ;
  wire \n1d_1[0]_i_1_n_0 ;
  wire \n1d_1[0]_i_2_n_0 ;
  wire \n1d_1[1]_i_1_n_0 ;
  wire \n1d_1[1]_i_2_n_0 ;
  wire \n1d_1[2]_i_1_n_0 ;
  wire \n1d_1[2]_i_2_n_0 ;
  wire \n1d_1[3]_i_1_n_0 ;
  wire \n1d_1[3]_i_2_n_0 ;
  wire \n1d_1[3]_i_3_n_0 ;
  wire \n1d_1[3]_i_4_n_0 ;
  wire \n1d_1_reg_n_0_[0] ;
  wire \n1d_1_reg_n_0_[1] ;
  wire \n1d_1_reg_n_0_[2] ;
  wire \n1d_1_reg_n_0_[3] ;
  wire \n1q_m_2[0]_i_1__1_n_0 ;
  wire \n1q_m_2[1]_i_1__1_n_0 ;
  wire \n1q_m_2[2]_i_1__1_n_0 ;
  wire \n1q_m_2[3]_i_1__1_n_0 ;
  wire \n1q_m_2[3]_i_2__1_n_0 ;
  wire \n1q_m_2[3]_i_3__1_n_0 ;
  wire \n1q_m_2[3]_i_4__1_n_0 ;
  wire \n1q_m_2[3]_i_5__1_n_0 ;
  wire \n1q_m_2[3]_i_6__1_n_0 ;
  wire \n1q_m_2_reg_n_0_[0] ;
  wire \n1q_m_2_reg_n_0_[1] ;
  wire \n1q_m_2_reg_n_0_[2] ;
  wire \n1q_m_2_reg_n_0_[3] ;
  wire \pDataOutRaw[0]_i_1__0_n_0 ;
  wire \pDataOutRaw[1]_i_1__0_n_0 ;
  wire \pDataOutRaw[2]_i_1__1_n_0 ;
  wire \pDataOutRaw[3]_i_1__0_n_0 ;
  wire \pDataOutRaw[4]_i_1__1_n_0 ;
  wire \pDataOutRaw[5]_i_1__0_n_0 ;
  wire \pDataOutRaw[6]_i_1__1_n_0 ;
  wire \pDataOutRaw[7]_i_1__0_n_0 ;
  wire \pDataOutRaw[9]_i_1__1_n_0 ;
  wire \pDataOutRaw[9]_i_2__1_n_0 ;
  wire \pDataOutRaw_reg_n_0_[0] ;
  wire \pDataOutRaw_reg_n_0_[1] ;
  wire \pDataOutRaw_reg_n_0_[2] ;
  wire \pDataOutRaw_reg_n_0_[3] ;
  wire \pDataOutRaw_reg_n_0_[4] ;
  wire \pDataOutRaw_reg_n_0_[5] ;
  wire \pDataOutRaw_reg_n_0_[6] ;
  wire \pDataOutRaw_reg_n_0_[7] ;
  wire \pDataOutRaw_reg_n_0_[8] ;
  wire \pDataOutRaw_reg_n_0_[9] ;
  wire \pDataOut_1_reg_n_0_[0] ;
  wire \pDataOut_1_reg_n_0_[1] ;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in10_in;
  wire p_0_in2_in;
  wire p_0_in4_in;
  wire p_0_in6_in;
  wire p_0_in8_in;
  wire \q_m_2[1]_i_1__1_n_0 ;
  wire \q_m_2[2]_i_1__1_n_0 ;
  wire \q_m_2[3]_i_1__1_n_0 ;
  wire \q_m_2[4]_i_1__1_n_0 ;
  wire \q_m_2[5]_i_1__1_n_0 ;
  wire \q_m_2[6]_i_1__1_n_0 ;
  wire \q_m_2[7]_i_1__1_n_0 ;
  wire \q_m_2[7]_i_2__1_n_0 ;
  wire \q_m_2[8]_i_1__1_n_0 ;
  wire \q_m_2_reg_n_0_[0] ;
  wire \q_m_2_reg_n_0_[1] ;
  wire \q_m_2_reg_n_0_[2] ;
  wire \q_m_2_reg_n_0_[3] ;
  wire \q_m_2_reg_n_0_[4] ;
  wire \q_m_2_reg_n_0_[5] ;
  wire \q_m_2_reg_n_0_[6] ;
  wire \q_m_2_reg_n_0_[7] ;
  wire [7:0]vid_pData;

  assign pDataOut[9] = \pDataOutRaw_reg_n_0_[9] ;
  assign pDataOut[8] = \pDataOutRaw_reg_n_0_[8] ;
  assign pDataOut[7] = \pDataOutRaw_reg_n_0_[7] ;
  assign pDataOut[6] = \pDataOutRaw_reg_n_0_[6] ;
  assign pDataOut[5] = \pDataOutRaw_reg_n_0_[5] ;
  assign pDataOut[4] = \pDataOutRaw_reg_n_0_[4] ;
  assign pDataOut[3] = \pDataOutRaw_reg_n_0_[3] ;
  assign pDataOut[2] = \pDataOutRaw_reg_n_0_[2] ;
  assign pDataOut[1] = \pDataOutRaw_reg_n_0_[1] ;
  assign pDataOut[0] = \pDataOutRaw_reg_n_0_[0] ;
  LUT6 #(
    .INIT(64'h9669966969969696)) 
    \cnt_t_3[1]_i_1__1 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(\cnt_t_3[4]_i_4__1_n_0 ),
        .I4(\cnt_t_3[2]_i_4__1_n_0 ),
        .I5(p_0_in),
        .O(cnt_t_2[1]));
  LUT6 #(
    .INIT(64'h95569AA6A55AAAAA)) 
    \cnt_t_3[2]_i_1__1 
       (.I0(\cnt_t_3[2]_i_2__1_n_0 ),
        .I1(\cnt_t_3[4]_i_4__1_n_0 ),
        .I2(p_0_in),
        .I3(\cnt_t_3_reg_n_0_[1] ),
        .I4(\cnt_t_3[2]_i_3__1_n_0 ),
        .I5(\cnt_t_3[2]_i_4__1_n_0 ),
        .O(cnt_t_2[2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h96699696)) 
    \cnt_t_3[2]_i_2__1 
       (.I0(\cnt_t_3_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[2] ),
        .I2(\n0q_m_2_reg_n_0_[2] ),
        .I3(\n0q_m_2_reg_n_0_[1] ),
        .I4(\n1q_m_2_reg_n_0_[1] ),
        .O(\cnt_t_3[2]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_t_3[2]_i_3__1 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .O(\cnt_t_3[2]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFD0000FFFDFFFD)) 
    \cnt_t_3[2]_i_4__1 
       (.I0(\n1q_m_2_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\n1q_m_2_reg_n_0_[0] ),
        .I3(\n1q_m_2_reg_n_0_[3] ),
        .I4(\cnt_t_3_reg_n_0_[4] ),
        .I5(\cnt_t_3[4]_i_12__0_n_0 ),
        .O(\cnt_t_3[2]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \cnt_t_3[3]_i_1__1 
       (.I0(\cnt_t_3[3]_i_2__1_n_0 ),
        .I1(\cnt_t_3[3]_i_3__1_n_0 ),
        .I2(\cnt_t_3[4]_i_4__1_n_0 ),
        .I3(\cnt_t_3[3]_i_4__1_n_0 ),
        .I4(\cnt_t_3[4]_i_6__1_n_0 ),
        .I5(\cnt_t_3[3]_i_5__1_n_0 ),
        .O(cnt_t_2[3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \cnt_t_3[3]_i_2__1 
       (.I0(\cnt_t_3_reg_n_0_[3] ),
        .I1(\cnt_t_3[4]_i_9__1_n_0 ),
        .O(\cnt_t_3[3]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h099FFFFF0000099F)) 
    \cnt_t_3[3]_i_3__1 
       (.I0(\n0q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\cnt_t_3_reg_n_0_[2] ),
        .I5(\cnt_t_3[4]_i_11__0_n_0 ),
        .O(\cnt_t_3[3]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEE88EE88E8888)) 
    \cnt_t_3[3]_i_4__1 
       (.I0(\cnt_t_3_reg_n_0_[2] ),
        .I1(\cnt_t_3[4]_i_11__0_n_0 ),
        .I2(\n0q_m_2_reg_n_0_[1] ),
        .I3(\n1q_m_2_reg_n_0_[1] ),
        .I4(\cnt_t_3_reg_n_0_[1] ),
        .I5(p_0_in),
        .O(\cnt_t_3[3]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'h9BBF04DF04DF9BBF)) 
    \cnt_t_3[3]_i_5__1 
       (.I0(\n0q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(\cnt_t_3_reg_n_0_[2] ),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .I5(\n0q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[3]_i_5__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h099F)) 
    \cnt_t_3[4]_i_10__0 
       (.I0(\n0q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(p_0_in),
        .O(\cnt_t_3[4]_i_10__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    \cnt_t_3[4]_i_11__0 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n0q_m_2_reg_n_0_[1] ),
        .I2(\n0q_m_2_reg_n_0_[2] ),
        .I3(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_11__0_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \cnt_t_3[4]_i_12__0 
       (.I0(\cnt_t_3_reg_n_0_[3] ),
        .I1(\cnt_t_3_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_12__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h066F)) 
    \cnt_t_3[4]_i_13__0 
       (.I0(\n0q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[1] ),
        .I3(p_0_in),
        .O(\cnt_t_3[4]_i_13__0_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \cnt_t_3[4]_i_14__0 
       (.I0(\n1q_m_2_reg_n_0_[1] ),
        .I1(\n1q_m_2_reg_n_0_[0] ),
        .I2(\n1q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_14__0_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \cnt_t_3[4]_i_1__0 
       (.I0(\cnt_t_3[4]_i_2__1_n_0 ),
        .I1(\cnt_t_3[4]_i_3__1_n_0 ),
        .I2(\cnt_t_3[4]_i_4__1_n_0 ),
        .I3(\cnt_t_3[4]_i_5__0_n_0 ),
        .I4(\cnt_t_3[4]_i_6__1_n_0 ),
        .I5(\cnt_t_3[4]_i_7__1_n_0 ),
        .O(cnt_t_2[4]));
  LUT4 #(
    .INIT(16'h599A)) 
    \cnt_t_3[4]_i_2__1 
       (.I0(\cnt_t_3_reg_n_0_[4] ),
        .I1(\n1q_m_2_reg_n_0_[3] ),
        .I2(\cnt_t_3[4]_i_8_n_0 ),
        .I3(\n0q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h71771171)) 
    \cnt_t_3[4]_i_3__1 
       (.I0(\cnt_t_3_reg_n_0_[3] ),
        .I1(\cnt_t_3[4]_i_9__1_n_0 ),
        .I2(\cnt_t_3[4]_i_10__0_n_0 ),
        .I3(\cnt_t_3_reg_n_0_[2] ),
        .I4(\cnt_t_3[4]_i_11__0_n_0 ),
        .O(\cnt_t_3[4]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFCABFCABFCABFCBB)) 
    \cnt_t_3[4]_i_4__1 
       (.I0(\cnt_t_3[4]_i_12__0_n_0 ),
        .I1(\n1q_m_2_reg_n_0_[3] ),
        .I2(\n1q_m_2_reg_n_0_[2] ),
        .I3(\cnt_t_3_reg_n_0_[4] ),
        .I4(\n1q_m_2_reg_n_0_[1] ),
        .I5(\n1q_m_2_reg_n_0_[0] ),
        .O(\cnt_t_3[4]_i_4__1_n_0 ));
  LUT5 #(
    .INIT(32'h8EFF008E)) 
    \cnt_t_3[4]_i_5__0 
       (.I0(\cnt_t_3_reg_n_0_[2] ),
        .I1(\cnt_t_3[4]_i_11__0_n_0 ),
        .I2(\cnt_t_3[4]_i_13__0_n_0 ),
        .I3(\cnt_t_3[4]_i_9__1_n_0 ),
        .I4(\cnt_t_3_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'h04550404)) 
    \cnt_t_3[4]_i_6__1 
       (.I0(p_0_in),
        .I1(\cnt_t_3[4]_i_12__0_n_0 ),
        .I2(\cnt_t_3_reg_n_0_[4] ),
        .I3(\cnt_t_3[4]_i_14__0_n_0 ),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h00007F077F07FFFF)) 
    \cnt_t_3[4]_i_7__1 
       (.I0(\cnt_t_3[2]_i_3__1_n_0 ),
        .I1(\cnt_t_3_reg_n_0_[1] ),
        .I2(\cnt_t_3_reg_n_0_[2] ),
        .I3(\cnt_t_3[4]_i_11__0_n_0 ),
        .I4(\cnt_t_3_reg_n_0_[3] ),
        .I5(\cnt_t_3[4]_i_9__1_n_0 ),
        .O(\cnt_t_3[4]_i_7__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hA2FB)) 
    \cnt_t_3[4]_i_8 
       (.I0(\n0q_m_2_reg_n_0_[2] ),
        .I1(\n1q_m_2_reg_n_0_[1] ),
        .I2(\n0q_m_2_reg_n_0_[1] ),
        .I3(\n1q_m_2_reg_n_0_[2] ),
        .O(\cnt_t_3[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h66A655659959AA9A)) 
    \cnt_t_3[4]_i_9__1 
       (.I0(\n1q_m_2_reg_n_0_[3] ),
        .I1(\n0q_m_2_reg_n_0_[2] ),
        .I2(\n1q_m_2_reg_n_0_[1] ),
        .I3(\n0q_m_2_reg_n_0_[1] ),
        .I4(\n1q_m_2_reg_n_0_[2] ),
        .I5(\n0q_m_2_reg_n_0_[3] ),
        .O(\cnt_t_3[4]_i_9__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[1]),
        .Q(\cnt_t_3_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[2]),
        .Q(\cnt_t_3_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[3]),
        .Q(\cnt_t_3_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_t_3_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(cnt_t_2[4]),
        .Q(\cnt_t_3_reg_n_0_[4] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h6696696669669969)) 
    \n0q_m_2[1]_i_1__1 
       (.I0(\n1q_m_2[3]_i_2__1_n_0 ),
        .I1(\n1q_m_2[3]_i_3__1_n_0 ),
        .I2(\n1q_m_2[3]_i_4__1_n_0 ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\n1q_m_2[3]_i_6__1_n_0 ),
        .I5(\n1q_m_2[3]_i_5__1_n_0 ),
        .O(\n0q_m_2[1]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hEF8EF7FF0800EF8E)) 
    \n0q_m_2[2]_i_1__1 
       (.I0(\n1q_m_2[3]_i_5__1_n_0 ),
        .I1(\n1q_m_2[3]_i_6__1_n_0 ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(\n1q_m_2[3]_i_4__1_n_0 ),
        .I4(\n1q_m_2[3]_i_3__1_n_0 ),
        .I5(\n1q_m_2[3]_i_2__1_n_0 ),
        .O(\n0q_m_2[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    \n0q_m_2[3]_i_1__1 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\n1q_m_2[3]_i_6__1_n_0 ),
        .I2(\n1q_m_2[3]_i_5__1_n_0 ),
        .I3(\n1q_m_2[3]_i_4__1_n_0 ),
        .I4(\n1q_m_2[3]_i_3__1_n_0 ),
        .I5(\n1q_m_2[3]_i_2__1_n_0 ),
        .O(\n0q_m_2[3]_i_1__1_n_0 ));
  FDRE \n0q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[1]_i_1__1_n_0 ),
        .Q(\n0q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n0q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[2]_i_1__1_n_0 ),
        .Q(\n0q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n0q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n0q_m_2[3]_i_1__1_n_0 ),
        .Q(\n0q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \n1d_1[0]_i_1 
       (.I0(vid_pData[7]),
        .I1(vid_pData[0]),
        .I2(\n1d_1[0]_i_2_n_0 ),
        .I3(vid_pData[5]),
        .I4(vid_pData[6]),
        .I5(vid_pData[4]),
        .O(\n1d_1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \n1d_1[0]_i_2 
       (.I0(vid_pData[1]),
        .I1(vid_pData[3]),
        .I2(vid_pData[2]),
        .O(\n1d_1[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \n1d_1[1]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[1]_i_2_n_0 ),
        .I2(\n1d_1[3]_i_3_n_0 ),
        .O(\n1d_1[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
    \n1d_1[1]_i_2 
       (.I0(vid_pData[4]),
        .I1(vid_pData[5]),
        .I2(vid_pData[6]),
        .I3(vid_pData[1]),
        .I4(vid_pData[2]),
        .I5(vid_pData[3]),
        .O(\n1d_1[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7E7E7EE87EE8E8E8)) 
    \n1d_1[2]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[3]_i_3_n_0 ),
        .I2(\n1d_1[2]_i_2_n_0 ),
        .I3(vid_pData[3]),
        .I4(vid_pData[2]),
        .I5(vid_pData[1]),
        .O(\n1d_1[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \n1d_1[2]_i_2 
       (.I0(vid_pData[6]),
        .I1(vid_pData[5]),
        .I2(vid_pData[4]),
        .O(\n1d_1[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880800000000000)) 
    \n1d_1[3]_i_1 
       (.I0(\n1d_1[3]_i_2_n_0 ),
        .I1(\n1d_1[3]_i_3_n_0 ),
        .I2(vid_pData[4]),
        .I3(vid_pData[5]),
        .I4(vid_pData[6]),
        .I5(\n1d_1[3]_i_4_n_0 ),
        .O(\n1d_1[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9600009600969600)) 
    \n1d_1[3]_i_2 
       (.I0(vid_pData[5]),
        .I1(vid_pData[6]),
        .I2(vid_pData[4]),
        .I3(vid_pData[7]),
        .I4(vid_pData[0]),
        .I5(\n1d_1[0]_i_2_n_0 ),
        .O(\n1d_1[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hE88E8EE8)) 
    \n1d_1[3]_i_3 
       (.I0(vid_pData[0]),
        .I1(vid_pData[7]),
        .I2(vid_pData[2]),
        .I3(vid_pData[3]),
        .I4(vid_pData[1]),
        .O(\n1d_1[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \n1d_1[3]_i_4 
       (.I0(vid_pData[3]),
        .I1(vid_pData[2]),
        .I2(vid_pData[1]),
        .O(\n1d_1[3]_i_4_n_0 ));
  FDRE \n1d_1_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[0]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \n1d_1_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[1]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n1d_1_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[2]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n1d_1_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1d_1[3]_i_1_n_0 ),
        .Q(\n1d_1_reg_n_0_[3] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \n1q_m_2[0]_i_1__1 
       (.I0(\n1q_m_2[3]_i_5__1_n_0 ),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(p_0_in2_in),
        .I3(\n1q_m_2[3]_i_4__1_n_0 ),
        .O(\n1q_m_2[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h96C33C963C96693C)) 
    \n1q_m_2[1]_i_1__1 
       (.I0(\n1q_m_2[3]_i_4__1_n_0 ),
        .I1(\n1q_m_2[3]_i_3__1_n_0 ),
        .I2(\n1q_m_2[3]_i_2__1_n_0 ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\n1q_m_2[3]_i_5__1_n_0 ),
        .I5(\n1q_m_2[3]_i_6__1_n_0 ),
        .O(\n1q_m_2[1]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h2BBFFFFD00022BBF)) 
    \n1q_m_2[2]_i_1__1 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\n1q_m_2[3]_i_5__1_n_0 ),
        .I2(\n1q_m_2[3]_i_6__1_n_0 ),
        .I3(\n1q_m_2[3]_i_4__1_n_0 ),
        .I4(\n1q_m_2[3]_i_2__1_n_0 ),
        .I5(\n1q_m_2[3]_i_3__1_n_0 ),
        .O(\n1q_m_2[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    \n1q_m_2[3]_i_1__1 
       (.I0(\n1q_m_2[3]_i_2__1_n_0 ),
        .I1(\n1q_m_2[3]_i_3__1_n_0 ),
        .I2(\n1q_m_2[3]_i_4__1_n_0 ),
        .I3(\n1q_m_2[3]_i_5__1_n_0 ),
        .I4(\n1q_m_2[3]_i_6__1_n_0 ),
        .I5(\pDataOut_1_reg_n_0_[0] ),
        .O(\n1q_m_2[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h96C33C96)) 
    \n1q_m_2[3]_i_2__1 
       (.I0(p_0_in2_in),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(p_0_in0_in),
        .I4(\q_m_2[8]_i_1__1_n_0 ),
        .O(\n1q_m_2[3]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h3693)) 
    \n1q_m_2[3]_i_3__1 
       (.I0(p_0_in6_in),
        .I1(\q_m_2[7]_i_2__1_n_0 ),
        .I2(\q_m_2[8]_i_1__1_n_0 ),
        .I3(p_0_in8_in),
        .O(\n1q_m_2[3]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \n1q_m_2[3]_i_4__1 
       (.I0(\q_m_2[7]_i_2__1_n_0 ),
        .I1(\q_m_2[8]_i_1__1_n_0 ),
        .I2(p_0_in8_in),
        .O(\n1q_m_2[3]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \n1q_m_2[3]_i_5__1 
       (.I0(p_0_in6_in),
        .I1(\q_m_2[7]_i_2__1_n_0 ),
        .I2(\q_m_2[8]_i_1__1_n_0 ),
        .I3(p_0_in10_in),
        .I4(p_0_in8_in),
        .O(\n1q_m_2[3]_i_5__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \n1q_m_2[3]_i_6__1 
       (.I0(p_0_in2_in),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .O(\n1q_m_2[3]_i_6__1_n_0 ));
  FDRE \n1q_m_2_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[0]_i_1__1_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[1]_i_1__1_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[2]_i_1__1_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \n1q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\n1q_m_2[3]_i_1__1_n_0 ),
        .Q(\n1q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[0]_i_1__0 
       (.I0(\pDataOutRaw[9]_i_2__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[0] ),
        .O(\pDataOutRaw[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[1]_i_1__0 
       (.I0(\pDataOutRaw[9]_i_2__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[1] ),
        .O(\pDataOutRaw[1]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h39)) 
    \pDataOutRaw[2]_i_1__1 
       (.I0(\cnt_t_3[4]_i_4__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[2] ),
        .I2(\cnt_t_3[4]_i_6__1_n_0 ),
        .O(\pDataOutRaw[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[3]_i_1__0 
       (.I0(\pDataOutRaw[9]_i_2__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[3] ),
        .O(\pDataOutRaw[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h39)) 
    \pDataOutRaw[4]_i_1__1 
       (.I0(\cnt_t_3[4]_i_4__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[4] ),
        .I2(\cnt_t_3[4]_i_6__1_n_0 ),
        .O(\pDataOutRaw[4]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[5]_i_1__0 
       (.I0(\pDataOutRaw[9]_i_2__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[5] ),
        .O(\pDataOutRaw[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h39)) 
    \pDataOutRaw[6]_i_1__1 
       (.I0(\cnt_t_3[4]_i_4__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[6] ),
        .I2(\cnt_t_3[4]_i_6__1_n_0 ),
        .O(\pDataOutRaw[6]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \pDataOutRaw[7]_i_1__0 
       (.I0(\pDataOutRaw[9]_i_2__1_n_0 ),
        .I1(\q_m_2_reg_n_0_[7] ),
        .O(\pDataOutRaw[7]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \pDataOutRaw[9]_i_1__1 
       (.I0(\pDataOutRaw[9]_i_2__1_n_0 ),
        .O(\pDataOutRaw[9]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hEEFFEE1FE200E213)) 
    \pDataOutRaw[9]_i_2__1 
       (.I0(\n1q_m_2_reg_n_0_[3] ),
        .I1(\n1q_m_2_reg_n_0_[2] ),
        .I2(\cnt_t_3[4]_i_14__0_n_0 ),
        .I3(\cnt_t_3_reg_n_0_[4] ),
        .I4(\cnt_t_3[4]_i_12__0_n_0 ),
        .I5(p_0_in),
        .O(\pDataOutRaw[9]_i_2__1_n_0 ));
  FDRE \pDataOutRaw_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[0]_i_1__0_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[0] ),
        .R(SR));
  FDRE \pDataOutRaw_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[1]_i_1__0_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[1] ),
        .R(SR));
  FDSE \pDataOutRaw_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[2]_i_1__1_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[2] ),
        .S(SR));
  FDRE \pDataOutRaw_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[3]_i_1__0_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[3] ),
        .R(SR));
  FDSE \pDataOutRaw_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[4]_i_1__1_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[4] ),
        .S(SR));
  FDRE \pDataOutRaw_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[5]_i_1__0_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[5] ),
        .R(SR));
  FDSE \pDataOutRaw_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[6]_i_1__1_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[6] ),
        .S(SR));
  FDRE \pDataOutRaw_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[7]_i_1__0_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[7] ),
        .R(SR));
  FDSE \pDataOutRaw_reg[8] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(\pDataOutRaw_reg_n_0_[8] ),
        .S(SR));
  FDSE \pDataOutRaw_reg[9] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOutRaw[9]_i_1__1_n_0 ),
        .Q(\pDataOutRaw_reg_n_0_[9] ),
        .S(SR));
  FDRE \pDataOut_1_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[0]),
        .Q(\pDataOut_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \pDataOut_1_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[1]),
        .Q(\pDataOut_1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \pDataOut_1_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[2]),
        .Q(p_0_in0_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[3]),
        .Q(p_0_in2_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[4]),
        .Q(p_0_in4_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[5]),
        .Q(p_0_in6_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[6]),
        .Q(p_0_in8_in),
        .R(1'b0));
  FDRE \pDataOut_1_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(vid_pData[7]),
        .Q(p_0_in10_in),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAA55AA5599669566)) 
    \q_m_2[1]_i_1__1 
       (.I0(\pDataOut_1_reg_n_0_[1] ),
        .I1(\n1d_1_reg_n_0_[2] ),
        .I2(\n1d_1_reg_n_0_[0] ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(\n1d_1_reg_n_0_[1] ),
        .I5(\n1d_1_reg_n_0_[3] ),
        .O(\q_m_2[1]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \q_m_2[2]_i_1__1 
       (.I0(\pDataOut_1_reg_n_0_[0] ),
        .I1(\pDataOut_1_reg_n_0_[1] ),
        .I2(p_0_in0_in),
        .O(\q_m_2[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \q_m_2[3]_i_1__1 
       (.I0(\q_m_2[8]_i_1__1_n_0 ),
        .I1(p_0_in0_in),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(p_0_in2_in),
        .O(\q_m_2[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \q_m_2[4]_i_1__1 
       (.I0(p_0_in2_in),
        .I1(\pDataOut_1_reg_n_0_[0] ),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(p_0_in0_in),
        .I4(p_0_in4_in),
        .O(\q_m_2[4]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \q_m_2[5]_i_1__1 
       (.I0(\q_m_2[8]_i_1__1_n_0 ),
        .I1(\q_m_2[7]_i_2__1_n_0 ),
        .I2(p_0_in6_in),
        .O(\q_m_2[5]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \q_m_2[6]_i_1__1 
       (.I0(p_0_in8_in),
        .I1(\q_m_2[7]_i_2__1_n_0 ),
        .I2(p_0_in6_in),
        .O(\q_m_2[6]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \q_m_2[7]_i_1__1 
       (.I0(\q_m_2[8]_i_1__1_n_0 ),
        .I1(\q_m_2[7]_i_2__1_n_0 ),
        .I2(p_0_in6_in),
        .I3(p_0_in10_in),
        .I4(p_0_in8_in),
        .O(\q_m_2[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \q_m_2[7]_i_2__1 
       (.I0(p_0_in4_in),
        .I1(p_0_in0_in),
        .I2(\pDataOut_1_reg_n_0_[1] ),
        .I3(\pDataOut_1_reg_n_0_[0] ),
        .I4(p_0_in2_in),
        .O(\q_m_2[7]_i_2__1_n_0 ));
  LUT5 #(
    .INIT(32'h00105555)) 
    \q_m_2[8]_i_1__1 
       (.I0(\n1d_1_reg_n_0_[3] ),
        .I1(\n1d_1_reg_n_0_[1] ),
        .I2(\pDataOut_1_reg_n_0_[0] ),
        .I3(\n1d_1_reg_n_0_[0] ),
        .I4(\n1d_1_reg_n_0_[2] ),
        .O(\q_m_2[8]_i_1__1_n_0 ));
  FDRE \q_m_2_reg[0] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\pDataOut_1_reg_n_0_[0] ),
        .Q(\q_m_2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \q_m_2_reg[1] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[1]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \q_m_2_reg[2] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[2]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \q_m_2_reg[3] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[3]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \q_m_2_reg[4] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[4]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \q_m_2_reg[5] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[5]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \q_m_2_reg[6] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[6]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \q_m_2_reg[7] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[7]_i_1__1_n_0 ),
        .Q(\q_m_2_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \q_m_2_reg[8] 
       (.C(PixelClk),
        .CE(1'b1),
        .D(\q_m_2[8]_i_1__1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "gener4_rgb2dvi_0_0,rgb2dvi,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "rgb2dvi,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (TMDS_Clk_p,
    TMDS_Clk_n,
    TMDS_Data_p,
    TMDS_Data_n,
    aRst_n,
    vid_pData,
    vid_pVDE,
    vid_pHSync,
    vid_pVSync,
    PixelClk);
  (* x_interface_info = "digilentinc.com:interface:tmds:1.0 TMDS CLK_P, xilinx.com:signal:clock:1.0 TMDS_Clk_p CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME TMDS, BOARD.ASSOCIATED_PARAM TMDS_BOARD_INTERFACE, XIL_INTERFACENAME TMDS_Clk_p, FREQ_HZ 100000000, PHASE 0.000" *) output TMDS_Clk_p;
  (* x_interface_info = "digilentinc.com:interface:tmds:1.0 TMDS CLK_N, xilinx.com:signal:clock:1.0 TMDS_Clk_n CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME TMDS_Clk_n, ASSOCIATED_RESET aRst_n, FREQ_HZ 100000000, PHASE 0.000" *) output TMDS_Clk_n;
  (* x_interface_info = "digilentinc.com:interface:tmds:1.0 TMDS DATA_P" *) output [2:0]TMDS_Data_p;
  (* x_interface_info = "digilentinc.com:interface:tmds:1.0 TMDS DATA_N" *) output [2:0]TMDS_Data_n;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AsyncRst_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME AsyncRst_n, POLARITY ACTIVE_LOW" *) input aRst_n;
  (* x_interface_info = "xilinx.com:interface:vid_io:1.0 RGB DATA" *) input [23:0]vid_pData;
  (* x_interface_info = "xilinx.com:interface:vid_io:1.0 RGB ACTIVE_VIDEO" *) input vid_pVDE;
  (* x_interface_info = "xilinx.com:interface:vid_io:1.0 RGB HSYNC" *) input vid_pHSync;
  (* x_interface_info = "xilinx.com:interface:vid_io:1.0 RGB VSYNC" *) input vid_pVSync;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 PixelClk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME PixelClk, FREQ_HZ 40000000, PHASE 0.000, CLK_DOMAIN gener4_processing_system7_0_0_FCLK_CLK0" *) input PixelClk;

  wire PixelClk;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "SLOW" *) wire TMDS_Clk_n;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "SLOW" *) wire TMDS_Clk_p;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "SLOW" *) wire [2:0]TMDS_Data_n;
  (* IOSTANDARD = "TMDS_33" *) (* SLEW = "SLOW" *) wire [2:0]TMDS_Data_p;
  wire aRst_n;
  wire [23:0]vid_pData;
  wire vid_pHSync;
  wire vid_pVDE;
  wire vid_pVSync;

  (* kClkPrimitive = "PLL" *) 
  (* kClkRange = "3" *) 
  (* kClkSwap = "TRUE" *) 
  (* kD0Swap = "TRUE" *) 
  (* kD1Swap = "FALSE" *) 
  (* kD2Swap = "TRUE" *) 
  (* kGenerateSerialClk = "TRUE" *) 
  (* kRstActiveHigh = "FALSE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rgb2dvi U0
       (.PixelClk(PixelClk),
        .SerialClk(1'b0),
        .TMDS_Clk_n(TMDS_Clk_n),
        .TMDS_Clk_p(TMDS_Clk_p),
        .TMDS_Data_n(TMDS_Data_n),
        .TMDS_Data_p(TMDS_Data_p),
        .aRst(1'b0),
        .aRst_n(aRst_n),
        .vid_pData(vid_pData),
        .vid_pHSync(vid_pHSync),
        .vid_pVDE(vid_pVDE),
        .vid_pVSync(vid_pVSync));
endmodule

(* kClkPrimitive = "PLL" *) (* kClkRange = "3" *) (* kClkSwap = "TRUE" *) 
(* kD0Swap = "TRUE" *) (* kD1Swap = "FALSE" *) (* kD2Swap = "TRUE" *) 
(* kGenerateSerialClk = "TRUE" *) (* kRstActiveHigh = "FALSE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rgb2dvi
   (TMDS_Clk_p,
    TMDS_Clk_n,
    TMDS_Data_p,
    TMDS_Data_n,
    aRst,
    aRst_n,
    vid_pData,
    vid_pVDE,
    vid_pHSync,
    vid_pVSync,
    PixelClk,
    SerialClk);
  output TMDS_Clk_p;
  output TMDS_Clk_n;
  output [2:0]TMDS_Data_p;
  output [2:0]TMDS_Data_n;
  input aRst;
  input aRst_n;
  input [23:0]vid_pData;
  input vid_pVDE;
  input vid_pHSync;
  input vid_pVSync;
  input PixelClk;
  input SerialClk;

  wire PixelClk;
  wire PixelClkIO;
  wire SerialClkIO;
  wire TMDS_Clk_n;
  wire TMDS_Clk_p;
  wire [2:0]TMDS_Data_n;
  wire [2:0]TMDS_Data_p;
  wire aRstLck;
  wire aRst_n;
  wire [9:0]\pDataOutRaw[1] ;
  wire [9:0]\pDataOutRaw_q[0] ;
  wire [9:0]\pDataOutRaw_q[2] ;
  wire pRstLck;
  wire p_1_in;
  wire [23:0]vid_pData;
  wire vid_pHSync;
  wire vid_pVDE;
  wire vid_pVSync;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockGen \ClockGenInternal.ClockGenX 
       (.PixelClk(PixelClkIO),
        .PixelClk_0(PixelClk),
        .SerialClk(SerialClkIO),
        .aRst_n(aRst_n),
        .in0(aRstLck));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES ClockSerializer
       (.PixelClk(PixelClkIO),
        .SerialClk(SerialClkIO),
        .TMDS_Clk_n(TMDS_Clk_n),
        .TMDS_Clk_p(TMDS_Clk_p),
        .aRst(pRstLck));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_TMDS_Encoder \DataEncoders[0].DataEncoder 
       (.PixelClk(PixelClk),
        .SR(p_1_in),
        .pDataOut(\pDataOutRaw_q[0] ),
        .vid_pData(vid_pData[15:8]),
        .vid_pHSync(vid_pHSync),
        .vid_pVDE(vid_pVDE),
        .vid_pVSync(vid_pVSync));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES_0 \DataEncoders[0].DataSerializer 
       (.PixelClk(PixelClkIO),
        .SerialClk(SerialClkIO),
        .TMDS_Data_n(TMDS_Data_n[0]),
        .TMDS_Data_p(TMDS_Data_p[0]),
        .aRst(pRstLck),
        .pDataOut(\pDataOutRaw_q[0] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_TMDS_Encoder_1 \DataEncoders[1].DataEncoder 
       (.PixelClk(PixelClk),
        .Q(\pDataOutRaw[1] ),
        .SR(p_1_in),
        .vid_pData(vid_pData[7:0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES_2 \DataEncoders[1].DataSerializer 
       (.PixelClk(PixelClkIO),
        .SerialClk(SerialClkIO),
        .TMDS_Data_n(TMDS_Data_n[1]),
        .TMDS_Data_p(TMDS_Data_p[1]),
        .out(pRstLck),
        .pDataOut(\pDataOutRaw[1] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_TMDS_Encoder_3 \DataEncoders[2].DataEncoder 
       (.PixelClk(PixelClk),
        .SR(p_1_in),
        .pDataOut(\pDataOutRaw_q[2] ),
        .vid_pData(vid_pData[23:16]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_OutputSERDES_4 \DataEncoders[2].DataSerializer 
       (.PixelClk(PixelClkIO),
        .SerialClk(SerialClkIO),
        .TMDS_Data_n(TMDS_Data_n[2]),
        .TMDS_Data_p(TMDS_Data_p[2]),
        .out(pRstLck),
        .pDataOut(\pDataOutRaw_q[2] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ResetBridge LockLostReset
       (.PixelClk(PixelClk),
        .in0(aRstLck),
        .out(pRstLck));
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