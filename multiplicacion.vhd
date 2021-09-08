--------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY multiplicacion IS

      PORT( a   :    IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
	       	b   :    IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
				cin :    IN    STD_LOGIC;
				p   :    OUT   STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY multiplicacion;
------------------------------------------------------
ARCHITECTURE Structural OF multiplicacion IS
       SIGNAL cin_aux :   STD_LOGIC_VECTOR(10 DOWNTO 0);
		 SIGNAL a_aux   :   STD_LOGIC_VECTOR(8 DOWNTO 0);
		 SIGNAL b_aux   :   STD_LOGIC_VECTOR(5 DOWNTO 0);
       SIGNAL s	    :   STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN
 
            a_aux(0)<=(b(0) AND a(1));
		      a_aux(1)<=(b(1) AND a(1));		
				a_aux(2)<=(b(2) AND a(0));
				a_aux(3)<=(b(0) AND a(3));
				a_aux(4)<=(b(2) AND a(1));
				a_aux(5)<=(b(3) AND a(0));
				a_aux(6)<=(b(2) AND a(2));
				a_aux(7)<=(b(3) AND a(1));
				a_aux(8)<=(b(3) AND a(2));
				b_aux(0)<=(a(0) AND b(1));
				b_aux(1)<=(b(0) AND a(2));
				b_aux(2)<=(b(1) AND a(2));
				b_aux(3)<=(b(1) AND a(3));
				b_aux(4)<=(b(2) AND a(3));
				b_aux(5)<=(b(3) AND a(3));
	         p(0)<= (b(0) AND a(0));
			  
			  fulladder_0: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(0), 
			           b=>b_aux(0),
						  s=>p(1),
						  cin=>cin,
						  cout=>cin_aux(0));
						  
			  fulladder_1: ENTITY WORK.fulladder
			  PORT MAP(a=> a_aux(1), 
			           b=>b_aux(1),
						  s=>s(0),
						  cin=>cin,
						  cout=>cin_aux(1));
						  
				fulladder_2: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(2), 
			           b=>s(0),
						  s=>p(2),
						  cin=>cin_aux(0),
						  cout=>cin_aux(2));
						  
			  fulladder_3: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(3),
			           b=>b_aux(2),
						  s=>s(1),
						  cin=>cin,
						  cout=>cin_aux(3));
						  
				fulladder_4: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(4),
			           b=>s(1),
		   			  s=>s(2),
						  cin=>cin_aux(1),
						  cout=>cin_aux(4));
				
				fulladder_5: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(5),
			           b=>s(2),
		   			  s=>p(3),
						  cin=>cin_aux(2),
						  cout=>cin_aux(5));
			  
			  fulladder_6: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(6),
			           b=>b_aux(3),
		   			  s=>s(3),
						  cin=>cin_aux(3),
						  cout=>cin_aux(6));
						  
				fulladder_7: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(7),
			           b=>s(3),
		   			  s=>s(4),
						  cin=>cin_aux(4),
						  cout=>cin_aux(7));
						  
				fulladder_8: ENTITY WORK.fulladder
			  PORT MAP(a=>s(4),
			           b=>cin,
		   			  s=>p(4),
						  cin=>cin_aux(5),
						  cout=>cin_aux(8));
			 
			 fulladder_9: ENTITY WORK.fulladder
			  PORT MAP(a=>a_aux(8),
			           b=>b_aux(4),
		   			  s=>s(5),
						  cin=>cin_aux(6),
						  cout=>cin_aux(9));
						  
				fulladder_10: ENTITY WORK.fulladder
			  PORT MAP(a=>cin_aux(8),
			           b=>s(5),
		   			  s=>p(5),
						  cin=>cin_aux(7),
						  cout=>cin_aux(10));
			  
			  fulladder_11: ENTITY WORK.fulladder
			  PORT MAP(a=>cin_aux(10),
			           b=>b_aux(5),
		   			  s=>p(6),
						  cin=>cin_aux(9),		  
						  cout=>p(7));
END ARCHITECTURE;