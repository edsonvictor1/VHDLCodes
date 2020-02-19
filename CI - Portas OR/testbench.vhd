library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;


architecture test of testbench is

component ci_74hc32 is
port( a,b: in bit_vector(3 downto 0);
		y: out bit_vector(3 downto 0));
end component;

signal entrada1, entrada2: bit_vector(3 downto 0);
signal saida: bit_vector(3 downto 0);

begin

DUT: ci_74hc32 port map(entrada1, entrada2, saida);

entrada1 <= "0111",
				"1011" after 10 ns,
				"1100" after 20 ns,
				"1111" after 30 ns,
				"0110" after 40 ns;
				
entrada2 <= "1010",
				"1001" after 10 ns,
				"0110" after 20 ns,
				"1110" after 30 ns,
				"0101" after 40 ns;
end test;