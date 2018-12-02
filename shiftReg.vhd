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
	signal dst, d0, d1, d2, d3, d4, d5, d6, d7, dsp1, dsp2 : std_logic;
begin
	dst <= Q0;
	d0 <= Q1;
	d1 <= Q2;
	d2 <= Q3;
	d4 <= Q5;
	d5 <= Q6;
	d6 <= Q7;
	d7 <= QSP1;
	dsp1 <= QSP2;
	dsp2 <= din;
end rtl;

	