vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xilinx_vip -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_processing_system7_0_0/zynq_processing_system7_0_0_sim_netlist.v" \
"../../../bd/zynq/sim/zynq.v" \

vlog -work xil_defaultlib \
"glbl.v"

