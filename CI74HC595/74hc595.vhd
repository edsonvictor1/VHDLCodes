library ieee;
use ieee.std_logic_1164.all;

entity ci74hc595 is
	port (oe,rclk,srclr,srclk,ser: in std_logic;
          q:out std_logic_vector(7 downto 0);
			qh:out std_logic);
end ci74hc595;

architecture ci of ci74hc595 is 

signal serial_out:std_logic_vector(7 downto 0) := (others => '0');
signal parallel_out:std_logic_vector(7 downto 0) := (others => '0'); 

begin

  r: process(srclr,srclk,rclk)  
		begin
			
          if(srclr='0') then
		     serial_out <= (others => '0');
          elsif (srclk'event and srclk='1') then 
          serial_out(6 downto 0) <= serial_out(7 downto 1);
				serial_out(7) <= ser;
			end if;
        if(rclk'event and rclk='1') then 
			parallel_out <= serial_out;
		end if;
	q <= parallel_out when oe ='0' else 
		(others => 'Z');
	qh <= serial_out(0);
	end process;
	
end ci;
