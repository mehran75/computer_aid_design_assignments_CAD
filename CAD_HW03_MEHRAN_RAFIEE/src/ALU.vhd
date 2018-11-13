-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : CAD_HW03_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Mon Nov 12 17:52:25 2018
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
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

entity ALU is
	port(
		 clk : in STD_LOGIC;
		 ALUEn : in STD_LOGIC;
		 input_1 : in STD_LOGIC_VECTOR(15 downto 0);
		 input_2 : in STD_LOGIC_VECTOR(15 downto 0);
		 command : in STD_LOGIC_VECTOR(2 downto 0);
		 output : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is						  

signal com_output : std_logic_vector(15 downto 0);	

begin

	process(clk) is 
	begin	
		if rising_edge(clk) then
			if ALUEn = '1' then
				output <= com_output;
			end if;
		end if;
	end process;
	
	
	process(command, input_1 , input_2) is 
	begin
		
		case command is 
			when "000" => com_output <= input_1 + input_2; 
			when "001" => com_output <= input_1 - input_2; 
			when "010" => com_output <= input_1 + '1'; 
			when "011" => com_output <= (not input_1) + '1'; 
			when "100" => com_output <= input_1 and input_2; 
			when "101" => com_output <= input_1 or input_2; 
			when "110" => com_output <= input_1 xor input_2;
			when "111" => com_output <= std_logic_vector(unsigned(input_1) sll 1);
			
			when others => com_output <= (others=>'0');
						

		end case;
		

	end process;

end ALU;
