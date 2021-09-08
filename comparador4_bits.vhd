LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY comparador4_bits IS
PORT (a   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      b   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	   igual  :  OUT  STD_LOGIC;
		amayor  :  OUT STD_LOGIC;
		bmayor  :  OUT STD_LOGIC);
END ENTITY comparador4_bits;
------------------------------------------------------------------------
ARCHITECTURE structural OF comparador4_bits IS 
SIGNAL igual_aux   : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL amayor_aux  : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL bmayor_aux  : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    Comparador0: ENTITY work.comparador
	 PORT MAP( a(1)  => a(3),
	           a(0)  => a(2),
	           b(1)  => b(3),
				  b(0)  => b(2),
				  igual  => igual_aux(1),
				  amayor => amayor_aux(1),
				  bmayor  => bmayor_aux(1));
	
    Comparador1: ENTITY work.comparador
	 PORT MAP( a(1)  => a(1),
	           a(0)  => a(0),
	           b(1)  => b(1),
				  b(0)  => b(0),
				  igual  => igual_aux(0),
				  amayor => amayor_aux(0),
				  bmayor  => bmayor_aux(0));
				  
				  amayor<=(amayor_aux(1) OR (( igual_aux(1) AND amayor_aux(0))));				  			
			     bmayor<=(bmayor_aux(1) OR (( igual_aux(1) AND bmayor_aux(0))));	
				  igual<=(( igual_aux(1) AND  igual_aux(0)));	 
				   
END ARCHITECTURE structural;
	
