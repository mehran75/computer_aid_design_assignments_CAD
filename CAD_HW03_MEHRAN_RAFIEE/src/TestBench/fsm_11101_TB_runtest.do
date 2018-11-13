SetActiveLib -work
comp -include "$dsn\src\fsm_11101.vhd" 
comp -include "$dsn\src\TestBench\fsm_11101_TB.vhd" 
asim +access +r TESTBENCH_FOR_fsm_11101 
wave 
wave -noreg reset
wave -noreg clk
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fsm_11101_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fsm_11101 
