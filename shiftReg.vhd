--11 bit shift register with :
--A start bit
--Eight data bits (d0 to d7)
--Two stop bits (sp1 and sp2)
--The incoming data (din) connect to the sp2 flipflop and are shifted into the sp1 FF.
--The last FF in the shift register is the start-bit FF, since this is the first data bit into the shift register.

--Define the shift register
--The shift register clock is rxclk which is controlled by the FSM
--The protocol bits (st, sp1, and sp2) are shifted into theirs own FF's


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
end rtl;

	