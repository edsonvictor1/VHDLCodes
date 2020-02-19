library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;


architecture test of testbench is

component ci_74hc27 is
port( a,b,c: in bit_vector(2 downto 0);
		y: out bit_vector(2 downto 0));
end component;

signal entrada1, entrada2, entrada3: bit_vector(2 downto 0);
signal saida: bit_vector(2 downto 0);

begin

DUT: ci_74hc27 port map(entrada1, entrada2, saida);

entrada1 <= "000",
				"101" after 10 ns,
				"110" after 20 ns,
				"111" after 30 ns,
				"011" after 40 ns;
				
entrada2 <= "000",
				"100" after 10 ns,
				"011" after 20 ns,
				"111" after 30 ns,
				"010" after 40 ns;
				
entrada3 <= "000",
				"101" after 10 ns,
				"010" after 20 ns,
				"101" after 30 ns,
				"110" after 40 ns;
end test;