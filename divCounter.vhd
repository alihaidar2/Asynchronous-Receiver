--The counter counts up to 11 (1101 binary) then stops
--The output is the RXF signal.
--This goes high when the eleventh clock pulse is received
--


library ieee;
use ieee.std_logic_1164.all;

entity divCounter is
	port (
	clr, clk, rst: in std_logic;
	rxf, q0, q1, q2, q3: out std_logic
	);

end divCounter;

architecture rtl of shiftReg is
	signal t0, t1, t2, t3, stop : std_logic;   --All t inputs are interconnecting wires
	begin
		t0 = 1 and stop; --this is just following the technique
		t1= Q0 and stop; --for binary counter design
		t2= Q0 and Q1 and stop; --Will generate AND gates
		t3= Q0 and Q1 and Q2 and stop;
		stop = not(Q0 and Q1 and not(Q2) and Q3);
		rxf=not(stop);
end rtl;
