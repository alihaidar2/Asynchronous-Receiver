library ieee;
use ieee.std_logic_1164.all;

entity top_async is
	port (
		rx: in std_logic_vector(7 downto 0);
		rst: in std_logic;
		clk: in std_logic
		);
end top_async;

architecture top_stru of top_async is
	
	--- signals
	
	component fsm
		port ( st, rxf, rxo, ed, en, ack: in std_logic;
			clk, rst: in std_logic;
			cdc, rxck, err, dry, pd: out std_logic
			);
	end component;
	
	component shiftReg
		port ( rst, clk, rx: in std_logic;
			QST, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, QSP1, QSP2: out std_logic
			);	
	end component;
	
	component divCounter
	port ( );
	
	end component;
	
	component dataLatch
		port ( oq: out std_logic_vector(7 downto 0);
			d: in std_logic_vector(7 downto 0);
			clk: in std_logic);
	end component;
	
	
	
	
