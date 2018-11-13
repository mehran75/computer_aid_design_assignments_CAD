-------------------------------------------------------------------------------
--
-- Title       : encoder
-- Design      : CAD_HW02_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : encoder.vhd
-- Generated   : Thu Nov  1 10:55:43 2018
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
--{entity {encoder} architecture {encoder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all	;

entity encoder is  
	generic (n : integer := 4);
	
	 port(
		 input : in STD_LOGIC_vector(((2**n)-1 ) downto 0);
		 output : out STD_LOGIC_Vector(n-1 downto 0)
	     );
end encoder;

--}} End of automatically maintained section

architecture encoder of encoder is
begin
	
	process(input)
	begin	 
		
		output <= (others=>'0');
	encoder:
		for i in 0 to ((2**n) -1) loop 
			
			if input(i) = '1' then
				output <= conv_std_logic_vector(i, n);	   
			end if;	
			
		end loop;
		
	 end process;
end encoder;
