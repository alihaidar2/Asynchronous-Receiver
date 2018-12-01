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
begin
	if reset = '0' then 
		ea <= s0;
	elsif (clock'event and clock = '1') then
		ea <= ns;
	end if;
end process;


process (EA, en, st, en)      --Not sure what to include
begin
	case ea is
		when s0 =>
			rxck <= '0';
			if (en = '1' and st = '1') then
				ns <= s1;
			end if; 
		
		when s1 =>
			ns <= s2;
		
		when s2 =>
			ns <= s3;
		
		when s3 =>
			ns <= s4;
		
		when s4 =>
			rxck <= '1';
			if (rxf = '0') then
				ns <= s5;
			else 
				ns <= s8;
			end if;
		
		when s5 =>
			rxck = '0';
			ns <= s6;
		
		when s6 =>
			ns <= s7;
		
		when s7 =>
			ns <= s4;
		
		when s8 =>
			rxck = '1';
			if ed = '0' then
				ns <= s9;
			else 
				ns <= s10;
			end if;
		
		when s9 =>
			err = '1';
			ns <= s9
		
		when s10 =>
			pd = '1';
			dry = '1';
			if ack = '1' then
				ns <= s11;
			end if;
		
		when s11 =>
			pd = '0';
			dry = '0';
			if ack = '0' then
				ns <= s0;
			end if;
		
	end case;
end process;
end fsmcrtl;
		
			