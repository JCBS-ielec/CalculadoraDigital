LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY CalculadoraDigital_tb IS
END ENTITY CalculadoraDigital_tb;
-------------------------------------
ARCHITECTURE testbench OF CalculadoraDigital_tb IS
SIGNAL Numero1  : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Numero2  : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL sel		 : STD_LOGIC_VECTOR (1 DOWNTO 0); 
SIGNAL Display0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL Display1 : STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL Display2 : STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL Display3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
BEGIN
TBCalculadoraDigital : ENTITY WORK.CalculadoraDigital
							  PORT MAP(Numero1  => Numero1,
										  Numero2  => Numero2,
										  sel      => sel,
										  Display0 => Display0,
										  Display1 => Display1,
										  Display2 => Display2,
										  Display3 => Display3);
signal_generation: PROCESS
	BEGIN
	Numero1 <= "0011";
	Numero2 <= "0100";
	sel	  <= "11";
	WAIT FOR 200 ns;
	sel	  <= "01";
	WAIT FOR 200 ns;
	sel	  <= "00";
	WAIT FOR 200 ns;
	sel	  <= "10";
	WAIT FOR 200 ns;
	Numero2 <= "0011";
	Numero1 <= "0100";
	sel	  <= "11";
	WAIT FOR 200 ns;
	sel	  <= "01";
	WAIT FOR 200 ns;
	sel	  <= "00";
	WAIT FOR 200 ns;
	Numero1 <= "1111";
	sel	  <= "11";
	WAIT FOR 200 ns;
	sel	  <= "01";
	WAIT FOR 200 ns;
	sel	  <= "00";
	WAIT FOR 200 ns;
	Numero1 <= "0011";
	Numero2 <= "1111";
	sel	  <= "11";
	WAIT FOR 200 ns;
	sel	  <= "01";
	WAIT FOR 200 ns;
	sel	  <= "00";
	WAIT FOR 200 ns;
	Numero1 <= "1001";
	Numero2 <= "1001";
	sel	  <= "11";
	WAIT FOR 200 ns;
	sel	  <= "01";
	WAIT FOR 200 ns;
	sel	  <= "00";
	END PROCESS signal_generation;
END ARCHITECTURE testbench;