library ieee;
use ieee.std_logic_1164.all;

entity soma4b is
port(	a,b: in bit_vector(3 downto 0);
		s: out bit_vector(3 downto 0);
		cin: in bit;
		cout: out bit);
end soma4b;
	
architecture hardware of soma4b is

component soma1b is
port(a,b,cin: in bit;
		s,cout: out bit);
end component;

signal carrys: bit_vector(4 downto 0);
	
begin

s0: soma1b port map(a(0), b(0), carrys(0), s(0), carrys(1));
s1: soma1b port map(a(1), b(1), carrys(1), s(1), carrys(2));
s2: soma1b port map(a(2), b(2), carrys(2), s(2), carrys(3));
s3: soma1b port map(a(3), b(3), carrys(3), s(3), carrys(4));

carrys(0) <= cin;
cout <= carrys(4);

end hardware;