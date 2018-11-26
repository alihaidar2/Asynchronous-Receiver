library ieee;
use ieee.std_logic_1164.all;

entity dataLatch is 
port ( 
	oq0, oq1, oq2, oq3, oq4, oq5, oq6, oq7: out std_logic;
	d0, d1, d2, d3, d4, d5, d6, d7: in std_logic;
	clk: in std_logic);
end data_latch;


