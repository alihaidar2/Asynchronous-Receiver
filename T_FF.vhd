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
	process(clk)
	begin
		if rising_edge(clk) then
			q <= t xor q;
		end if;
	end process;
end behv;
	



	