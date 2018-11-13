-------------------------------------------------------------------------------
--
-- Title       : seven_segment
-- Design      : CAD_HW02_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : seven_segment.vhd
-- Generated   : Fri Nov  2 16:03:14 2018
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
--{entity {seven_segment} architecture {seven_segment}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;	


entity seven_segment is
	 port(
		 input : in STD_LOGIC_VECTOR(3 downto 0);
		 output : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end seven_segment;

--}} End of automatically maintained section

architecture seven_segment of seven_segment is
begin
	
	process (input)
		  begin
		CASE input is
			
			when "0000" => output <= x"3F";
			when "0001" => output <= x"06";
			when "0010" => output <= x"5b";
			when "0011" => output <= x"4f";
			when "0100" => output <= x"66";
			when "0101" => output <= x"6d";
			when "0110" => output <= x"7d";
			when "0111" => output <= x"07";
			when "1000" => output <= x"7f";
			when "1001" => output <= x"67";
			when "1010" => output <= x"77";
			when "1011" => output <= x"7c";
			when "1100" => output <= x"39";
			when "1101" => output <= x"5e";
			when "1110" => output <= x"79";
			when "1111" => output <= x"71";
			
			when others => output <= x"00";
			end case;
	end process;
	 -- enter your statements here --

end seven_segment;
