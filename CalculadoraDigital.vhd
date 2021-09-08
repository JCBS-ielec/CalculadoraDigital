LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY CalculadoraDigital IS
   PORT(  Numero1  :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	       Numero2  :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			 sel      :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			 Display0 :  OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			 Display1 :  OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			 Display2 :  OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
			 Display3 :  OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END ENTITY CalculadoraDigital;
ARCHITECTURE structural OF CalculadoraDigital IS 
SIGNAL	suma	   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL   resta	   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	mult 	   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	cout 	   : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL   Unidades : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	Decenas  : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL   signo    : STD_LOGIC;
SIGNAL   signCheck: STD_LOGIC;
SIGNAL   cin      : STD_LOGIC;

BEGIN
Cin<='0';
Fulladder_4bit   			: ENTITY WORK.Fulladder_4bit
								  PORT MAP(a 	=> Numero1,
										     b   => Numero2,
											  s   => suma,
											  cin => cin);
Restar			  			: ENTITY WORK.Resta
								  PORT MAP(a	  => Numero1,
											  b	  => Numero2,
											  s	  => resta,
											  sel   => sel,
											  signo => signo,
											  cin	  => cin);
Multiplicacion	  			 : ENTITY WORK.multiplicacion
								   PORT MAP(a  => Numero1,
											   b  => Numero2,
											   p  => mult,
											   cin=> cin);
WITH sel SELECT
signCheck<=signo WHEN "01",
		 '0' WHEN OTHERS;
SeparadorDeDigito        : ENTITY WORK.SeparadorDeDigito
						         PORT MAP(a		   => Numero1,   
												b		   => Numero2,  
												suma	   => suma,    
												resta	   => resta,   
												mult 	   => mult,    
												sel      => sel,    
												signo    => signCheck,    
												cin	   => cin,	  
												Unidades => Unidades,    
												Decenas  => Decenas); 
bin_to_sseg_until_nine01  :ENTITY WORK.bin_to_sseg_until_nine
									PORT MAP(bin  => Unidades,
									         sseg => Display0);
bin_to_sseg_until_nine02  :ENTITY WORK.bin_to_sseg_until_nine
									PORT MAP(bin  => Decenas,
									         sseg => Display1);
bin_to_sseg_until_nine03  :ENTITY WORK.bin_to_sseg_until_nine_no_minus
									PORT MAP(bin  => Numero2,
									         sseg => Display2);
bin_to_sseg_until_nine04  :ENTITY WORK.bin_to_sseg_until_nine_no_minus
									PORT MAP(bin  => Numero1,
									         sseg => Display3);
												
		
END ARCHITECTURE;