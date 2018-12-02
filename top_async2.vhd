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
		port ( OQ1, OQ2, OQ3, OQ4, OQ5, OQ6, OQ7: out std_logic;
			D0, D1, D2, D3, D4, D5, D6, D7: in std_logic;
			clk: in std_logic);
	end component;
	
	begin
		C0: fsm port map (SW(10), "rxf, rxo, ed, en, ack", CLOCK_50, KEY(0), CLR1, X1, "err, dry", PDCLK);
		C1: shiftReg port map(CLR1, X1, "rx= DATA in", "QST", D0, D1, D2, D3, D4, D5, D6, D7, "QSP1, QSP2");
		C2: divCounter port map("clr = CLR1"); -- dont have actual implementation so just saying what it should be
		C3: dataLatch port map("oq", D0, D1, D2, D3, D4, D5, D6, D7, PDCLK);
	
	
	
