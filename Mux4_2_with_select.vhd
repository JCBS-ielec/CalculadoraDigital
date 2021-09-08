LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------
ENTITY Mux4_2_with_select IS
	PORT(	suma	 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			resta	 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			mult 	 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			sel    : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			rta    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY Mux4_2_with_select;
-----------------------------
ARCHITECTURE functional OF Mux4_2_with_select IS 
BEGIN
	WITH sel SELECT
	rta <= suma  WHEN "11",	
		    resta WHEN "01",
			 mult  WHEN OTHERS;
END ARCHITECTURE functional;
