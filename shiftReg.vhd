library ieee;
use ieee.std_logic_1164.all;

entity shiftReg is 

	port (
		rst, clk, rx: in std_logic;
		QST, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, QSP1, QSP2: out std_logic
		);	
		
end shiftReg;


architecture rtl of shiftReg is
	signal qst, q0, q1, q2, q3, q4, q5, q6, q7, qsp1, qsp2 : std_logic;
begin
	process (clk, rst)
	begin
		if (rst = '0') then
			qst <= 0;
			q0 <= '0';
			q1 <= '0';
			q2 <= '0';
			q4 <= '0';
			q5 <= '0';
			q6 <= '0';
			q7 <= '0';
			qsp1 <= '0';
			qsp2 <= '0';
		elsif (clk'event and clk = '1') then
			qst <= Q0;
			q0 <= Q1;
			q1 <= Q2;
			q2 <= Q3;
			q4 <= Q5;
			q5 <= Q6;
			q6 <= Q7;
			q7 <= QSP1;
			qsp1 <= QSP2;
			qsp2 <= din;
		end if;
end rtl;

	