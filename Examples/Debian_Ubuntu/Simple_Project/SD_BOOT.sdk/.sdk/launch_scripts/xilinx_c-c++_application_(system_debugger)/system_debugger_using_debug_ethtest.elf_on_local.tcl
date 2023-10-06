connect -url tcp:127.0.0.1:3121
source H:/FPGA/S9miner_sample-master/P04_SD_BOOT/SD_BOOT.sdk/zynq_wrapper_hw_platform_1/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
loadhw -hw H:/FPGA/S9miner_sample-master/P04_SD_BOOT/SD_BOOT.sdk/zynq_wrapper_hw_platform_1/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
dow H:/FPGA/S9miner_sample-master/P04_SD_BOOT/SD_BOOT.sdk/EthTest/Debug/EthTest.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
con
