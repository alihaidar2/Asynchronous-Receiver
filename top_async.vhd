library ieee;
use ieee.std_logic_1164.all;

entity top_async is
	
	port (
	dry, err: out std_logic;
	clk: in std_logic;
	en, rx: in std_logic
	);
	
end top_async;
