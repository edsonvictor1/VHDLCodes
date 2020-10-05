library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is 
	component ci74hc595 is
		
	port (oe,rclk,srclr,srclk,ser: in std_logic;
          q:out std_logic_vector(7 downto 0);
			qh:out std_logic);
	end component;
	
	signal oe,rclk,srclr,srclk,ser: std_logic;
	signal q: std_logic_vector(7 downto 0);
    signal qh: std_logic;
	signal data_test: std_logic_vector(15 downto 0) := "0001000000001000";--< Sentido da transmissão
begin

	dut: ci74hc595 port map (oe,rclk,srclr,srclk,ser,q,qh);
	
	process 
	begin
            
        srclr<= '0',
       			'1' after 10 ns; 
        
		oe<= '0',
             '1' after 105 ns;
      
       
		for i in 0 to 15 loop
			srclk<= '0';
            ser<=data_test(i);
            rclk<='1';
            wait for 5 ns;
			srclk<= '1';
            rclk<='0';
            wait for 5 ns;
            end loop;
        wait;
        
          
		
	end process;
end test;