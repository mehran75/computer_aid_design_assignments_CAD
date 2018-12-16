-------------------------------------------------------------------------------
--
-- Title       : memory
-- Design      : CAD_HW04_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : memory.vhd
-- Generated   : Sun Dec  9 19:43:12 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {memory} architecture {memory}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;
--use IEEE.STD_LOGIC_ARITH.all;

entity memory is
	generic (Data_Width :integer := 8;
			 Addr_Width :integer := 8);
	 port(
		 clk : in STD_LOGIC;
		 cs1 : in STD_LOGIC;
		 cs2 : in STD_LOGIC;
		 we1 : in STD_LOGIC;
		 we2 : in STD_LOGIC;
		 addr1 : in STD_LOGIC_VECTOR(Addr_Width -1 downto 0);
		 addr2 : in STD_LOGIC_VECTOR(Addr_Width -1 downto 0);
		 data1 : inout STD_LOGIC_VECTOR(Data_width -1 downto 0);
		 data2 : inout STD_LOGIC_VECTOR(Data_width -1 downto 0)					 			 		
	     );
end memory;

--}} End of automatically maintained section

architecture memory of memory is 
type memory_arch is array(Addr_Width**2 -1 downto 0) 
							of std_logic_vector(Data_width -1 downto 0);
 
signal ram : memory_arch;

signal data_out1,data_out2 : std_logic_vector(Data_width -1 downto 0);
begin
	
	
	-- Write to port 2--		
	process (clk)
	begin
		
		if (clk'event and clk = '1') then
			
			
			-- port number 1--
			if (cs1 = '1' and we1 = '1') then
				ram(to_integer(unsigned(addr1))) <= data1 ;			
				
			end if;
			
			-- port number 2--
			if (cs2 = '1' and we2 = '1') then
					ram(to_integer(unsigned(addr2))) <= data2 ;
			end if;
				
		end if;	
	end process; 
	
	
	-- Read from port 1--
	process(addr1,cs1,we1)
	begin
		
		if (cs1 = '1' and we1 = '0') then
			data_out1 <= ram(to_integer(unsigned(addr1)));	  
		else
			data_out1 <= (others => '0');
		end if;
		
	end process;
	
	
	-- Read from port 2--
	process(addr2,cs2,we2)
	begin
		
		
		if (cs2 = '1' and we2 = '0') then
			data_out2 <= ram(to_integer(unsigned(addr2)));
		else
			data_out2 <= (others => '0');
		end if;
		
	end process;
	
	
	data1 <= data_out1 when (cs1 = '1' and we1 = '0')	   
			else (others=>'Z');
	
	data2 <= data_out2 when (cs2 = '1' and we2 = '0')	   
			else (others=>'Z');
				

end memory;
