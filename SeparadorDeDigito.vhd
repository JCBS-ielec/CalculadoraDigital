LIBRARY IEEE;
USE ieee.std_logic_1164.all;
---------------------------------------------------------
ENTITY SeparadorDeDigito IS
	PORT(	a		   :    IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			b		   :    IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			suma	   :    IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			resta	   :    IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			mult 	   :    IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			sel      :    IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			signo    :    IN STD_LOGIC;
			cin	   :	  IN STD_LOGIC;
			Unidades :    OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Decenas  :    OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY SeparadorDeDigito;
ARCHITECTURE structural OF SeparadorDeDigito IS
SIGNAL amayor     : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL bmayor     : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL igual      : STD_LOGIC_VECTOR(11 DOWNTO 0); 
SIGNAL a_aux	   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL b_aux	   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL cout       : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL rta        : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL diez       : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division1  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division2  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division3  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division4  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division5  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division6  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division7  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division8  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division9  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL division10 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s1 		   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s2 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s3 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s4 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s5 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s6 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s7 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s8 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s9 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s10 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL check      : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL check2     : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL invalido   : STD_LOGIC;

---------------------------------------------------------
BEGIN
diez<="00001010";
a_aux<="0000" & a;
b_aux<="0000" & b;
Mux: ENTITY work.Mux4_2_with_select
      PORT MAP ( suma    => suma,
	       	     resta   => resta,
				     mult    => mult,
				     sel     => sel,
				     rta     => rta);
Comparador0: ENTITY work.comparador8bits --99
				 PORT MAP (a       => rta,
							  b       => diez,
							  igual   => igual(0),
							  amayor  => amayor(0),
							  bmayor  => bmayor(0));
WITH bmayor(0) SELECT
division1 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador0:   ENTITY work.Resta8Bits
				 PORT MAP (a       => rta,
							  b       => division1,
							  cin     => cin,
							  s       => s1,
							  cout  	 => cout(0));
Comparador1: ENTITY work.comparador8bits
				 PORT MAP (a       => s1,
							  b       => diez,
							  igual   => igual(1),
							  amayor  => amayor(1),
							  bmayor  => bmayor(1));
WITH bmayor(1) SELECT
division2 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador1:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s1,
							  b       => division2,
							  cin     => cin,
							  s       => s2,
							  cout  	 => cout(1));
Comparador2: ENTITY work.comparador8bits
				 PORT MAP (a       => s2,
							  b       => diez,
							  igual   => igual(2),
							  amayor  => amayor(2),
							  bmayor  => bmayor(2));
WITH bmayor(2) SELECT
division3 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador2:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s2,
							  b       => division3,
							  cin     => cin,
							  s       => s3,
							  cout  	 => cout(2));
Comparador3: ENTITY work.comparador8bits
				 PORT MAP (a       => s3,
							  b       => diez,
							  igual   => igual(3),
							  amayor  => amayor(3),
							  bmayor  => bmayor(3));
WITH bmayor(3) SELECT
division4 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador3:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s3,
							  b       => division4,
							  cin     => cin,
							  s       => s4,
							  cout  	 => cout(3));
Comparador4: ENTITY work.comparador8bits
				 PORT MAP (a       => s4,
							  b       => diez,
							  igual   => igual(4),
							  amayor  => amayor(4),
							  bmayor  => bmayor(4));
WITH bmayor(4) SELECT
division5 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador4:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s4,
							  b       => division5,
							  cin     => cin,
							  s       => s5,
							  cout  	 => cout(4));
Comparador5: ENTITY work.comparador8bits
				 PORT MAP (a       => s5,
							  b       => diez,
							  igual   => igual(5),
							  amayor  => amayor(5),
							  bmayor  => bmayor(5));
WITH bmayor(5) SELECT
division6 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador5:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s5,
							  b       => division6,
							  cin     => cin,
							  s       => s6,
							  cout  	 => cout(5));
Comparador6: ENTITY work.comparador8bits
				 PORT MAP (a       => s6,
							  b       => diez,
							  igual   => igual(6),
							  amayor  => amayor(6),
							  bmayor  => bmayor(6));
WITH bmayor(6) SELECT
division7 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador6:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s6,
							  b       => division7,
							  cin     => cin,
							  s       => s7,
							  cout  	 => cout(6));
Comparador7: ENTITY work.comparador8bits
				 PORT MAP (a       => s7,
							  b       => diez,
							  igual   => igual(7),
							  amayor  => amayor(7),
							  bmayor  => bmayor(7));
WITH bmayor(7) SELECT
division8 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador7:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s7,
							  b       => division8,
							  cin     => cin,
							  s       => s8,
							  cout  	 => cout(7));
Comparador8: ENTITY work.comparador8bits
				 PORT MAP (a       => s8,
							  b       => diez,
							  igual   => igual(8),
							  amayor  => amayor(8),
							  bmayor  => bmayor(8));
WITH bmayor(8) SELECT
division9 <= "00000000" WHEN '1',
			    "00001010" WHEN OTHERS;
Restador8:   ENTITY work.Resta8Bits
				 PORT MAP (a       => s8,
							  b       => division9,
							  cin     => cin,
							  s       => s9,
							  cout  	 => cout(8));
Comparador9: ENTITY work.comparador8bits
				 PORT MAP (a       => s9,
							  b       => diez,
							  igual   => igual(9),
							  amayor  => amayor(9),
							  bmayor  => bmayor(9));
ComparadorA: ENTITY work.comparador8bits
				 PORT MAP (a       => a_aux,
							  b       => diez,
							  igual   => igual(10),
							  amayor  => amayor(10),
							  bmayor  => bmayor(10));
ComparadorB: ENTITY work.comparador8bits
				 PORT MAP (a       => b_aux,
							  b       => diez,
							  igual   => igual(11),
							  amayor  => amayor(11),
							  bmayor  => bmayor(11));
invalido <= (NOT bmayor(10)) OR (NOT bmayor(11));
check    <= bmayor(9 DOWNTO 0);
check2   <= bmayor(9) & invalido;
 WITH invalido & signo & check SELECT
 decenas <= "1001" WHEN '0' & '0' & "1000000000",
				"1000" WHEN '0' & '0' & "1100000000",
				"0111" WHEN '0' & '0' & "1110000000",
				"0110" WHEN '0' & '0' & "1111000000",
				"0101" WHEN '0' & '0' & "1111100000",
				"0100" WHEN '0' & '0' & "1111110000",
				"0011" WHEN '0' & '0' & "1111111000",
				"0010" WHEN '0' & '0' & "1111111100",
				"0001" WHEN '0' & '0' & "1111111110",
            "0000" WHEN '0' & '0' & "1111111111",
				"1010" WHEN '0' & '1' & "1111111111", --Menos
				"1111" WHEN OTHERS;						  --Invalido
WITH check2 SELECT
unidades <= s9(3 DOWNTO 0) WHEN "10",
			   "1111" WHEN OTHERS;


	
END ARCHITECTURE;