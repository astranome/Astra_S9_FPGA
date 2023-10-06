vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"H:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"H:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_BOOT.srcs/sources_1/bd/zynq/ipshared/70fd/hdl" "+incdir+H:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_processing_system7_0_0/zynq_processing_system7_0_0_sim_netlist.v" \
"../../../bd/zynq/sim/zynq.v" \

vlog -work xil_defaultlib \
"glbl.v"

