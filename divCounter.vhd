library ieee;
use ieee.std_logic_1164.all;

entity divCounter is
	port (
	clr, clk, rst: in std_logic;
	rxf, q0, q1, q2, q3: out std_logic
	);

end divCounter;

architecture rtl of shiftReg is
	signal t0, t1, t2, t3, stop : std_logic; 
	begin
		t0 = 1 and stop;
		t1= Q0 and stop;
		t2= Q0 and Q1 and stop;
		t3= Q0 and Q1 and Q2 and stop;
		stop = not(Q0 and Q1 and not(Q2) and Q3);
		rxf=not(stop);
end rtl;
