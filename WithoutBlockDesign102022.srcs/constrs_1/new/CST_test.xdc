
## Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK]




##7 Segment display
set_property PACKAGE_PIN W7 [get_ports {Segment[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[6]}]
set_property PACKAGE_PIN W6 [get_ports {Segment[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[5]}]
set_property PACKAGE_PIN U8 [get_ports {Segment[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[4]}]
set_property PACKAGE_PIN V8 [get_ports {Segment[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[3]}]
set_property PACKAGE_PIN U5 [get_ports {Segment[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[2]}]
set_property PACKAGE_PIN V5 [get_ports {Segment[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[1]}]
set_property PACKAGE_PIN U7 [get_ports {Segment[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[0]}]




set_property IOSTANDARD LVCMOS33 [get_ports {Select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Select[0]}]
set_property PACKAGE_PIN U2 [get_ports {Select[3]}]
set_property PACKAGE_PIN U4 [get_ports {Select[2]}]
set_property PACKAGE_PIN V4 [get_ports {Select[1]}]
set_property PACKAGE_PIN W4 [get_ports {Select[0]}]


set_property PACKAGE_PIN V7 [get_ports {Segment[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Segment[7]}]


set_property PACKAGE_PIN W19 [get_ports ClearCPU]
set_property IOSTANDARD LVCMOS33 [get_ports ClearCPU]


set_property PACKAGE_PIN V16 [get_ports ClearUI]
set_property IOSTANDARD LVCMOS33 [get_ports ClearUI]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ClearUI_IBUF]

set_property PACKAGE_PIN T1 [get_ports Func_Choose0]
set_property IOSTANDARD LVCMOS33 [get_ports Func_Choose0]
set_property PACKAGE_PIN R2 [get_ports Func_Choose1]
set_property IOSTANDARD LVCMOS33 [get_ports Func_Choose1]
set_property IOSTANDARD LVCMOS33 [get_ports Btn_Press]
set_property PACKAGE_PIN T17 [get_ports Btn_Press]
