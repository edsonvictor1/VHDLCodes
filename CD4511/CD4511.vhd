library ieee;
use ieee.std_logic_1164.all;

entity CD4511 is
	port(d: in std_logic_vector(3 downto 0); 
		  le, lt, bl: in std_logic;
		  output: out std_logic_vector(6 downto 0));
end CD4511;

architecture behavior of CD4511 is

signal d_aux: std_logic_vector(3 downto 0);
signal decoder: std_logic_vector(6 downto 0); -- sinal decodificador
signal driver: std_logic_vector(6 downto 0); -- sinal que liga os leds

begin

driver <= "1111111" when lt = '0' 
			 else decoder;
			 
d_aux <= d when le = '0' 
			else d_aux;

       
decoder <=       "0000000" when bl = '0' else 
			  "0111111" when d_aux = "0000" else
			  "0000110" when d_aux = "0001" else
			  "1011011" when d_aux = "0010" else
			  "1001111" when d_aux = "0011" else
			  "1001110" when d_aux = "0100" else
			  "1101101" when d_aux = "0101" else
			  "1111101" when d_aux = "0110" else
			  "0000111" when d_aux = "0111" else
			  "1111111" when d_aux = "1000" else
			  "1101111" when d_aux = "1001" else
			  "0000000";
			  
			 
output <= driver;

end behavior;