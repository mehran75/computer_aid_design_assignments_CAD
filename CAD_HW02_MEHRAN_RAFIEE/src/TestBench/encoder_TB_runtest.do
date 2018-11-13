SetActiveLib -work
comp -include "$dsn\src\encoder.vhd" 
comp -include "$dsn\src\TestBench\encoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_encoder 
wave 
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\encoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_encoder 
