entity testbench is
end testbench;

architecture test of testbench is

component checksum is
port(B1,B2,CS: in bit_vector(7 downto 0);
	  saida: out bit);
end component;


signal B1, B2,CS: bit_vector(7 downto 0);
signal saida: bit;

begin

DUT: check port map(B1, B2, CS, saida);

B1 <= "01010010",
		"10001010" after 10 ns,
		"00010100" after 20 ns,
		"00111001" after 30 ns,
		"00000000" after 40 ns;
		
B2 <= "01110101",
		"10101001" after 10 ns,
		"01000110" after 20 ns,
		"10111011" after 30 ns,
		"00000000" after 40 ns;
		
CS <= "01111011",
		"10100011" after 10 ns,
		"01000111" after 20 ns,
		"10110101" after 30 ns,
		"00000000" after 40 ns;

		
end test;