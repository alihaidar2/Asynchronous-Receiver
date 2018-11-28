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
			if(if rising_edge(clk)) then
				oq <= d;
			end if;
	end process;
end behv;





	clk: in std_logic;
	d0: in std_logic;
	d1: in std_logic;
	d2: in std_logic;
	d3: in std_logic;
	d4: in std_logic;
	d5: in std_logic;
	d6: in std_logic;
	d7: in std_logic;
	oq0: out std_logic;
	oq1: out std_logic;
	oq2: out std_logic;
	oq3: out std_logic;
	oq4: out std_logic;
	oq5: out std_logic;
	oq6: out std_logic;
	oq7: out std_logic
	);
