library ieee;
use ieee.std_logic_1164.all;

entity cd4021b is
	port (serial_input,clk, ps: in std_logic;
          p:in std_logic_vector(7 downto 0);
			 q:out std_logic_vector(2 downto 0));
end cd4021b;

architecture behavior of cd4021b is 

signal state: std_logic_vector(7 downto 0); -- sinal para todas as saídas;

begin
     process(serial_input,clk, ps)  
		begin
          if(ps = '1') then
		     state <= p;
          elsif (rising_edge(clk)) then
			state(6 downto 0) <= state(7 downto 1);
			state(7) <= serial_input;
		end if;
	
	end process;
	
   q(0) <= state(1);
	q(1) <= state(2);
	q(2) <= state(3);
	
end behavior;