library ieee;
use ieee.std_logic_1164.all;

entity soma1b is
port(a,b,cin: in bit;
		s, cout: out bit);
end soma1b;

architecture soma of soma1b is
signal x: bit;

begin

x <= a xor b;
s <= cin xor x;
cout <= (a and b) or (cin and x);

end soma;