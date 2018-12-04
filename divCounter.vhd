library ieee;
use ieee.std_logic_1164.all;

entity divCounter is
	
	generic ( N : natural := 0);
	
	port (
		clk, clr : in std_logic;
		rxf: out std_logic
		);
		
end entity;

architecture rtl of divCounter is
	process(clk, rst)
	begin
		if (rst = 0) then
			N <= 0;
		elsif (clk'event and clk = '1') then
			if (N = 11) then
				rxf <= '1';
				N <= 0;
			else
				rxf <= '0'; 
				N <= N + 1;
			end if;
		end if;
	end process;
end rtl;