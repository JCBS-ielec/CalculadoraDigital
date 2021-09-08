LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY Comparador IS
   PORT(  a  :  IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	       b  :  IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			 igual  :  OUT  STD_LOGIC;
			 amayor  :  OUT STD_LOGIC;
			 bmayor  :  OUT STD_LOGIC);
END ENTITY Comparador;
---------------------------------------------------------------
ARCHITECTURE gateLevel OF Comparador IS
    
BEGIN 
	
   igual <= ( (NOT((a(1) XOR b(1)))) AND (NOT(( a(0) XOR b(0)))));
   amayor <= ((a(1) AND (NOT b(1))) OR (a(0) AND (NOT b(1)) AND (NOT b(0))) OR (a(1) AND a(0) AND (NOT b(0))) );
	bmayor <= (((NOT a(1)) AND b(1)) OR ((NOT a(0)) AND b(0) AND b(1)) OR ((NOT a(1)) AND (NOT a(0)) AND b(0)));
	
	
END ARCHITECTURE gateLevel;
