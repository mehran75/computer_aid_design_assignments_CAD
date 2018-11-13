library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity seven_segment_tb is
end seven_segment_tb;

architecture TB_ARCHITECTURE of seven_segment_tb is
	-- Component declaration of the tested unit
	component seven_segment
	port(
		input : in STD_LOGIC_VECTOR(3 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : seven_segment
		port map (
			input => input,
			output => output
		);
	   
		process 
		begin	
			
			gen :
			for j in 0 to 15 loop
				input <=  conv_std_logic_vector(j,4);
				wait for 10 ns;
			end loop gen;
			
		end process;
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_seven_segment of seven_segment_tb is
	for TB_ARCHITECTURE
		for UUT : seven_segment
			use entity work.seven_segment(seven_segment);
		end for;
	end for;
end TESTBENCH_FOR_seven_segment;

