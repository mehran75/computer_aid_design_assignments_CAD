library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity memory_tb is
	-- Generic declarations of the tested unit
		generic(
		Data_Width : INTEGER := 8;
		Addr_Width : INTEGER := 8 );
end memory_tb;

architecture TB_ARCHITECTURE of memory_tb is
	-- Component declaration of the tested unit
	component memory
		generic(
		Data_Width : INTEGER := 8;
		Addr_Width : INTEGER := 8 );
	port(
		clk   : in STD_LOGIC;
		cs1   : in STD_LOGIC;
		cs2   : in STD_LOGIC;
		we1   : in STD_LOGIC;
		we2   : in STD_LOGIC;
		addr1 : in STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
		addr2 : in STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
		data1 : inout STD_LOGIC_VECTOR(Data_width-1 downto 0);
		data2 : inout STD_LOGIC_VECTOR(Data_width-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal cs1 : STD_LOGIC;
	signal cs2 : STD_LOGIC;
	signal we1 : STD_LOGIC;
	signal we2 : STD_LOGIC;
	signal addr1 : STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
	signal addr2 : STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
	signal data1 : STD_LOGIC_VECTOR(Data_width-1 downto 0);
	signal data2 : STD_LOGIC_VECTOR(Data_width-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : memory
		generic map (
			Data_Width => Data_Width,
			Addr_Width => Addr_Width
		)

		port map (
			clk => clk,
			cs1 => cs1,
			cs2 => cs2,
			we1 => we1,
			we2 => we2,
			addr1 => addr1,
			addr2 => addr2,
			data1 => data1,
			data2 => data2
		);

		clk <= not clk after 1ns;
	
		
		process
		begin		
			
			data1  <= "00100101";
			addr1 <= "00000001";		  
			cs1 <= '1';
			we1 <= '1';
			
			wait for 10ns;
			
			data1  <= "00101101";
			addr1 <= "00000010";		  
			cs1 <= '1';
			we1 <= '1';
			
			wait for 10ns;
			
			data1  <= (others => 'Z');
			addr1 <= "00000001";		  
			cs1 <= '1';
			we1 <= '0';
			
			wait for 10ns;
			
			data1  <= (others => 'Z');
			addr1 <= "00000010";		  
			cs1 <= '1';
			we1 <= '0';
			
			wait for 10ns;
			
		end process;
		
		
		
		
		--data2 <= "00010101";
		--addr2 <= "00000011";
	
		--cs2 <= '0', '1' after 20ns;
		--we2 <= '1' ;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_memory of memory_tb is
	for TB_ARCHITECTURE
		for UUT : memory
			use entity work.memory(memory);
		end for;
	end for;
end TESTBENCH_FOR_memory;

