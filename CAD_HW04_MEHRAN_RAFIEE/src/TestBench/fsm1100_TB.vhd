library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm1100_tb is
end fsm1100_tb;

architecture TB_ARCHITECTURE of fsm1100_tb is
	-- Component declaration of the tested unit
	component fsm1100
	port(
		Start : in STD_LOGIC;
		X : in STD_LOGIC;
		clk : in STD_LOGIC;
		Stop : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Start : STD_LOGIC;
	signal X : STD_LOGIC;
	signal clk : STD_LOGIC := '0';
	signal Stop : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;

	-- Add your code here ...

begin
	
	clk <= not clk after 2.51ns;
	-- Unit Under Test port map
	UUT : fsm1100
		port map (
			Start => Start,
			X => X,
			clk => clk,
			Stop => Stop,
			output => output
		);

	start <= '1'; 
	stop <= '0', '1' after 50ns;
	
	x <= '0',
	'1' after 5ns,
	'0' after 10ns,
	'0' after 15ns,
	'1' after 20ns,
	'1' after 25ns,
	'0' after 30ns,
	'0' after 35ns,
	'1' after 40ns,
	'1' after 45ns,
	'1' after 50ns,
	'0' after 55ns,
	'0' after 60ns;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm1100 of fsm1100_tb is
	for TB_ARCHITECTURE
		for UUT : fsm1100
			use entity work.fsm1100(fsm1100);
		end for;
	end for;
end TESTBENCH_FOR_fsm1100;

