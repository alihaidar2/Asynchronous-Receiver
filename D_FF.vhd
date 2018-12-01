--Define D_FF

library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
	
	port (
		clk: in std_logic;
		d: in std_logic;
		q: out std_logic
	);

end D_FF;

architecture behv of D_FF is
begin
	process(clk) 
		begin
			if (clk'event and clk='1') then
				q <= d;
			end if;
	end process;
end behv;
	



	