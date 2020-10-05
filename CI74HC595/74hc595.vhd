library ieee;
use ieee.std_logic_1164.all;

entity ci74hc595 is
	port (oe,rclk,srclr,srclk,ser: in std_logic;
          q:out std_logic_vector(7 downto 0);
			qh:out std_logic);
end ci74hc595;

architecture ci of ci74hc595 is 

signal serial_out:std_logic_vector(7 downto 0):=(others => '0'); --sinal S que sai de um ff e entra no outro, do primeiro ate o ultimo ff

signal parallel_out:std_logic_vector(7 downto 0):=(others => '0');-- sinal R que ai de um ff e entra no outro, do primeiro ate o ultimo ff

begin

  r: process(srclr,srclk,rclk)  
		begin
            if(srclr='0') then --reset prioridade maior, se for 0 o sr recebe 0 em todos 
				serial_out<=(others => '0');
          elsif (srclk'event and srclk = '1') then --se o reset for 1 e ocorrer um evento no clock (que entra em todos da primeira coluna de ff), o sinal sr (na posição n-2)  recebe o sinal anterior na posição anterior
          serial_out(6 downto 0)<= serial_out(7 downto 1);
				serial_out(7)<=ser; -- o primeiro sr recebe ser 
			end if;
        if(rclk'event and rclk = '1') then -- se o clock da segunda coluna tiver em 0, o sinal R (div) recebe o sinal S (reg)
			parallel_out <=serial_out;
		end if;
		
	q<= (parallel_out) when oe = '0' else 
		q := (others => 'Z');
	qh<= serial_out(0);
	end process;
	
end ci;