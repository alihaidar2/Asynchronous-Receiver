library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
	
	port (
		clk, rst: in std_logic;
		d: in std_logic;
		q: out std_logic
	);

end D_FF;

architecture behv of D_FF is
begin
	process(clk, d) 
	begin
		if rst = '0' then
			q <= "0";
		elsif (clk'event and clk='1') then
			q <= d;
		end if;
	end process;
end behv;


	