SetActiveLib -work
comp -include "$dsn\src\two_s_complement.vhd" 
comp -include "$dsn\src\TestBench\two_s_complement_TB.vhd" 
asim +access +r TESTBENCH_FOR_two_s_complement 
wave 
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\two_s_complement_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_two_s_complement 
