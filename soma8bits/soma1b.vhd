entity soma1b is 
port(a,b,cin: in bit;
	  s,cout: out bit);
end soma1b;

architecture soma of soma1b is
signal x: bit;

begin
x <= a xor b;
s <= x xor cin;
cout <= (a and b) or (x and cin);

end soma;