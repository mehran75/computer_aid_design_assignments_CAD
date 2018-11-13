library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm_11101_tb is
end fsm_11101_tb;

architecture TB_ARCHITECTURE of fsm_11101_tb is
	-- Component declaration of the tested unit
	component fsm_11101
	port(
		reset : in STD_LOGIC;
		clk : in STD_LOGIC;
		input : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC := '0';
	signal clk : STD_LOGIC := '0';
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;
															 

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fsm_11101
		port map (
			reset => reset,
			clk => clk,
			input => input,
			output => output
		);
		
		clk <=  '1' after 4.5 ns when clk = '0' else
        '0' after 4.5 ns when clk = '1'; 
		
		
		process is
		begin
			input <= '0';
			wait for 5 ns;
			input <= '0';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '0';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '0';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		
		end process;
		
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm_11101 of fsm_11101_tb is
	for TB_ARCHITECTURE
		for UUT : fsm_11101
			use entity work.fsm_11101(fsm_11101);
		end for;
	end for;
end TESTBENCH_FOR_fsm_11101;

