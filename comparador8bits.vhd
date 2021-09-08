LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY comparador8bits IS
PORT (a       : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      b       : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
	   igual   :  OUT  STD_LOGIC;
		amayor  :  OUT STD_LOGIC;
		bmayor  :  OUT STD_LOGIC);
END ENTITY comparador8bits;
------------------------------------------------------------------------
ARCHITECTURE structural OF comparador8bits IS 
SIGNAL igual_aux   : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL amayor_aux  : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL bmayor_aux  : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    Comparador4bits0: ENTITY work.comparador4_bits
	 PORT MAP( a(3)  => a(7),
	           a(2)  => a(6),
				  a(1)  => a(5),
	           a(0)  => a(4),
				  b(3)  => b(7),
	           b(2)  => b(6),
	           b(1)  => b(5),
				  b(0)  => b(4),
				  igual  => igual_aux(1),
				  amayor => amayor_aux(1),
				  bmayor  => bmayor_aux(1));
	 Comparador4bits1: ENTITY work.comparador4_bits
	 PORT MAP( a(3)  => a(3),
	           a(2)  => a(2),
				  a(1)  => a(1),
	           a(0)  => a(0),
				  b(3)  => b(3),
	           b(2)  => b(2),
	           b(1)  => b(1),
				  b(0)  => b(0),
				  igual  => igual_aux(0),
				  amayor => amayor_aux(0),
				  bmayor  => bmayor_aux(0));
				  amayor<=(amayor_aux(1) OR (( igual_aux(1) AND amayor_aux(0))));				  			
			     bmayor<=(bmayor_aux(1) OR (( igual_aux(1) AND bmayor_aux(0))));	
				  igual<=(( igual_aux(1) AND  igual_aux(0)));
END ARCHITECTURE structural;