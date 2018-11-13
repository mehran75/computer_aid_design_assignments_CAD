library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		clk : in STD_LOGIC;
		ALUEn : in STD_LOGIC;
		input_1 : in STD_LOGIC_VECTOR(15 downto 0);
		input_2 : in STD_LOGIC_VECTOR(15 downto 0);
		command : in STD_LOGIC_VECTOR(2 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '1';
	signal ALUEn : STD_LOGIC;
	signal input_1 : STD_LOGIC_VECTOR(15 downto 0);
	signal input_2 : STD_LOGIC_VECTOR(15 downto 0);
	signal command : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(15 downto 0);
								

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			clk => clk,
			ALUEn => ALUEn,
			input_1 => input_1,
			input_2 => input_2,
			command => command,
			output => output
		); 
		
		clk <=  '1' after 0.5 ns when clk = '0' else
        '0' after 0.5 ns when clk = '1';
		
		
		
		input_1 <= "0000000000000100";
		input_2 <= "0000000000000111";
		
		process is 
		begin
			
		ALUEn <= '0';
		
		command <= "000"; 
		wait for 10 ns;
		
		ALUEn <= '1';
		
		command <= "001";
		wait for 10 ns;
		
		command <= "010";
		wait for 10 ns;
		
		command <= "011";
		wait for 10 ns;
		
		command <= "100";
		wait for 10 ns;
		
		command <= "101";
		wait for 10 ns;
		
		command <= "110";
		wait for 10 ns;
		
		command <= "111";
		wait for 10 ns;	 
					 
		
		command <= "000";
		wait for 10 ns;	
		
		end process;
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(alu);
		end for;
	end for;
end TESTBENCH_FOR_alu;

