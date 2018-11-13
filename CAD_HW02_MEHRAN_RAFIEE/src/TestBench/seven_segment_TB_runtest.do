SetActiveLib -work
comp -include "$dsn\src\seven_segment.vhd" 
comp -include "$dsn\src\TestBench\seven_segment_TB.vhd" 
asim +access +r TESTBENCH_FOR_seven_segment 
wave 
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\seven_segment_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_seven_segment 
