entity testbench is
end testbench;

architecture test of testbench is

component par4 is
port (a,b,c,d: in bit;
		s: out bit);
end component;

signal a, b, c, d, s: bit:='0';

begin

DUT: par4 port map(A,B,C,D,S);

A <= 	'1' after 10 ns,
		'1' after 20 ns,
		'1' after 30 ns,
		'0' after 40 ns,
		'0' after 50 ns;
		
B <= 	'0' after 10 ns,
		'1' after 20 ns,
		'1' after 30 ns,
		'0' after 40 ns,
		'0' after 50 ns;
		
C <= 	'1' after 10 ns,
		'1' after 20 ns,
		'0' after 30 ns,
		'1' after 40 ns,
		'0' after 50 ns;
		
D <= 	'1' after 10 ns,
		'0' after 20 ns,
		'0' after 30 ns,
		'0' after 40 ns,
		'0' after 50 ns;

end test;
