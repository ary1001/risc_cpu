onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label test_number -radix unsigned /cpu_test/test_number
add wave -noupdate -label rst_ /cpu_test/rst_
add wave -noupdate -label opcode /cpu_test/topcode
add wave -noupdate -expand -group clocks -label master_clk /cpu_test/master_clk
add wave -noupdate -expand -group clocks -label ctrl_clk /cpu_test/cntrl_clk
add wave -noupdate -expand -group clocks -label clk /cpu_test/clk
add wave -noupdate -expand -group clocks -label alu_clk /cpu_test/alu_clk
add wave -noupdate -expand -group control_signal -label mem_rd /cpu_test/mem_rd
add wave -noupdate -expand -group control_signal -label load_ir /cpu_test/load_ir
add wave -noupdate -expand -group control_signal -label halt /cpu_test/halt
add wave -noupdate -expand -group control_signal -label inc_pc /cpu_test/inc_pc
add wave -noupdate -expand -group control_signal -label load_ac /cpu_test/load_ac
add wave -noupdate -expand -group control_signal -label load_pc /cpu_test/load_pc
add wave -noupdate -expand -group control_signal -label mem_wr /cpu_test/mem_wr
add wave -noupdate -expand -group control_signal -label fetch /cpu_test/fetch
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {130000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {130 ns} {2870 ns}
