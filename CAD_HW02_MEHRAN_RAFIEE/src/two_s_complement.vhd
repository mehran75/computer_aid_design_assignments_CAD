-------------------------------------------------------------------------------
--
-- Title       : two_s_complement
-- Design      : CAD_HW02_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : two_s_complement.vhd
-- Generated   : Fri Nov  2 15:34:02 2018
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
--{entity {two_s_complement} architecture {two_s_complement}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all	;


entity two_s_complement is 
	
	generic ( n : integer := 8);
	
	 port(
		 input : in STD_LOGIC_VECTOR((n-1) downto 0);
		 output : out STD_LOGIC_VECTOR(n-1 downto 0)
	     );
end two_s_complement;

--}} End of automatically maintained section

architecture two_s_complement of two_s_complement is
begin
	
	process(input)
	
		variable counter : integer;
		begin
			
			counter := 0;
			
			checker:
				for i in 0 to input'length-1 loop
				
					if input(i) = '1' then
						counter := counter + 1;
					end if;
				end loop;
			
			if counter > ((input'length)/2)	 then
				output <= (not input) + 1;
			else 
				output <= input;
			end if;	   
		end process;		
	 -- enter your statements here --

end two_s_complement;
