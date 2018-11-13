library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity encoder_tb is
	-- Generic declarations of the tested unit
		generic(
		n : INTEGER := 3 );
end encoder_tb;

architecture TB_ARCHITECTURE of encoder_tb is
	-- Component declaration of the tested unit
	component encoder
		generic(
		n : INTEGER := 3 );
	port(
		input : in STD_LOGIC_VECTOR((2**n)-1 downto 0);
		output : out STD_LOGIC_VECTOR(n-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR((2**n)-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(n-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : encoder
		generic map (
			n => n
		)

		port map (
			input => input,
			output => output
		);	 
		
	process 
		begin
		input <= "00000000";
		wait for 10 ns;
		input <= "00000001";
		wait for 10 ns;
		input <= "00000010";
		wait for 10 ns;
		input <= "00000100";
		wait for 10 ns;
		input <= "00001000";
		wait for 10 ns;
		input <= "00010000";
		wait for 10 ns;
		input <= "00100000";
		wait for 10 ns;
		input <= "01000000";
		wait for 10 ns;		 
		input <= "10000000";
		wait for 10 ns;	
	 end process;
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_encoder of encoder_tb is
	for TB_ARCHITECTURE
		for UUT : encoder
			use entity work.encoder(encoder);
		end for;
	end for;
end TESTBENCH_FOR_encoder;

