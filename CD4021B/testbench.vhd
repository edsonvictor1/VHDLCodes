library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is 
	component CD4021B is
		
	port (serial_input,clk,ps:	in	std_logic;
		p:	in		std_logic_vector(7 downto 0);
		q:	out		std_logic_vector(2 downto 0));
	end component;
	
	signal clk,ps: std_logic;
   signal serial_input: std_logic:= '0';
	signal p: std_logic_vector(7 downto 0):= "10100101";
   signal q: std_logic_vector(2 downto 0) ;
	signal data_test: std_logic_vector(0 to 15) := "0111000010101001";--< Sentido da transmissão
	
begin

	dut: CD4021B port map (serial_input,clk,ps,p,q);
	
	process 
	begin           
           
         ps <= '1' ,
           	   '0' after 50 ns;  
           
		for i in 0 to 15 loop
			   clk<= '1';
            serial_input<=data_test(i);
            wait for 5 ns;
            clk<= '0';
            wait for 5 ns;
            end loop;
        wait; 
		
	end process;
end test;