SetActiveLib -work
comp -include "$dsn\src\counter-12-bit.vhd" 
comp -include "$dsn\src\TestBench\counter-12-bit_TB.vhd" 
asim +access +r {\TESTBENCH_FOR_\\counter-12-bit\} 
wave 
wave -noreg countEn
wave -noreg clk
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\counter-12-bit_TB_tim_cfg.vhd" 
# asim +access +r {\TIMING_FOR_\\counter-12-bit\} 
