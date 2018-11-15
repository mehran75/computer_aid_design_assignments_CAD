-------------------------------------------------------------------------------
--
-- Title       : fsm_odd_one
-- Design      : CAD_HW03_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fsm_odd_one.vhd
-- Generated   : Tue Nov 13 00:29:26 2018
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
--{entity {fsm_odd_one} architecture {fsm_odd_one}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fsm_odd_one is
	 port(
		 input : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 output : out STD_LOGIC
	     );
end fsm_odd_one;

--}} End of automatically maintained section

architecture fsm_odd_one of fsm_odd_one is
	type FSM is (s0,s1,odd_controll,s2,s3,s4,s5);
	
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
	
	
	process(input,p_state) is 
	begin
		
		case p_state is
			
			when s0 => if input = '1' then next_state <= s1; elsif input = '0' then next_state <= s0; end if;
			when s1 => if input = '1' then next_state <= odd_controll; elsif input = '0' then next_state <= s2; end if;
			when odd_controll =>
						if input = '1' then next_state <= s1; elsif input = '0' then next_state <= s0; end if;
			when s2 => if input = '1' then next_state <= s1; elsif input = '0' then next_state <= s3; end if;
			when s3 => if input = '1' then next_state <= s4; elsif input = '0' then next_state <= s3; end if;
			when s4 => if input = '1' then next_state <= s5; elsif input = '0' then next_state <= s2; end if;
			when s5 => if input = '1' then next_state <= s0; elsif input = '0' then next_state <= s0; end if;
			
			
		end case;
		
	end process;
	
	output <= '1' when p_state = s5 else '0';

end fsm_odd_one;
