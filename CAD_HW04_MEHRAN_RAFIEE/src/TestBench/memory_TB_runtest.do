SetActiveLib -work
comp -include "$dsn\src\memory.vhd" 
comp -include "$dsn\src\TestBench\memory_TB.vhd" 
asim +access +r TESTBENCH_FOR_memory 
wave 
wave -noreg clk
wave -noreg cs1
wave -noreg cs2
wave -noreg we1
wave -noreg we2
wave -noreg addr1
wave -noreg addr2
wave -noreg data1
wave -noreg data2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\memory_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_memory 
