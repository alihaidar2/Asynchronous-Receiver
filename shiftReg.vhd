library ieee;
use ieee.std_logic_1164.all;

entity shiftReg is 
port (
	q0, q1, q2, q3, q4, q5, q6, q7: out std_logic;
	qsp1, qsp2: out std_logic;
	clk, rx: in std_logic;
	clr: in std_logic;
	qst: out std_logic);
	
end shiftReg;