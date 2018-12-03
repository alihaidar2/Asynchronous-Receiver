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
	
	-- component divCounter
-- 	port ( );
--
-- 	end component;
	
	component dataLatch
		port ( OQ1, OQ2, OQ3, OQ4, OQ5, OQ6, OQ7: out std_logic;
			D0, D1, D2, D3, D4, D5, D6, D7: in std_logic;
			clk: in std_logic);
	end component;
	
	component D_FF
		port ( clk, rst: in std_logic;
		d: in std_logic;
		q: out std_logic );
	end component;
	
	component T_FF
		port ( clk, rst : in std_logic;
		t : in std_logic;
		q: out std_logic);
	
begin
	C0: fsm port map (SW(10), "rxf, rxo, ed, en, ack", CLOCK_50, KEY(0), CLR1, X1, "err, dry", PDCLK);
	-- QST, QSP1, QSP2 are used for error so idk if i have to port them to anything, D FF?
	C1: shiftReg port map(CLR1, X1, din, "QST=idk if it goes anywhere", D0, D1, D2, D3, D4, D5, D6, D7, "QSP1, QSP2");
	C2: divCounter port map("clr = CLR1"); -- dont have actual implementation so just saying what it should be
	C3: dataLatch port map("oq", D0, D1, D2, D3, D4, D5, D6, D7, PDCLK); --oq to outside
	C4: D_FF port map(X1, CLR1, din, qsp2);
	C5: D_FF port map(X1, CLR1, qsp2, qsp1);
	C6: D_FF port map(X1, CLR1, qsp1, q7);
	C7: D_FF port map(X1, CLR1, q7, q6);
	C8: D_FF port map(X1, CLR1, q6, q5);
	C9: D_FF port map(X1, CLR1, q5, q4);
	C10: D_FF port map(X1, CLR1, q4, q3);
	C11: D_FF port map(X1, CLR1, q3, q2);
	C12: D_FF port map(X1, CLR1, q2, q1);
	C13: D_FF port map(X1, CLR1, q1, q0);
	C14: D_FF port map(X1, CLR1, q0, qst);
	C15: T_FF port map(
	C16:
	C17:
	C18:
end top_stru;
	
	
	
	
