// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gener4_v_tpg_0_0_tpgPatternRainbow (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ap_ce,
        x,
        color,
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
input  [15:0] x;
input  [7:0] color;
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
wire   [10:0] tpgSinTableArray_9bi_1_address0;
reg    tpgSinTableArray_9bi_1_ce0;
wire   [8:0] tpgSinTableArray_9bi_1_q0;
wire   [10:0] tpgSinTableArray_9bi_1_address1;
reg    tpgSinTableArray_9bi_1_ce1;
wire   [8:0] tpgSinTableArray_9bi_1_q1;
wire   [10:0] tpgSinTableArray_9bi_1_address2;
reg    tpgSinTableArray_9bi_1_ce2;
wire   [8:0] tpgSinTableArray_9bi_1_q2;
reg  signed [15:0] x_read_reg_625;
reg  signed [15:0] x_read_reg_625_pp0_iter1_reg;
wire   [0:0] tmp_fu_122_p2;
wire   [0:0] icmp_fu_138_p2;
wire   [7:0] p_tmp_s_fu_199_p3;
reg   [7:0] p_tmp_s_reg_658;
wire   [7:0] g_fu_231_p3;
reg   [7:0] g_reg_665;
wire   [7:0] b_fu_263_p3;
reg   [7:0] b_reg_671;
reg    ap_block_pp0_stage0_subdone;
wire   [63:0] tmp_s_fu_148_p1;
wire   [63:0] tmp_54_fu_159_p1;
wire   [63:0] tmp_57_fu_170_p1;
wire   [6:0] tmp_53_fu_128_p4;
wire   [10:0] tmp_56_fu_144_p1;
wire   [10:0] tmp_179_cast_fu_153_p2;
wire   [10:0] tmp_185_cast_fu_164_p2;
wire   [7:0] tmp_59_fu_175_p1;
wire   [8:0] tmp_52_fu_179_p2;
wire   [0:0] tmp_71_fu_191_p3;
wire   [7:0] tmp_57_cast_fu_185_p2;
wire   [7:0] tmp_73_fu_207_p1;
wire   [8:0] tmp_55_fu_211_p2;
wire   [0:0] tmp_74_fu_223_p3;
wire   [7:0] tmp_60_cast_fu_217_p2;
wire   [7:0] tmp_75_fu_239_p1;
wire   [8:0] tmp_58_fu_243_p2;
wire   [0:0] tmp_76_fu_255_p3;
wire   [7:0] tmp_63_cast_fu_249_p2;
wire   [14:0] grp_fu_570_p3;
wire  signed [15:0] grp_fu_579_p3;
wire   [16:0] grp_fu_588_p3;
wire   [14:0] tmp_66_fu_295_p3;
wire  signed [15:0] grp_fu_599_p3;
wire   [16:0] tmp_202_cast_fu_302_p1;
wire   [16:0] tmp_204_cast_fu_306_p1;
wire   [16:0] tmp_68_fu_309_p2;
wire   [14:0] tmp_69_fu_325_p3;
wire   [7:0] tmp_207_cast_fu_336_p1;
wire  signed [15:0] tmp_193_cast_fu_274_p1;
wire  signed [15:0] grp_fu_616_p3;
wire   [16:0] tmp_206_cast_fu_332_p1;
wire   [16:0] tmp5_fu_345_p2;
wire  signed [16:0] tmp14_cast_fu_342_p1;
wire   [16:0] tmp_70_fu_351_p2;
wire   [8:0] tmp_1_fu_286_p4;
wire   [0:0] tmp_77_fu_367_p3;
wire   [0:0] phitmp8_fu_374_p2;
wire   [7:0] tmp_13_fu_386_p4;
wire   [0:0] tmp_72_fu_380_p2;
wire   [7:0] tmp_14_fu_395_p3;
wire   [8:0] tmp_3_fu_315_p4;
wire   [0:0] not_phitmp9_fu_411_p2;
wire   [0:0] tmp_78_fu_425_p2;
wire   [7:0] tmp_16_cast_fu_417_p3;
wire   [7:0] tmp_18_fu_431_p4;
wire   [8:0] tmp_6_fu_357_p4;
wire   [0:0] tmp_79_fu_455_p3;
wire   [7:0] tmp_20_fu_463_p4;
wire   [7:0] tmp_15_fu_403_p3;
wire   [0:0] phitmp5_fu_449_p2;
wire   [0:0] sel_tmp1_fu_487_p2;
wire   [0:0] sel_tmp2_fu_492_p2;
wire   [7:0] tmp_22_fu_481_p3;
wire   [7:0] tmp_19_fu_441_p3;
wire   [7:0] tmp_24_fu_506_p3;
wire   [7:0] tmp_21_fu_473_p3;
wire   [7:0] tmp_26_fu_520_p3;
wire   [0:0] tmp_80_fu_534_p1;
wire   [7:0] Scalar_val_2_V_writ_fu_526_p3;
wire   [7:0] tmp_25_fu_512_p3;
wire   [7:0] tmp_28_fu_537_p3;
wire   [7:0] Scalar_val_0_V_writ_fu_498_p3;
wire   [7:0] Scalar_val_1_V_writ_fu_545_p3;
wire   [7:0] grp_fu_570_p0;
wire   [7:0] grp_fu_570_p1;
wire   [14:0] tmp_191_cast5_cast1_fu_271_p1;
wire   [13:0] grp_fu_570_p2;
wire   [8:0] grp_fu_579_p0;
wire   [7:0] grp_fu_579_p1;
wire   [14:0] grp_fu_579_p2;
wire   [5:0] grp_fu_588_p0;
wire   [7:0] grp_fu_588_p1;
wire   [13:0] tmp_195_cast_cast_ca_fu_277_p1;
wire  signed [15:0] grp_fu_588_p2;
wire  signed [6:0] grp_fu_599_p0;
wire   [7:0] grp_fu_599_p1;
wire  signed [15:0] grp_fu_607_p3;
wire  signed [7:0] grp_fu_607_p0;
wire   [7:0] grp_fu_607_p1;
wire  signed [5:0] grp_fu_616_p0;
wire   [7:0] grp_fu_616_p1;
wire  signed [15:0] grp_fu_616_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire  signed [15:0] grp_fu_579_p20;
wire   [16:0] grp_fu_588_p20;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

gener4_v_tpg_0_0_tpgPatternRainbowvdy #(
    .DataWidth( 9 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
tpgSinTableArray_9bi_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(tpgSinTableArray_9bi_1_address0),
    .ce0(tpgSinTableArray_9bi_1_ce0),
    .q0(tpgSinTableArray_9bi_1_q0),
    .address1(tpgSinTableArray_9bi_1_address1),
    .ce1(tpgSinTableArray_9bi_1_ce1),
    .q1(tpgSinTableArray_9bi_1_q1),
    .address2(tpgSinTableArray_9bi_1_address2),
    .ce2(tpgSinTableArray_9bi_1_ce2),
    .q2(tpgSinTableArray_9bi_1_q2)
);

gener4_v_tpg_0_0_v_tpg_mac_muladd_wdI #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 14 ),
    .dout_WIDTH( 15 ))
v_tpg_mac_muladd_wdI_U38(
    .din0(grp_fu_570_p0),
    .din1(grp_fu_570_p1),
    .din2(grp_fu_570_p2),
    .dout(grp_fu_570_p3)
);

gener4_v_tpg_0_0_v_tpg_mac_muladd_xdS #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 15 ),
    .dout_WIDTH( 16 ))
v_tpg_mac_muladd_xdS_U39(
    .din0(grp_fu_579_p0),
    .din1(grp_fu_579_p1),
    .din2(grp_fu_579_p2),
    .dout(grp_fu_579_p3)
);

gener4_v_tpg_0_0_v_tpg_mac_muladd_yd2 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 6 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 17 ))
v_tpg_mac_muladd_yd2_U40(
    .din0(grp_fu_588_p0),
    .din1(grp_fu_588_p1),
    .din2(grp_fu_588_p2),
    .dout(grp_fu_588_p3)
);

gener4_v_tpg_0_0_v_tpg_mac_muladd_zec #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
v_tpg_mac_muladd_zec_U41(
    .din0(grp_fu_599_p0),
    .din1(grp_fu_599_p1),
    .din2(grp_fu_607_p3),
    .dout(grp_fu_599_p3)
);

gener4_v_tpg_0_0_v_tpg_mac_muladd_Aem #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
v_tpg_mac_muladd_Aem_U42(
    .din0(grp_fu_607_p0),
    .din1(grp_fu_607_p1),
    .din2(16'd32896),
    .dout(grp_fu_607_p3)
);

gener4_v_tpg_0_0_v_tpg_mac_muladd_Bew #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 6 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
v_tpg_mac_muladd_Bew_U43(
    .din0(grp_fu_616_p0),
    .din1(grp_fu_616_p1),
    .din2(grp_fu_616_p2),
    .dout(grp_fu_616_p3)
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
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        b_reg_671 <= b_fu_263_p3;
        g_reg_665 <= g_fu_231_p3;
        p_tmp_s_reg_658 <= p_tmp_s_fu_199_p3;
        x_read_reg_625 <= x;
        x_read_reg_625_pp0_iter1_reg <= x_read_reg_625;
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
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tpgSinTableArray_9bi_1_ce0 = 1'b1;
    end else begin
        tpgSinTableArray_9bi_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tpgSinTableArray_9bi_1_ce1 = 1'b1;
    end else begin
        tpgSinTableArray_9bi_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tpgSinTableArray_9bi_1_ce2 = 1'b1;
    end else begin
        tpgSinTableArray_9bi_1_ce2 = 1'b0;
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

assign Scalar_val_0_V_writ_fu_498_p3 = ((sel_tmp2_fu_492_p2[0:0] === 1'b1) ? tmp_15_fu_403_p3 : tmp_22_fu_481_p3);

assign Scalar_val_1_V_writ_fu_545_p3 = ((icmp_fu_138_p2[0:0] === 1'b1) ? tmp_25_fu_512_p3 : tmp_28_fu_537_p3);

assign Scalar_val_2_V_writ_fu_526_p3 = ((sel_tmp2_fu_492_p2[0:0] === 1'b1) ? 8'd0 : tmp_26_fu_520_p3);

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_return_0 = Scalar_val_0_V_writ_fu_498_p3;

assign ap_return_1 = Scalar_val_1_V_writ_fu_545_p3;

assign ap_return_2 = Scalar_val_2_V_writ_fu_526_p3;

assign b_fu_263_p3 = ((tmp_76_fu_255_p3[0:0] === 1'b1) ? 8'd255 : tmp_63_cast_fu_249_p2);

assign g_fu_231_p3 = ((tmp_74_fu_223_p3[0:0] === 1'b1) ? 8'd255 : tmp_60_cast_fu_217_p2);

assign grp_fu_570_p0 = 15'd77;

assign grp_fu_570_p1 = tmp_191_cast5_cast1_fu_271_p1;

assign grp_fu_570_p2 = 15'd4224;

assign grp_fu_579_p0 = 16'd150;

assign grp_fu_579_p1 = tmp_193_cast_fu_274_p1;

assign grp_fu_579_p2 = grp_fu_579_p20;

assign grp_fu_579_p20 = $unsigned(grp_fu_570_p3);

assign grp_fu_588_p0 = 14'd29;

assign grp_fu_588_p1 = tmp_195_cast_cast_ca_fu_277_p1;

assign grp_fu_588_p2 = grp_fu_588_p20;

assign grp_fu_588_p20 = $unsigned(grp_fu_579_p3);

assign grp_fu_599_p0 = 15'd32725;

assign grp_fu_599_p1 = tmp_191_cast5_cast1_fu_271_p1;

assign grp_fu_607_p0 = 16'd65451;

assign grp_fu_607_p1 = tmp_193_cast_fu_274_p1;

assign grp_fu_616_p0 = 14'd16363;

assign grp_fu_616_p1 = tmp_195_cast_cast_ca_fu_277_p1;

assign grp_fu_616_p2 = ($signed(16'd65429) * $signed({{1'b0}, {tmp_207_cast_fu_336_p1}}));

assign icmp_fu_138_p2 = ((tmp_53_fu_128_p4 == 7'd0) ? 1'b1 : 1'b0);

assign not_phitmp9_fu_411_p2 = ((tmp_3_fu_315_p4 != 9'd0) ? 1'b1 : 1'b0);

assign p_tmp_s_fu_199_p3 = ((tmp_71_fu_191_p3[0:0] === 1'b1) ? 8'd255 : tmp_57_cast_fu_185_p2);

assign phitmp5_fu_449_p2 = ((tmp_6_fu_357_p4 == 9'd0) ? 1'b1 : 1'b0);

assign phitmp8_fu_374_p2 = ((tmp_1_fu_286_p4 != 9'd0) ? 1'b1 : 1'b0);

assign sel_tmp1_fu_487_p2 = (tmp_fu_122_p2 ^ 1'd1);

assign sel_tmp2_fu_492_p2 = (sel_tmp1_fu_487_p2 & phitmp5_fu_449_p2);

assign tmp14_cast_fu_342_p1 = grp_fu_616_p3;

assign tmp5_fu_345_p2 = (17'd32896 + tmp_206_cast_fu_332_p1);

assign tmp_13_fu_386_p4 = {{grp_fu_588_p3[15:8]}};

assign tmp_14_fu_395_p3 = ((tmp_77_fu_367_p3[0:0] === 1'b1) ? 8'd255 : tmp_13_fu_386_p4);

assign tmp_15_fu_403_p3 = ((tmp_72_fu_380_p2[0:0] === 1'b1) ? tmp_14_fu_395_p3 : 8'd0);

assign tmp_16_cast_fu_417_p3 = ((not_phitmp9_fu_411_p2[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign tmp_179_cast_fu_153_p2 = (11'd682 + tmp_56_fu_144_p1);

assign tmp_185_cast_fu_164_p2 = ($signed(11'd1364) + $signed(tmp_56_fu_144_p1));

assign tmp_18_fu_431_p4 = {{tmp_68_fu_309_p2[15:8]}};

assign tmp_191_cast5_cast1_fu_271_p1 = p_tmp_s_reg_658;

assign tmp_193_cast_fu_274_p1 = $unsigned(g_reg_665);

assign tmp_195_cast_cast_ca_fu_277_p1 = b_reg_671;

assign tmp_19_fu_441_p3 = ((tmp_78_fu_425_p2[0:0] === 1'b1) ? tmp_16_cast_fu_417_p3 : tmp_18_fu_431_p4);

assign tmp_1_fu_286_p4 = {{grp_fu_588_p3[16:8]}};

assign tmp_202_cast_fu_302_p1 = tmp_66_fu_295_p3;

assign tmp_204_cast_fu_306_p1 = $unsigned(grp_fu_599_p3);

assign tmp_206_cast_fu_332_p1 = tmp_69_fu_325_p3;

assign tmp_207_cast_fu_336_p1 = tmp_193_cast_fu_274_p1;

assign tmp_20_fu_463_p4 = {{tmp_70_fu_351_p2[15:8]}};

assign tmp_21_fu_473_p3 = ((tmp_79_fu_455_p3[0:0] === 1'b1) ? 8'd255 : tmp_20_fu_463_p4);

assign tmp_22_fu_481_p3 = ((tmp_fu_122_p2[0:0] === 1'b1) ? p_tmp_s_reg_658 : tmp_15_fu_403_p3);

assign tmp_24_fu_506_p3 = ((tmp_fu_122_p2[0:0] === 1'b1) ? g_reg_665 : tmp_19_fu_441_p3);

assign tmp_25_fu_512_p3 = ((sel_tmp2_fu_492_p2[0:0] === 1'b1) ? tmp_19_fu_441_p3 : tmp_24_fu_506_p3);

assign tmp_26_fu_520_p3 = ((tmp_fu_122_p2[0:0] === 1'b1) ? b_reg_671 : tmp_21_fu_473_p3);

assign tmp_28_fu_537_p3 = ((tmp_80_fu_534_p1[0:0] === 1'b1) ? Scalar_val_2_V_writ_fu_526_p3 : tmp_25_fu_512_p3);

assign tmp_3_fu_315_p4 = {{tmp_68_fu_309_p2[16:8]}};

assign tmp_52_fu_179_p2 = (9'd128 + tpgSinTableArray_9bi_1_q0);

assign tmp_53_fu_128_p4 = {{color[7:1]}};

assign tmp_54_fu_159_p1 = tmp_179_cast_fu_153_p2;

assign tmp_55_fu_211_p2 = (9'd128 + tpgSinTableArray_9bi_1_q1);

assign tmp_56_fu_144_p1 = x[10:0];

assign tmp_57_cast_fu_185_p2 = (tmp_59_fu_175_p1 ^ 8'd128);

assign tmp_57_fu_170_p1 = tmp_185_cast_fu_164_p2;

assign tmp_58_fu_243_p2 = (9'd128 + tpgSinTableArray_9bi_1_q2);

assign tmp_59_fu_175_p1 = tpgSinTableArray_9bi_1_q0[7:0];

assign tmp_60_cast_fu_217_p2 = (tmp_73_fu_207_p1 ^ 8'd128);

assign tmp_63_cast_fu_249_p2 = (tmp_75_fu_239_p1 ^ 8'd128);

assign tmp_66_fu_295_p3 = {{b_reg_671}, {7'd0}};

assign tmp_68_fu_309_p2 = (tmp_202_cast_fu_302_p1 + tmp_204_cast_fu_306_p1);

assign tmp_69_fu_325_p3 = {{p_tmp_s_reg_658}, {7'd0}};

assign tmp_6_fu_357_p4 = {{tmp_70_fu_351_p2[16:8]}};

assign tmp_70_fu_351_p2 = ($signed(tmp5_fu_345_p2) + $signed(tmp14_cast_fu_342_p1));

assign tmp_71_fu_191_p3 = tmp_52_fu_179_p2[32'd8];

assign tmp_72_fu_380_p2 = (tmp_77_fu_367_p3 | phitmp8_fu_374_p2);

assign tmp_73_fu_207_p1 = tpgSinTableArray_9bi_1_q1[7:0];

assign tmp_74_fu_223_p3 = tmp_55_fu_211_p2[32'd8];

assign tmp_75_fu_239_p1 = tpgSinTableArray_9bi_1_q2[7:0];

assign tmp_76_fu_255_p3 = tmp_58_fu_243_p2[32'd8];

assign tmp_77_fu_367_p3 = grp_fu_588_p3[32'd16];

assign tmp_78_fu_425_p2 = (($signed(tmp_3_fu_315_p4) < $signed(9'd1)) ? 1'b1 : 1'b0);

assign tmp_79_fu_455_p3 = tmp_70_fu_351_p2[32'd16];

assign tmp_80_fu_534_p1 = x_read_reg_625_pp0_iter1_reg[0:0];

assign tmp_fu_122_p2 = ((color == 8'd0) ? 1'b1 : 1'b0);

assign tmp_s_fu_148_p1 = tmp_56_fu_144_p1;

assign tpgSinTableArray_9bi_1_address0 = tmp_s_fu_148_p1;

assign tpgSinTableArray_9bi_1_address1 = tmp_54_fu_159_p1;

assign tpgSinTableArray_9bi_1_address2 = tmp_57_fu_170_p1;

endmodule //gener4_v_tpg_0_0_tpgPatternRainbow