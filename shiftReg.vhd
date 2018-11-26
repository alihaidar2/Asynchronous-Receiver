library ieee;
use ieee.std_logic_1164.all;

entity shiftReg is
	
	port (
	q: out std_logic_vector(7 downto 0);
	qsp1, qsp2: out std_logic;
	clk, rx: in std_logic;
	clr: in std_logic;
	qst: out std_logic);

end shiftReg;