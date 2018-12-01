library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port(
	st, rxf, rxo, ed, en, ack: in std_logic;
	clk, rst: in std_logic;
	cdc, rxck, err, dry, pd: out std_logic
	);
	
end fsm;



architecture fsmcrtl of fsm is 
	type states is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12);
	signal cs, ns, ea: states;
	signal clock, reset: std_logic;
begin
	clock <= clk;
	reset <= rst;
process (clock, reset)
being
	if reset = '0' then 
		ea <= s0;
	elsif (clock'event and clock = '1') then
		ea <= ns;
	end if;
end process;


process (EA, en)      --Not sure what to include
begin
	case ea is
		when s0 =>
		
		ns <= s1;
		
		when s1 =>
		
		ns <= s2;
		
		when s2 =>
		
		ns <= s3;
		
		when s3 =>
		
		ns <= s4;
		
		when s4 =>
		
		ns <= s5;
		
		ns <= s8;
		
		when s5 =>
		
		ns <= s6;
		
		when s6 =>
		
		ns <= s7;
		
		when s7 =>
		
		ns <= s4;
		
		when s8 =>
		
		ns <= s9;
		
		
		ns <= s10;
		
		when s9 =>
		
		nothing
		
		when s10 =>
		
		ns <= s11;
		
		when s11 =>
		
		ns <= s0;
		
	end case;
end process;
end fsmcrtl;
		
			