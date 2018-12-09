-------------------------------------------------------------------------------
--
-- Title       : \counter-12-bit\
-- Design      : CAD_HW04_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : counter-12-bit.vhd
-- Generated   : Sun Dec  9 16:15:52 2018
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
--{entity {\counter-12-bit\} architecture {\counter-12-bit\}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_UNSIGNED.all;  
use IEEE.STD_LOGIC_ARITH.all;

entity \counter-12-bit\ is
	 port(
	 	countEn : in STD_LOGIC; 
	 	clk : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(11 downto 0)
	     );
end \counter-12-bit\;

--}} End of automatically maintained section

architecture \counter-12-bit\ of \counter-12-bit\ is

signal next_output : integer range 0 to 1080 := 0;
begin
	
	process(clk)
	begin
	
		if (rising_edge(clk)) then
			if (countEn = '1') then
				if (next_output = 1080) then 
					next_output <= 0;
				else 
					next_output <= next_output + 1;
				end if;
           	else
				next_output <= next_output;
			end if;	
		end if;			
	end process;
	
	output <= conv_std_logic_vector(next_output, output'length);		  
	
	 -- enter your statements here --

end \counter-12-bit\;
