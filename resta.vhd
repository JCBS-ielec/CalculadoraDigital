LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY resta IS
PORT (a     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      b     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		sel   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	   cin   : IN  STD_LOGIC;
		signo : OUT STD_LOGIC;
	   s     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
		
END ENTITY resta;
------------------------------------------------------------------------
ARCHITECTURE structural OF resta IS 
SIGNAL  igual  :  STD_LOGIC;
SIGNAL  amayor :  STD_LOGIC;
SIGNAL  bmayor :  STD_LOGIC;
SIGNAL  a_aux  :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL  b_aux  :  STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    Comparador0: ENTITY work.comparador4_bits
      PORT MAP ( a       => a,
	       	     b       => b,
				     igual   => igual,
				     amayor  => amayor,
				     bmayor  => bmayor);
					  
	  WITH amayor SELECT
	       a_aux <= a WHEN '1' ,
	                b WHEN OTHERS;
	  WITH amayor SELECT
		    b_aux <= b WHEN '1' ,
	                a WHEN OTHERS;
		WITH bmayor SELECT 
          signo <= '1' WHEN '1',	
	                '0' WHEN OTHERS;	
					
		Restador0: ENTITY work.restador4_bits 
		PORT MAP ( a   => a_aux,
	       	     b   => b_aux,
				     s   => s,
				     cin => cin );
				     
					  
END ARCHITECTURE structural;