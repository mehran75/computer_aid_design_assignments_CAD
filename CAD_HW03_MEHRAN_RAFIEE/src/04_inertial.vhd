-------------------------------------------------------------------------------
--
-- Title       : \04_inertial\
-- Design      : CAD_HW03_MEHRAN_RAFIEE
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : 04_inertial.vhd
-- Generated   : Tue Nov 13 10:57:36 2018
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
--{entity {\04_inertial\} architecture {\04_inertial\}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity \04_inertial\ is
	 port(
		 qin : in STD_LOGIC;
		 Y1 : out STD_LOGIC;
		 Y2 : out STD_LOGIC;
		 Y3 : out STD_LOGIC;
		 Y4 : out STD_LOGIC;
		 Y5 : out STD_LOGIC
	     );
end \04_inertial\;

--}} End of automatically maintained section

architecture \04_inertial\ of \04_inertial\ is
begin

	Y1 <= qin;
	Y2 <= qin after 1ns;
	Y3 <= inertial qin after 1ns;
	Y4 <= transport qin after 1ns;
	Y5 <= reject 500ps inertial qin after 1ns;

end \04_inertial\;
