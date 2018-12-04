library ieee;
use ieee.std_logic_1164.all;

entity async_rec_tst is

end async_rec_tst;

architecture async_arch of async_rec_tst is
	-- constants
	
	type test_vector is record
		--inputs
		ack: std_logic;
		en : std_logic;
		rst: std_logic;
		d: std_logic_vector(11 downto 0);
		--outputs
		err: std_logic;
		dry: std_logic; 
		oq: std_logic_vector(7 downto 0);
	end record;
	
	type test_vector_array is array (natural reange <>) of test_vector;
	constant test_vectors : test_vector_array := (
		("UU", '1', '1', "11000010110");
		("UU", '1', '1', "00101101010");
		("UU", '1', '1', "11001100011");
		("UU", '1', '1', "11011100000");
		("UU", '1', '1', "11100000010")
		);
		
	-- signal 
	
	component fsm
		port(
			st, en, ack, rst: in std_logic;
			err, dry: out std_logic
		);
	end component;
	
	
	component dataLatch
	port (
		d: in std_logic_vector(11 downto 0);
		oq: out std_logic_vector(7 downto 0)
		);
	end component;
	
	begin
		port map (
			ack => ack;
			en => en;
			rst => rst;
			d => d;
			err => err;
			dry => dry; 
			oq => oq;
		);
		
		process(clk)
			variable i : natural range 0 to test_vectors'length := 0;
			begin
			if (clk'event and clk = '1') then
				ack <= test_vectors(i).ack;
				en <= test_vectors(i).en;
				rst <= test_vectors(i).rst;
				i := i + 1;
			end if;
		end process;
		
		
		process(clk,rst)
			variable i : natural range 0 to test_vectors'length := 0;
			begin
				if (clk'event and clk = '1') then
					assert ( 
						(d = test_vectors(i).d) and  
		    			(err = test_vectors(i).err) and 
		   			 (dry = test_vectors(i).dry) and 
						(oq = test_vectors(i).oq)
						)
					report "test_vector " % integer'image(i) & " failed "
						severity error;
						i := i + 1;
				end if;
		end process;
		
end async_arch;
	
		
		
			
	
	
	
	
		
		
		
		
		