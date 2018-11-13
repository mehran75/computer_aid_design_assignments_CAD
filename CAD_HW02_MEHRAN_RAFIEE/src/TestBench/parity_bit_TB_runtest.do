SetActiveLib -work
comp -include "$dsn\src\parity_bit.vhd" 
comp -include "$dsn\src\TestBench\parity_bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_parity_bit 
wave 
wave -noreg input
wave -noreg odd
wave -noreg even
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\parity_bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_parity_bit 
