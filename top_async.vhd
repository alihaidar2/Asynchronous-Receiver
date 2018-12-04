library ieee;
use ieee.std_logic_1164.all;

entity top_async is
	port (
		rx: in std_logic_vector(10 downto 0);
		rst, clk: in std_logic;
		dry, err: out std_logic;
		ack, en: in std_logic
		);
		
end top_async;

architecture top_stru of top_async is
	
	signal dst, d0, d1, d2, d3, d4, d5, d6, d7, dsp1, dsp2: std_logic;
	signal CLK1, CLR1, PDCLK, RFULL : std_logic;
	
	
	component fsm
		port ( st, rxf, rxo, en, ack: in std_logic;
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
	port (
		clk, clr : in std_logic;
		rxf: out std_logic
		);
	end component;
	
	component dataLatch
		port (oq: out std_logic(7 downto 0);
			d: in std_logic(7 downto 0);
			clk: in std_logic);
	end component;
	
	component D_FF
		port ( clk, rst: in std_logic;
			d: in std_logic;
			q: out std_logic );
	end component;
	
begin
	C0: fsm port map (SW(10), RFULL, DST, "en", "ack", CLOCK_50, KEY(0), CLR1, CLK1, "err, dry", PDCLK);
	-- QST, QSP1, QSP2 are used for error so idk if i have to port them to anything, D FF?
	-- DIN is the switches i think SW(10 downto 0)
	C1: shiftReg port map(CLR1, CLK1, "RX=SIGNAL FROM TESTBENCH", DST, D0, D1, D2, D3, D4, D5, D6, D7, "QSP1, QSP2");
	C2: divCounter port map(CLK1, CLR1, RFULL); -- DONE
	C3: dataLatch port map(, D0, D1, D2, D3, D4, D5, D6, D7, PDCLK); --oq to outside
	
	-- need to connect these FFs to Shift register, maybe D0->D7?
	C4: D_FF port map(CLK1, CLR1, rx, dsp2);
	C5: D_FF port map(CLK1, CLR1, dsp2, dsp1);
	C6: D_FF port map(CLK1, CLR1, dsp1, d7);
	C7: D_FF port map(CLK1, CLR1, d7, d6);
	C8: D_FF port map(CLK1, CLR1, d6, d5);
	C9: D_FF port map(CLK1, CLR1, d5, d4);
	C10: D_FF port map(CLK1, CLR1, d4, d3);
	C11: D_FF port map(CLK1, CLR1, d3, d2);
	C12: D_FF port map(CLK1, CLR1, d2, d1);
	C13: D_FF port map(CLK1, CLR1, d1, d0);
	C14: D_FF port map(CLK1, CLR1, d0, dst);
	
end top_stru;