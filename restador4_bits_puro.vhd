LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY restador4_bits_puro IS
PORT (a    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      b    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	   cin  : IN STD_LOGIC;
	   s    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		cout : OUT STD_LOGIC);
END ENTITY restador4_bits_puro;
------------------------------------------------------------------------
ARCHITECTURE structural OF restador4_bits_puro IS 
SIGNAL cin_aux : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL s_aux : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    cin_aux(0)<=cin;
	 s <= s_aux;
	 Restador0: ENTITY work.restador
	 PORT MAP( a  => a(0),
	           b  => b(0),
				  s  => s_aux(0),
				  cout  => cin_aux(1),
				  cin  => cin_aux(0));
	
    Restador1: ENTITY work.restador
	 PORT MAP( a  => a(1),
	           b  => b(1),
				  s  => s_aux(1),
				  cout  => cin_aux(2),
				  cin  => cin_aux(1));	
				  
	Restador2: ENTITY work.restador
	 PORT MAP( a  => a(2),
	           b  => b(2),
				  s  => s_aux(2),
				  cout  => cin_aux(3),
				  cin  => cin_aux(2));
				  
	Restador3: ENTITY work.restador
	 PORT MAP( a  => a(3),
	           b  => b(3),
				  s  => s_aux(3),
				  cout  => cin_aux(4),
				  cin  => cin_aux(3));
				  
	cout<=cin_aux(4);			 
				  
END ARCHITECTURE structural;