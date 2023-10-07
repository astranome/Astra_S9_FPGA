// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gener4_v_tpg_0_0_tpgPatternDPColorSqu (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ap_ce,
        y,
        x,
        color,
        dpDynamicRange,
        dpYUVCoef,
        ap_return_0,
        ap_return_1,
        ap_return_2
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   ap_ce;
input  [15:0] y;
input  [15:0] x;
input  [7:0] color;
input  [7:0] dpDynamicRange;
input  [7:0] dpYUVCoef;
output  [7:0] ap_return_0;
output  [7:0] ap_return_1;
output  [7:0] ap_return_2;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] vBarSel_1;
reg   [5:0] yCount_V_4;
reg   [2:0] hBarSel_5_0;
wire   [3:0] DPtpgBarArray_address0;
reg    DPtpgBarArray_ce0;
wire   [2:0] DPtpgBarArray_q0;
wire   [2:0] DPtpgBarSelRgb_VESA_5_address0;
reg    DPtpgBarSelRgb_VESA_5_ce0;
wire   [0:0] DPtpgBarSelRgb_VESA_5_q0;
wire   [2:0] DPtpgBarSelRgb_VESA_4_address0;
reg    DPtpgBarSelRgb_VESA_4_ce0;
wire   [0:0] DPtpgBarSelRgb_VESA_4_q0;
wire   [2:0] DPtpgBarSelRgb_VESA_1_address0;
reg    DPtpgBarSelRgb_VESA_1_ce0;
wire   [0:0] DPtpgBarSelRgb_VESA_1_q0;
wire   [2:0] DPtpgBarSelRgb_CEA_r_address0;
reg    DPtpgBarSelRgb_CEA_r_ce0;
wire   [5:0] DPtpgBarSelRgb_CEA_r_q0;
wire   [2:0] DPtpgBarSelRgb_CEA_g_address0;
reg    DPtpgBarSelRgb_CEA_g_ce0;
wire   [5:0] DPtpgBarSelRgb_CEA_g_q0;
wire   [2:0] DPtpgBarSelRgb_CEA_b_address0;
reg    DPtpgBarSelRgb_CEA_b_ce0;
wire   [5:0] DPtpgBarSelRgb_CEA_b_q0;
wire   [2:0] DPtpgBarSelYuv_601_y_address0;
reg    DPtpgBarSelYuv_601_y_ce0;
wire   [7:0] DPtpgBarSelYuv_601_y_q0;
wire   [2:0] DPtpgBarSelYuv_709_y_address0;
reg    DPtpgBarSelYuv_709_y_ce0;
wire   [7:0] DPtpgBarSelYuv_709_y_q0;
wire   [2:0] DPtpgBarSelYuv_601_u_address0;
reg    DPtpgBarSelYuv_601_u_ce0;
wire   [7:0] DPtpgBarSelYuv_601_u_q0;
wire   [2:0] DPtpgBarSelYuv_601_v_address0;
reg    DPtpgBarSelYuv_601_v_ce0;
wire   [7:0] DPtpgBarSelYuv_601_v_q0;
wire   [2:0] DPtpgBarSelYuv_709_u_address0;
reg    DPtpgBarSelYuv_709_u_ce0;
wire   [7:0] DPtpgBarSelYuv_709_u_q0;
wire   [2:0] DPtpgBarSelYuv_709_v_address0;
reg    DPtpgBarSelYuv_709_v_ce0;
wire   [7:0] DPtpgBarSelYuv_709_v_q0;
reg   [9:0] xCount_V_2_0;
wire   [0:0] brmerge_fu_498_p2;
reg   [0:0] brmerge_reg_713;
reg   [0:0] brmerge_reg_713_pp0_iter1_reg;
wire   [0:0] tmp_32_fu_510_p2;
wire   [0:0] sel_tmp3_fu_522_p2;
wire   [0:0] sel_tmp6_fu_534_p2;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_vBarSel_3_loc_2_phi_fu_275_p8;
wire   [0:0] ap_phi_reg_pp0_iter0_vBarSel_3_loc_2_reg_272;
wire   [0:0] tmp_55_fu_310_p2;
wire   [0:0] or_cond_26_fu_338_p2;
wire   [0:0] tmp_60_fu_344_p2;
wire   [0:0] tmp_57_fu_332_p2;
reg   [2:0] ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6;
wire   [2:0] ap_phi_reg_pp0_iter0_hBarSel_5_0_loc_reg_286;
wire   [0:0] tmp_61_fu_375_p2;
wire   [0:0] tmp_73_fu_412_p2;
wire   [2:0] tmp_76_fu_430_p2;
wire   [63:0] tmp_77_fu_487_p1;
wire   [63:0] tmp_78_fu_540_p1;
wire   [5:0] tmp_58_fu_357_p2;
wire   [9:0] tmp_75_fu_418_p2;
wire   [9:0] tmp_74_fu_443_p2;
wire   [15:0] tmp_s_fu_304_p2;
wire   [0:0] tmp_56_fu_326_p2;
wire   [3:0] tmp_fu_467_p3;
wire   [7:0] tmp_cast_fu_475_p1;
wire   [10:0] tmp_48_fu_479_p3;
wire   [0:0] tmp_83_fu_399_p1;
wire   [0:0] tmp_66_fu_393_p2;
wire   [0:0] tmp_67_cast_not_fu_492_p2;
wire   [7:0] tmp_31_fu_504_p2;
wire   [0:0] tmp_63_fu_381_p2;
wire   [0:0] sel_tmp2_fu_516_p2;
wire   [0:0] tmp_65_fu_387_p2;
wire   [0:0] sel_tmp5_fu_528_p2;
wire   [7:0] DPtpgBarSelRgb_VESA_12_fu_564_p3;
wire   [7:0] val_assign_1_fu_599_p3;
wire  signed [7:0] DPtpgBarSelRgb_CEA_g_5_fu_584_p1;
wire   [7:0] sel_tmp1_fu_606_p3;
wire   [7:0] val_assign_s_fu_592_p3;
wire   [7:0] sel_tmp4_fu_613_p3;
wire  signed [7:0] DPtpgBarSelRgb_CEA_r_5_fu_580_p1;
wire   [7:0] DPtpgBarSelRgb_VESA_9_fu_556_p3;
wire   [0:0] or_cond_fu_634_p2;
wire   [7:0] newSel_fu_627_p3;
wire   [7:0] newSel1_fu_638_p3;
wire  signed [7:0] DPtpgBarSelRgb_CEA_b_5_fu_588_p1;
wire   [7:0] DPtpgBarSelRgb_VESA_2_fu_572_p3;
wire   [7:0] newSel3_fu_653_p3;
wire   [7:0] newSel4_fu_660_p3;
wire   [7:0] Scalar_val_0_V_writ_fu_645_p3;
wire   [7:0] Scalar_val_1_V_writ_fu_620_p3;
wire   [7:0] Scalar_val_2_V_writ_fu_667_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_25;
reg    ap_condition_52;
reg    ap_condition_255;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 vBarSel_1 = 1'd0;
#0 yCount_V_4 = 6'd0;
#0 hBarSel_5_0 = 3'd0;
#0 xCount_V_2_0 = 10'd0;
end

gener4_v_tpg_0_0_tpgPatternDPColorbkb #(
    .DataWidth( 3 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
DPtpgBarArray_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarArray_address0),
    .ce0(DPtpgBarArray_ce0),
    .q0(DPtpgBarArray_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorcud #(
    .DataWidth( 1 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelRgb_VESA_5_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelRgb_VESA_5_address0),
    .ce0(DPtpgBarSelRgb_VESA_5_ce0),
    .q0(DPtpgBarSelRgb_VESA_5_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColordEe #(
    .DataWidth( 1 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelRgb_VESA_4_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelRgb_VESA_4_address0),
    .ce0(DPtpgBarSelRgb_VESA_4_ce0),
    .q0(DPtpgBarSelRgb_VESA_4_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColoreOg #(
    .DataWidth( 1 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelRgb_VESA_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelRgb_VESA_1_address0),
    .ce0(DPtpgBarSelRgb_VESA_1_ce0),
    .q0(DPtpgBarSelRgb_VESA_1_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorfYi #(
    .DataWidth( 6 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelRgb_CEA_r_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelRgb_CEA_r_address0),
    .ce0(DPtpgBarSelRgb_CEA_r_ce0),
    .q0(DPtpgBarSelRgb_CEA_r_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorg8j #(
    .DataWidth( 6 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelRgb_CEA_g_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelRgb_CEA_g_address0),
    .ce0(DPtpgBarSelRgb_CEA_g_ce0),
    .q0(DPtpgBarSelRgb_CEA_g_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorhbi #(
    .DataWidth( 6 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelRgb_CEA_b_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelRgb_CEA_b_address0),
    .ce0(DPtpgBarSelRgb_CEA_b_ce0),
    .q0(DPtpgBarSelRgb_CEA_b_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColoribs #(
    .DataWidth( 8 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelYuv_601_y_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelYuv_601_y_address0),
    .ce0(DPtpgBarSelYuv_601_y_ce0),
    .q0(DPtpgBarSelYuv_601_y_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorjbC #(
    .DataWidth( 8 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelYuv_709_y_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelYuv_709_y_address0),
    .ce0(DPtpgBarSelYuv_709_y_ce0),
    .q0(DPtpgBarSelYuv_709_y_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorkbM #(
    .DataWidth( 8 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelYuv_601_u_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelYuv_601_u_address0),
    .ce0(DPtpgBarSelYuv_601_u_ce0),
    .q0(DPtpgBarSelYuv_601_u_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorlbW #(
    .DataWidth( 8 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelYuv_601_v_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelYuv_601_v_address0),
    .ce0(DPtpgBarSelYuv_601_v_ce0),
    .q0(DPtpgBarSelYuv_601_v_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColormb6 #(
    .DataWidth( 8 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelYuv_709_u_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelYuv_709_u_address0),
    .ce0(DPtpgBarSelYuv_709_u_ce0),
    .q0(DPtpgBarSelYuv_709_u_q0)
);

gener4_v_tpg_0_0_tpgPatternDPColorncg #(
    .DataWidth( 8 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
DPtpgBarSelYuv_709_v_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(DPtpgBarSelYuv_709_v_address0),
    .ce0(DPtpgBarSelYuv_709_v_ce0),
    .q0(DPtpgBarSelYuv_709_v_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_52)) begin
        if ((tmp_61_fu_375_p2 == 1'd1)) begin
            hBarSel_5_0 <= 3'd0;
        end else if (((tmp_73_fu_412_p2 == 1'd0) & (tmp_61_fu_375_p2 == 1'd0))) begin
            hBarSel_5_0 <= tmp_76_fu_430_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_52)) begin
        if ((tmp_55_fu_310_p2 == 1'd1)) begin
            vBarSel_1 <= 1'd0;
        end else if ((1'b1 == ap_condition_255)) begin
            vBarSel_1 <= tmp_60_fu_344_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_52)) begin
        if ((tmp_61_fu_375_p2 == 1'd1)) begin
            xCount_V_2_0 <= 10'd0;
        end else if (((tmp_61_fu_375_p2 == 1'd0) & (tmp_73_fu_412_p2 == 1'd1))) begin
            xCount_V_2_0 <= tmp_74_fu_443_p2;
        end else if (((tmp_73_fu_412_p2 == 1'd0) & (tmp_61_fu_375_p2 == 1'd0))) begin
            xCount_V_2_0 <= tmp_75_fu_418_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_55_fu_310_p2 == 1'd0) & (1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_cond_26_fu_338_p2 == 1'd1))) begin
        yCount_V_4 <= tmp_58_fu_357_p2;
    end else if ((((or_cond_26_fu_338_p2 == 1'd0) & (tmp_55_fu_310_p2 == 1'd0) & (1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_57_fu_332_p2 == 1'd1)) | ((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_55_fu_310_p2 == 1'd1)))) begin
        yCount_V_4 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        brmerge_reg_713 <= brmerge_fu_498_p2;
        brmerge_reg_713_pp0_iter1_reg <= brmerge_reg_713;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarArray_ce0 = 1'b1;
    end else begin
        DPtpgBarArray_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelRgb_CEA_b_ce0 = 1'b1;
    end else begin
        DPtpgBarSelRgb_CEA_b_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelRgb_CEA_g_ce0 = 1'b1;
    end else begin
        DPtpgBarSelRgb_CEA_g_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelRgb_CEA_r_ce0 = 1'b1;
    end else begin
        DPtpgBarSelRgb_CEA_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelRgb_VESA_1_ce0 = 1'b1;
    end else begin
        DPtpgBarSelRgb_VESA_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelRgb_VESA_4_ce0 = 1'b1;
    end else begin
        DPtpgBarSelRgb_VESA_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelRgb_VESA_5_ce0 = 1'b1;
    end else begin
        DPtpgBarSelRgb_VESA_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelYuv_601_u_ce0 = 1'b1;
    end else begin
        DPtpgBarSelYuv_601_u_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelYuv_601_v_ce0 = 1'b1;
    end else begin
        DPtpgBarSelYuv_601_v_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelYuv_601_y_ce0 = 1'b1;
    end else begin
        DPtpgBarSelYuv_601_y_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelYuv_709_u_ce0 = 1'b1;
    end else begin
        DPtpgBarSelYuv_709_u_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelYuv_709_v_ce0 = 1'b1;
    end else begin
        DPtpgBarSelYuv_709_v_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        DPtpgBarSelYuv_709_y_ce0 = 1'b1;
    end else begin
        DPtpgBarSelYuv_709_y_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to1 = 1'b1;
    end else begin
        ap_idle_pp0_0to1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_25)) begin
        if (((tmp_73_fu_412_p2 == 1'd0) & (tmp_61_fu_375_p2 == 1'd0))) begin
            ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6 = tmp_76_fu_430_p2;
        end else if (((tmp_61_fu_375_p2 == 1'd0) & (tmp_73_fu_412_p2 == 1'd1))) begin
            ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6 = hBarSel_5_0;
        end else if ((tmp_61_fu_375_p2 == 1'd1)) begin
            ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6 = 3'd0;
        end else begin
            ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6 = ap_phi_reg_pp0_iter0_hBarSel_5_0_loc_reg_286;
        end
    end else begin
        ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6 = ap_phi_reg_pp0_iter0_hBarSel_5_0_loc_reg_286;
    end
end

always @ (*) begin
    if (((or_cond_26_fu_338_p2 == 1'd0) & (tmp_55_fu_310_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_57_fu_332_p2 == 1'd1))) begin
        ap_phi_mux_vBarSel_3_loc_2_phi_fu_275_p8 = tmp_60_fu_344_p2;
    end else if ((((tmp_57_fu_332_p2 == 1'd0) & (or_cond_26_fu_338_p2 == 1'd0) & (tmp_55_fu_310_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((tmp_55_fu_310_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_cond_26_fu_338_p2 == 1'd1)))) begin
        ap_phi_mux_vBarSel_3_loc_2_phi_fu_275_p8 = vBarSel_1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_55_fu_310_p2 == 1'd1))) begin
        ap_phi_mux_vBarSel_3_loc_2_phi_fu_275_p8 = 1'd0;
    end else begin
        ap_phi_mux_vBarSel_3_loc_2_phi_fu_275_p8 = ap_phi_reg_pp0_iter0_vBarSel_3_loc_2_reg_272;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to1 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign DPtpgBarArray_address0 = tmp_77_fu_487_p1;

assign DPtpgBarSelRgb_CEA_b_5_fu_588_p1 = $signed(DPtpgBarSelRgb_CEA_b_q0);

assign DPtpgBarSelRgb_CEA_b_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelRgb_CEA_g_5_fu_584_p1 = $signed(DPtpgBarSelRgb_CEA_g_q0);

assign DPtpgBarSelRgb_CEA_g_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelRgb_CEA_r_5_fu_580_p1 = $signed(DPtpgBarSelRgb_CEA_r_q0);

assign DPtpgBarSelRgb_CEA_r_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelRgb_VESA_12_fu_564_p3 = ((DPtpgBarSelRgb_VESA_4_q0[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign DPtpgBarSelRgb_VESA_1_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelRgb_VESA_2_fu_572_p3 = ((DPtpgBarSelRgb_VESA_1_q0[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign DPtpgBarSelRgb_VESA_4_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelRgb_VESA_5_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelRgb_VESA_9_fu_556_p3 = ((DPtpgBarSelRgb_VESA_5_q0[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign DPtpgBarSelYuv_601_u_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelYuv_601_v_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelYuv_601_y_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelYuv_709_u_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelYuv_709_v_address0 = tmp_78_fu_540_p1;

assign DPtpgBarSelYuv_709_y_address0 = tmp_78_fu_540_p1;

assign Scalar_val_0_V_writ_fu_645_p3 = ((or_cond_fu_634_p2[0:0] === 1'b1) ? newSel_fu_627_p3 : newSel1_fu_638_p3);

assign Scalar_val_1_V_writ_fu_620_p3 = ((sel_tmp6_fu_534_p2[0:0] === 1'b1) ? val_assign_s_fu_592_p3 : sel_tmp4_fu_613_p3);

assign Scalar_val_2_V_writ_fu_667_p3 = ((or_cond_fu_634_p2[0:0] === 1'b1) ? newSel3_fu_653_p3 : newSel4_fu_660_p3);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_start == 1'b0) & (ap_start == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((1'b0 == ap_ce) | ((ap_start == 1'b0) & (ap_start == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start == 1'b0);
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_25 = ((1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_255 = ((or_cond_26_fu_338_p2 == 1'd0) & (tmp_55_fu_310_p2 == 1'd0) & (tmp_57_fu_332_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_52 = ((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_hBarSel_5_0_loc_reg_286 = 'bx;

assign ap_phi_reg_pp0_iter0_vBarSel_3_loc_2_reg_272 = 'bx;

assign ap_return_0 = Scalar_val_0_V_writ_fu_645_p3;

assign ap_return_1 = Scalar_val_1_V_writ_fu_620_p3;

assign ap_return_2 = Scalar_val_2_V_writ_fu_667_p3;

assign brmerge_fu_498_p2 = (tmp_67_cast_not_fu_492_p2 | tmp_66_fu_393_p2);

assign newSel1_fu_638_p3 = ((tmp_32_fu_510_p2[0:0] === 1'b1) ? DPtpgBarSelRgb_VESA_9_fu_556_p3 : DPtpgBarSelYuv_709_y_q0);

assign newSel3_fu_653_p3 = ((sel_tmp6_fu_534_p2[0:0] === 1'b1) ? DPtpgBarSelYuv_601_v_q0 : DPtpgBarSelRgb_CEA_b_5_fu_588_p1);

assign newSel4_fu_660_p3 = ((tmp_32_fu_510_p2[0:0] === 1'b1) ? DPtpgBarSelRgb_VESA_2_fu_572_p3 : DPtpgBarSelYuv_709_v_q0);

assign newSel_fu_627_p3 = ((sel_tmp6_fu_534_p2[0:0] === 1'b1) ? DPtpgBarSelYuv_601_y_q0 : DPtpgBarSelRgb_CEA_r_5_fu_580_p1);

assign or_cond_26_fu_338_p2 = (tmp_57_fu_332_p2 & tmp_56_fu_326_p2);

assign or_cond_fu_634_p2 = (sel_tmp6_fu_534_p2 | sel_tmp3_fu_522_p2);

assign sel_tmp1_fu_606_p3 = ((tmp_32_fu_510_p2[0:0] === 1'b1) ? DPtpgBarSelRgb_VESA_12_fu_564_p3 : val_assign_1_fu_599_p3);

assign sel_tmp2_fu_516_p2 = ((dpDynamicRange != 8'd0) ? 1'b1 : 1'b0);

assign sel_tmp3_fu_522_p2 = (tmp_63_fu_381_p2 & sel_tmp2_fu_516_p2);

assign sel_tmp4_fu_613_p3 = ((sel_tmp3_fu_522_p2[0:0] === 1'b1) ? DPtpgBarSelRgb_CEA_g_5_fu_584_p1 : sel_tmp1_fu_606_p3);

assign sel_tmp5_fu_528_p2 = (tmp_63_fu_381_p2 ^ 1'd1);

assign sel_tmp6_fu_534_p2 = (tmp_65_fu_387_p2 & sel_tmp5_fu_528_p2);

assign tmp_31_fu_504_p2 = (dpDynamicRange | color);

assign tmp_32_fu_510_p2 = ((tmp_31_fu_504_p2 == 8'd0) ? 1'b1 : 1'b0);

assign tmp_48_fu_479_p3 = {{3'd0}, {tmp_cast_fu_475_p1}};

assign tmp_55_fu_310_p2 = ((tmp_s_fu_304_p2 == 16'd0) ? 1'b1 : 1'b0);

assign tmp_56_fu_326_p2 = ((yCount_V_4 != 6'd63) ? 1'b1 : 1'b0);

assign tmp_57_fu_332_p2 = ((x == 16'd0) ? 1'b1 : 1'b0);

assign tmp_58_fu_357_p2 = (yCount_V_4 + 6'd1);

assign tmp_60_fu_344_p2 = (vBarSel_1 ^ 1'd1);

assign tmp_61_fu_375_p2 = ((x == 16'd0) ? 1'b1 : 1'b0);

assign tmp_63_fu_381_p2 = ((color == 8'd0) ? 1'b1 : 1'b0);

assign tmp_65_fu_387_p2 = ((dpYUVCoef == 8'd0) ? 1'b1 : 1'b0);

assign tmp_66_fu_393_p2 = ((color == 8'd1) ? 1'b1 : 1'b0);

assign tmp_67_cast_not_fu_492_p2 = (tmp_83_fu_399_p1 ^ 1'd1);

assign tmp_73_fu_412_p2 = ((xCount_V_2_0 < 10'd63) ? 1'b1 : 1'b0);

assign tmp_74_fu_443_p2 = (xCount_V_2_0 + 10'd1);

assign tmp_75_fu_418_p2 = ($signed(xCount_V_2_0) + $signed(10'd961));

assign tmp_76_fu_430_p2 = (hBarSel_5_0 + 3'd1);

assign tmp_77_fu_487_p1 = tmp_48_fu_479_p3;

assign tmp_78_fu_540_p1 = DPtpgBarArray_q0;

assign tmp_83_fu_399_p1 = x[0:0];

assign tmp_cast_fu_475_p1 = tmp_fu_467_p3;

assign tmp_fu_467_p3 = {{ap_phi_mux_vBarSel_3_loc_2_phi_fu_275_p8}, {ap_phi_mux_hBarSel_5_0_loc_phi_fu_289_p6}};

assign tmp_s_fu_304_p2 = (y | x);

assign val_assign_1_fu_599_p3 = ((brmerge_reg_713_pp0_iter1_reg[0:0] === 1'b1) ? DPtpgBarSelYuv_709_u_q0 : DPtpgBarSelYuv_709_v_q0);

assign val_assign_s_fu_592_p3 = ((brmerge_reg_713_pp0_iter1_reg[0:0] === 1'b1) ? DPtpgBarSelYuv_601_u_q0 : DPtpgBarSelYuv_601_v_q0);

endmodule //gener4_v_tpg_0_0_tpgPatternDPColorSqu
