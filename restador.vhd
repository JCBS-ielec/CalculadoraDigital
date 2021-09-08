LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY restador IS
   PORT(  a  :  IN STD_LOGIC;
	       b  :  IN STD_LOGIC;
			 cin  :  IN STD_LOGIC;
			 s  :  OUT STD_LOGIC;
			 cout  :  OUT STD_LOGIC);
END ENTITY restador;
---------------------------------------------------------------
ARCHITECTURE gateLevel OF restador IS
    
BEGIN 
	
   s <= a XOR b XOR cin;
   cout <= ((NOT a) AND  b) OR ( b AND cin) OR ((NOT a) AND cin);
	
END ARCHITECTURE gateLevel;