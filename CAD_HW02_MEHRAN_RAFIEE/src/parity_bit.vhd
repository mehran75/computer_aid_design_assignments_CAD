-------------------------------------------------------------------------------
--
-- Title       : parity_bit
-- Design      : CAD_HW02_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : parity_bit.vhd
-- Generated   : Tue Oct 30 17:46:59 2018
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
--{entity {parity_bit} architecture {parity_bit}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity parity_bit is
	 port(
		 input : in STD_LOGIC_VECTOR(6 downto 0);
		 odd : out STD_LOGIC;
		 even : out STD_LOGIC
	     );
end parity_bit;

--}} End of automatically maintained section

architecture parity_bit of parity_bit is
begin

		even <= input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6);	
		-- it's wierd but XNOR works just like XOR!!!!! So I had to implement it like line below:/
		odd <= not (input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6));
		

end parity_bit;
