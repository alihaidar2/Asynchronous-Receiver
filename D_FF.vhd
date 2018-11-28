--Define D_FF

library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
	
	port (
		clk: in std_logic;
		rst: in std_logic;
		d: in std_logic;
		q: out std_logic
	);

end D_FF;

architecture behv of D_FF is


begin
	process(clk)    --or (clk, rst)?
		begin
			if rising_edge(clk) then
				if (rst = '1') then
					q <= '0';
				else
					q <= d;
				end if;
			end if;
	end process;
end behv;
	



	