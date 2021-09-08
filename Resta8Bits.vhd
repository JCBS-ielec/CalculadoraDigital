LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY Resta8Bits IS
PORT (a    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      b    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	   cin  : IN STD_LOGIC;
	   s    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout : OUT STD_LOGIC);
END ENTITY Resta8Bits;
------------------------------------------------------------------------
ARCHITECTURE structural OF Resta8Bits IS 
SIGNAL cin_aux : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
cin_aux(0)<=cin;
	Restador_4bits_0: ENTITY work.restador4_bits_puro
	 PORT MAP( a(0)  => a(0),
				  a(1)  => a(1),
				  a(2)  => a(2),
				  a(3)  => a(3),
	           b(0)  => b(0),
				  b(1)  => b(1),
				  b(2)  => b(2),
				  b(3)  => b(3),
				  s(0)  => s(0),
				  s(1)  => s(1),
				  s(2)  => s(2),
				  s(3)  => s(3),
				  cout  => cin_aux(1),
				  cin   => cin_aux(0));
	Restador_4bits_1: ENTITY work.restador4_bits_puro
	 PORT MAP( a(0)  => a(4),
				  a(1)  => a(5),
				  a(2)  => a(6),
				  a(3)  => a(7),
	           b(0)  => b(4),
				  b(1)  => b(5),
				  b(2)  => b(6),
				  b(3)  => b(7),
				  s(0)  => s(4),
				  s(1)  => s(5),
				  s(2)  => s(6),
				  s(3)  => s(7),
				  cout  => cout,
				  cin   => cin_aux(1));
END ARCHITECTURE;