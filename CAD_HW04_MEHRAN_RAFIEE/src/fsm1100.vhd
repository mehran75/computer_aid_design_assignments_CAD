-------------------------------------------------------------------------------
--
-- Title       : fsm1100
-- Design      : CAD_HW04_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fsm1100.vhd
-- Generated   : Sun Dec  9 17:14:50 2018
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
--{entity {fsm1100} architecture {fsm1100}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fsm1100 is
	 port(
		 Start : in STD_LOGIC;
		 X : in STD_LOGIC;	
		 clk : in STD_LOGIC;
		 Stop : in STD_LOGIC;
		 output : out STD_LOGIC
	     );
end fsm1100;

--}} End of automatically maintained section

architecture fsm1100 of fsm1100 is	 

type FSM is (s0,s1,s2,s3,s4,s5);

signal p_state : FSM := s0;	
																									
begin							   					   
	
	
	output <= '1' when p_state = s5 else '0';
	
	
	process (clk)
	begin
		
		if (rising_edge(clk)) then	
			if (start = '1' and p_state = s0) then	   
				p_state <= s1;
			end if;
		
			
			if (stop = '1') then		  
				p_state <= p_state;
			else   						   
				case (p_state) is	 
					when s1 => if (x = '1') then p_state <= s2; else p_state <= p_state; end if;  
					when s2 => if (x = '1') then p_state <= s3; else p_state <= p_state; end if;
					when s3 => if (x = '0') then p_state <= s4; else p_state <= p_state; end if;
					when s4 => if (x = '0') then p_state <= s5; else p_state <= p_state; end if;
					when s5 => p_state <= s0;
					when others => null;
				end case;	
			end if;
				
				
			
		end if;	
		
	end process;  
	
	
	

end fsm1100;
