library ieee;
use ieee.std_logic_1164.all;

entity ci_74hc00 is 
port( a,b: in bit_vector(3 downto 0);
		y: out bit_vector(3 downto 0));
end ci_74hc00;

architecture hardware of ci_74hc00 is
begin

y <= a nand b;

end hardware;