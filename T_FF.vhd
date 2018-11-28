--Define T_FF
--Needed for the divide by 11 asynchronous counter

library ieee;
use ieee.std_logic_1164.all;

entity T_FF is
	
	port (
		clk: in std_logic;
		rst: in std_logic;
		t: in std_logic;
		q: out std_logic
	);

end T_FF;

architecture behv of T_FF is


begin
	process(clk)    --or (clk, rst)?
		begin
			if rising_edge(clk) then
				if (rst = '1') then
					q <= '0';
				else
				q <= t xor q;
				end if;
			end if;
	end process;
end behv;
	



	