library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity two_s_complement_tb is
	-- Generic declarations of the tested unit
		generic(
		n : INTEGER := 8 );
end two_s_complement_tb;

architecture TB_ARCHITECTURE of two_s_complement_tb is
	-- Component declaration of the tested unit
	component two_s_complement
		generic(
		n : INTEGER := 8 );
	port(
		input : in STD_LOGIC_VECTOR(n-1 downto 0);
		output : out STD_LOGIC_VECTOR(n-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(n-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(n-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : two_s_complement
		generic map (
			n => n
		)

		port map (
			input => input,
			output => output
		);
		
		process 
		begin
			input <= "00001110";
			wait for 30 ns;
			input <= "01001110";
			wait for 30 ns;
			input <= "11001110";
			wait for 30 ns;
			
		end process;	
			
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_two_s_complement of two_s_complement_tb is
	for TB_ARCHITECTURE
		for UUT : two_s_complement
			use entity work.two_s_complement(two_s_complement);
		end for;
	end for;
end TESTBENCH_FOR_two_s_complement;

