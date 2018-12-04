library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port(
	st, rxf, rxo, en, ack: in std_logic;
	clk, rst: in std_logic;
	cdc, rxck, err, dry, pd: out std_logic
	);
	
end fsm;



architecture fsmctrl of fsm is 

	type states is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
	signal currentState, newState, ea: states;
	signal clock, reset: std_logic;
	
begin
	clock <= clk;
	reset <= rst;
	
	process (clock, reset)
	begin
		if reset = '0' then 
			ea <= s0;
		elsif (clock'event and clock = '1') then
			ea <= newState;
		end if;
	end process;


	process (ea, en, st, ed, rxck, rxf, ack, pd, dry, err)
	begin
		case ea is
			when s0 =>
				rxck <= '0';
				if (en = '1' and st = '0') then
					newState <= s1;
				end if; 
			when s1 =>
				newState <= s2;
			when s2 =>
				newState <= s3;
			when s3 =>
				newState <= s4;
			when s4 =>
				rxck <= '1';
				if (rxf = '0') then 
					newState <= s5;
				else
					newState <= s8;
				end if;
			when s5 =>
				rxck = '0';
				newState <= s6;
			when s6 =>
				newState <= s7;
			when s7 =>
				newState <= s4;
			when s8 =>
				rxck <= '1';
				if ed = '0' then
					newState <= s9;
				else 
					newState <= s10;
				end if;
			when s9 =>
				err <= '1';
				-- if reset is hit, do you go back to S0 or do i do this somewhere else
			when s10 =>
				pd <= '1';
				dry <= '1';
				if ack = '1' then
					newState <= s11;
				end if;
			when s11 =>
				pd <= '0';
				dry <= '0';
				if ack <= '0' then
					newState <= s0;
				end if;
			end case;
		end process;
end fsmctrl;
		
			