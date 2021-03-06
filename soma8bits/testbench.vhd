entity testbench is
end testbench;

architecture test of testbench is

component soma8b is
port(a,b: in bit_vector(7 downto 0);
		s: out bit_vector(7 downto 0);
		cin: in bit;
		cout: out bit);
end component;

signal a,b,s: bit_vector(7 downto 0);
signal cin, cout: bit;

begin

DUT: soma8b port map(a,b,s,cin,cout);

a <=  "01010101",
		"10001000" after 10 ns,
		"00010001" after 20 ns,
		"00110011" after 30 ns,
		"00000000" after 40 ns;
b <=  "01110111",
		"10101010" after 10 ns,
		"01000100" after 20 ns,
		"10111011" after 30 ns,
		"00000000" after 40 ns;

cin <= '0';
		
end test;