library ieee;
use ieee.std_logic_1164.all;

entity dataLatch is 

	port ( 
	oq: out std_logic_vector(7 downto 0);
	d: in std_logic_vector(7 downto 0);
	clk: in std_logic);

end dataLatch;


architecture behv of dataLatch is
begin
	process(clk, d)
		begin 
			if (rising_edge(clk)) then
				oq <= d;
			end if;
	end process;
end behv;