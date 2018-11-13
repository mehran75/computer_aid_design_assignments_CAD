SetActiveLib -work
comp -include "$dsn\src\fsm_odd_one.vhd" 
comp -include "$dsn\src\TestBench\fsm_odd_one_TB.vhd" 
asim +access +r TESTBENCH_FOR_fsm_odd_one 
wave 
wave -noreg input
wave -noreg clk
wave -noreg reset
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fsm_odd_one_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fsm_odd_one 
