library ieee;
use ieee.std_logic_1164.all; 


	-- Add your library and packages declaration here ...

entity parity_bit_tb is
end parity_bit_tb;

architecture TB_ARCHITECTURE of parity_bit_tb is
	-- Component declaration of the tested unit
	component parity_bit
	port(
		input : in STD_LOGIC_VECTOR(6 downto 0);
		odd : out STD_LOGIC;
		even : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal odd : STD_LOGIC ;
	signal even : STD_LOGIC ;

	-- Add your code here ...	
	
begin

	-- Unit Under Test port map
	UUT : parity_bit
		port map (
			input => input,
			odd => odd,
			even => even
		);
		
		process
		begin	
			input(6 downto 0) <= "0011001";	 
			wait for 50 ns;		
			
			input(6 downto 0) <= "0011101";	  
			wait for 50 ns;
			
			input(6 downto 0) <= "0111101";	  
			wait for 50 ns;	   
			
			
			input(6 downto 0) <= "1111101";	  
			wait for 50 ns;
		end process; 
	-- Add your stimulus here ...
	
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_parity_bit of parity_bit_tb is
	for TB_ARCHITECTURE
		for UUT : parity_bit
			use entity work.parity_bit(parity_bit);
		end for;
	end for;
end TESTBENCH_FOR_parity_bit;

