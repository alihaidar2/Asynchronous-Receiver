--Define T_FF
--Needed for the divide by 11 asynchronous counter

library ieee;
use ieee.std_logic_1164.all;

entity T_FF is
	
	port (
		clk, rst, t: in std_logic;
		q: out std_logic
	);
end T_FF;


architecture behv of T_FF is
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			q <= '0'
		elsif (clk'event and clk='1') then
			q <= t xor q;
		end if;
	end process;
end behv;
	



	