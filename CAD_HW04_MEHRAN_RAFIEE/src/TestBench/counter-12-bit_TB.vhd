library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity \counter-12-bit_tb\ is
end \counter-12-bit_tb\;

architecture TB_ARCHITECTURE of \counter-12-bit_tb\ is
	-- Component declaration of the tested unit
	component \counter-12-bit\
	port(
		countEn : in STD_LOGIC;
		clk : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(11 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal countEn : STD_LOGIC;
	signal clk : STD_LOGIC := '0';
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(11 downto 0);

	-- Add your code here ...

begin
	
	-- Unit Under Test port map
	UUT : \counter-12-bit\
		port map (
			countEn => countEn,
			clk => clk,
			output => output
		);
		
		clk <= not clk after 0.1ns;
		
		countEn <= '1', 
		'0' after 5ns ,
		'1' after 6ns;
		
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration \TESTBENCH_FOR_\\counter-12-bit\ of \counter-12-bit_tb\ is
	for TB_ARCHITECTURE
		for UUT : \counter-12-bit\
			use entity work.\counter-12-bit\(\counter-12-bit\);
		end for;
	end for;
end \TESTBENCH_FOR_\\counter-12-bit\;

