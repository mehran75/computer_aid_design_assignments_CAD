-------------------------------------------------------------------------------
--
-- Title       : fsm_11101
-- Design      : CAD_HW03_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fsm_11101.vhd
-- Generated   : Mon Nov 12 23:24:33 2018
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
--{entity {fsm_11101} architecture {fsm_11101}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fsm_11101 is
	port( 
		 reset : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 input : in STD_LOGIC;
		 output : out STD_LOGIC
	     );
end fsm_11101;

--}} End of automatically maintained section

architecture fsm_11101 of fsm_11101 is 

	type FSM is (s0,s1,s2,s3,s4,s5);
	
	signal p_state : FSM := s0;	
	signal next_state: FSM := s0;
begin	
	
	
	

	process(clk , reset) is 
	begin		
		
		if reset = '1' then 
			p_state <= s0;
		elsif rising_edge(clk) then 
			p_state <= next_state;
		end if;	
		
	end process;
	
	
	process(p_state,input) is 
	begin
		
		case p_state is
			
			when s0 => if input = '1' then next_state <= s1; elsif input = '0' then next_state <= s0; end if;
			when s1 => if input = '1' then next_state <= s2; elsif input = '0' then next_state <= s0; end if;
			when s2 => if input = '1' then next_state <= s3; elsif input = '0' then next_state <= s0; end if;
			when s3 => if input = '0' then next_state <= s4; elsif input = '1' then next_state <= s3; end if;
			when s4 => if input = '1' then next_state <= s5; elsif input = '0' then next_state <= s0; end if;
			when s5 => if input = '1' then next_state <= s2; elsif input = '0' then next_state <= s0; end if;
			
			
		end case;
		
	end process;
	
	output <= '1' when p_state = s5 else '0';

end fsm_11101;
