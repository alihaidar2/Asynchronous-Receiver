library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port(
	st, rxf, rxo, ed, en, ack: in std_logic;
	clk, rst: in std_logic;
	cdc, rxck, err, dry, pd: out std_logic
	);
	
end fsm;