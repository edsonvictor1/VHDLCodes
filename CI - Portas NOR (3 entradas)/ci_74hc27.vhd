library ieee;
use ieee.std_logic_1164.all;

entity ci_74hc27 is
port( a,b,c: in bit_vector(2 downto 0);
		y: out bit_vector(2 downto 0));
end ci_74hc27;

architecture hardware of ci_74hc27 is
begin
y <=  not(a or b or c);
end hardware;