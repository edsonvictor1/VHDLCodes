entity soma8b is
port(a,b: in bit_vector(7 downto 0);
	  s: out bit_vector(7 downto 0);
	  cin: in bit;
	  cout: out bit);
end soma8b;

architecture hardware of soma8b is

component soma1b is 
port(a,b,cin: in bit;
	  s,cout: out bit);
end component;

signal carrys: bit_vector(8 downto 0);

begin

s0: soma1b port map(a(0), b(0), carrys(0), s(0), carrys(1));
s1: soma1b port map(a(1), b(1), carrys(1), s(1), carrys(2));
s2: soma1b port map(a(2), b(2), carrys(2), s(2), carrys(3));
s3: soma1b port map(a(3), b(3), carrys(3), s(3), carrys(4));
s4: soma1b port map(a(4), b(4), carrys(4), s(4), carrys(5));
s5: soma1b port map(a(5), b(5), carrys(5), s(5), carrys(6));
s6: soma1b port map(a(6), b(6), carrys(6), s(6), carrys(7));
s7: soma1b port map(a(7), b(7), carrys(7), s(7), carrys(8));

carrys(0) <= cin;
cout <= carrys(8);

end hardware;