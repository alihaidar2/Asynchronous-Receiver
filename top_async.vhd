library ieee;
use ieee.std_logic_1164.all;

entity top_async is
	
	port (
	dry, err: out std_logic;
	clk: in std_logic;
	en, rx: in std_logic
	);
	
end top_async;


--Put the verilog instances in this component?
L0: FSMctrl port map (CLOCK_50,  KEY(0), KEY(1), SW(17 downto 16), SEL, EN_1, EN_2);


qstd: D_FF port map (clk,rst,QST,dst);
q0d: D_FF port map (clk,rst,Q0,d0);
q1d: D_FF port map (clk,rst,Q1,d1);
q2d: D_FF port map (clk,rst,Q2,d2);
q3d: D_FF port map (clk,rst,Q3,d3);
q4d: D_FF port map (clk,rst,Q4,d4);
q5d: D_FF port map (clk,rst,Q5,d5);
q6d: D_FF port map (clk,rst,Q6,d6);
q7d: D_FF port map (clk,rst,Q7,d7);
qsp1d: D_FF port map (clk,rst,QSP1,dsp1);
qsp2d: D_FF port map (clk,rst,QSP2,dsp2);


--need to define instances of each TFF defined earlier


ff0: T_FF(clk,rst,Q0,t0);
ff1: T_FF(clk,rst,Q1,t1);
ff2: T_FF(clk,rst,Q2,t2);
ff3: T_FF(clk,rst,Q3,t3);

