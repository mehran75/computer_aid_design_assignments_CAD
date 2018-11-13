library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm_odd_one_tb is
end fsm_odd_one_tb;

architecture TB_ARCHITECTURE of fsm_odd_one_tb is
	-- Component declaration of the tested unit
	component fsm_odd_one
	port(
		input : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC;
	signal clk : STD_LOGIC := '1';
	signal reset : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fsm_odd_one
		port map (
			input => input,
			clk => clk,
			reset => reset,
			output => output
		);

	clk <=  '1' after 4.9 ns when clk = '0' else
        '0' after 4.9 ns when clk = '1';  
		
	reset <= '0';
		
		
		process is
		begin
			input <= '1';
			wait for 5 ns;
			input <= '1';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '0';
			wait for 5 ns;
		input <= '0';
			wait for 5 ns;
		input <= '0';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		input <= '1';
			wait for 5 ns;
		
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm_odd_one of fsm_odd_one_tb is
	for TB_ARCHITECTURE
		for UUT : fsm_odd_one
			use entity work.fsm_odd_one(fsm_odd_one);
		end for;
	end for;
end TESTBENCH_FOR_fsm_odd_one;

