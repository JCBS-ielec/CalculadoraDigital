LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY Fulladder_4bit IS
PORT (a	  :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	   b	  :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		s	  :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		Cin  :  IN STD_LOGIC							);
END ENTITY Fulladder_4bit;
-------------------------------------------------------
ARCHITECTURE Structural OF Fulladder_4bit IS
SIGNAL Cin_aux	 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL S_aux : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
		cin_aux(0)<=Cin; 
	   s <= "000" & Cin_aux(4) & S_aux;
		Full_Adder0 : ENTITY work.fulladder
		PORT MAP ( a => a(0),
					  b => b(0),
					  s => S_aux(0),
					  cout => Cin_aux(1),
					  cin => Cin_aux(0));
					  
		Full_Adder1 : ENTITY work.fulladder
		PORT MAP ( a => a(1),
					  b => b(1),
					  s => S_aux(1),
					  cout => Cin_aux(2),
					  cin => Cin_aux(1));
					  
		Full_Adder2 : ENTITY work.fulladder
		PORT MAP ( a => a(2),
					  b => b(2),
					  s => S_aux(2),
					  cout => Cin_aux(3),
					  cin => Cin_aux(2));
		Full_Adder3 : ENTITY work.fulladder
		PORT MAP ( a => a(3),
					  b => b(3),
					  s => S_aux(3),
					  cout => Cin_aux(4),
					  cin => Cin_aux(3));
					 
END ARCHITECTURE;