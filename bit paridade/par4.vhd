entity par4 is

	port (a,b,c,d: in bit;
			s: out bit);
	end par4;
	
architecture par of par4 is
begin
	s <= a xor b xor c xor d;
	end par;