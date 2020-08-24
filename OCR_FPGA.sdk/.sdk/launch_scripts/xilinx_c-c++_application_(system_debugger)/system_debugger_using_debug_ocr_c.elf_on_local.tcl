connect -url tcp:127.0.0.1:3121
source G:/studia/fpga/project_sdup_ocr/OCR_FPGA/OCR_FPGA.sdk/design_ocr_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248586553"} -index 0
loadhw -hw G:/studia/fpga/project_sdup_ocr/OCR_FPGA/OCR_FPGA.sdk/design_ocr_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248586553"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248586553"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248586553"} -index 0
dow G:/studia/fpga/project_sdup_ocr/OCR_FPGA/OCR_FPGA.sdk/ocr_c/Debug/ocr_c.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248586553"} -index 0
con
