--------------------------------------------------------------------
-- Name:	Chris Coulston
-- Date:	Feb 3, 2015
-- File:	acquireToHDMI_fsm.vhdl
-- HW:	Lab2
--	Crs:	ECE 383
--
-- Purp: The control unit for the audio O'scope
--
-- Documentation:	No help, though I used an example from my Digital
--						Design text book.
--
-- Academic Integrity Statement: I certify that, while others may have 
-- assisted me in brain storming, debugging and validating this program, 
-- the program itself is my own work. I understand that submitting code 
-- which is the work of other individuals is a violation of the honor   
-- code.  I also understand that if I knowingly give my original work to 
-- another individual is also a violation of the honor code. 
------------------------------------------------------------------------- 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.acquireToHDMI_package.all;					-- include your library here with added components ac97, ac97cmd


entity acquireToHDMI_fsm is
    PORT (  clk : in  STD_LOGIC;
            resetn : in  STD_LOGIC;
            sw: in STD_LOGIC_VECTOR(SW_WIDTH - 1 downto 0);
            cw: out STD_LOGIC_VECTOR (CW_WIDTH - 1 downto 0));
end acquireToHDMI_fsm;

architecture Behavioral of acquireToHDMI_fsm is

	-- lets define all the states
	type state_type is (
		RESET_STATE, LONG_DELAY_STATE, RESET_AD7606,
		SET_STORE_FLAG, WAIT_FORCED, BEGIN_CONVST,  
		ASSERT_CONVST, WHILE_BUSY_0, WHILE_BUSY_1, 
		READ_CH1_LOW, WRITE_CH1_BRAM, WRITE_CH1_TRIGGER, 
		READ_CH1_HIGH, RESET_SHORT, READ_CH2_LOW,
		WRITE_CH2_BRAM, WRITE_CH2_TRIGGER, READ_CH2_HIGH,
		WAIT_FOR_END_OF_SAMPLE_INTERVAL, BRAM_FULL, CLEAR_STORE_FLAG);
	signal state: state_type;
begin    
	-------------------------------------------------------------------------------
	-------------------------------------------------------------------------------
	state_proces: process(clk)  
	begin
		if (rising_edge(clk)) then
			if (resetn = '0') then 
				state <= RESET_STATE;
			else 
				case state is		
					when RESET_STATE =>
						state <= LONG_DELAY_STATE;


					when LONG_DELAY_STATE =>
						if (sw(LONG_DELAY_DONE_SW_BIT_INDEX) = '1') then
							state <= RESET_AD7606;
						end if;


					when RESET_AD7606 =>
						if (sw(SHORT_DELAY_DONE_SW_BIT_INDEX) = '1') then
						
						    if (sw(FORCED_MODE_SW_BIT_INDEX) = '1') then
							     state <= WAIT_FORCED;
							else 
							     state <= CLEAR_STORE_FLAG;
							end if;
							
						end if;


					when WAIT_FORCED =>
						if (sw(SINGLE_SW_BIT_INDEX) = '1') then
							state <= SET_STORE_FLAG;
						end if;


					when SET_STORE_FLAG =>
						state <= BEGIN_CONVST;
						

					when BEGIN_CONVST =>
						state <= ASSERT_CONVST;


					when ASSERT_CONVST =>
						if (sw(SHORT_DELAY_DONE_SW_BIT_INDEX) = '1') then
							state <= WHILE_BUSY_0;
						end if;


					when WHILE_BUSY_0 =>
						if (sw(BUSY_SW_BIT_INDEX) = '1') then
							state <= WHILE_BUSY_1;
						end if;


					when WHILE_BUSY_1 =>
						if (sw(BUSY_SW_BIT_INDEX) = '0') then
							state <= READ_CH1_LOW;
						end if;


					when READ_CH1_LOW =>
						if (sw(SHORT_DELAY_DONE_SW_BIT_INDEX) = '1') then
							if (sw(STORE_SW_BIT_INDEX) = '1') then
								state <= WRITE_CH1_BRAM;
							else
								state <= WRITE_CH1_TRIGGER;
							end if;
						end if;


					when WRITE_CH1_BRAM =>
						state <= READ_CH1_HIGH;


					when WRITE_CH1_TRIGGER =>
						state <= READ_CH1_HIGH;


					when READ_CH1_HIGH =>
						if (sw(SHORT_DELAY_DONE_SW_BIT_INDEX) = '1') then
							state <= RESET_SHORT;
						end if;


					when RESET_SHORT =>
						state <= READ_CH2_LOW;


					when READ_CH2_LOW =>
						if (sw(SHORT_DELAY_DONE_SW_BIT_INDEX) = '1') then
							if (sw(STORE_SW_BIT_INDEX) = '1') then
								state <= WRITE_CH2_BRAM;
							else
								state <= WRITE_CH2_TRIGGER;
							end if;
						end if;

					when WRITE_CH2_BRAM =>
						state <= READ_CH2_HIGH;


					when WRITE_CH2_TRIGGER =>
						state <= READ_CH2_HIGH;


					when READ_CH2_HIGH =>
						if (sw(SHORT_DELAY_DONE_SW_BIT_INDEX) = '1') then
							state <= WAIT_FOR_END_OF_SAMPLE_INTERVAL;
						end if;

					
					-- this is an interesting stat that needs some more work
					when WAIT_FOR_END_OF_SAMPLE_INTERVAL =>
						if (sw(SAMPLE_DELAY_DONE_SW_BIT_INDEX) = '1') then
							state <= BRAM_FULL;
						end if;


					when BRAM_FULL =>
						if (sw(BRAM_FULL_SW_BIT_INDEX) = '0' and sw(FORCED_MODE_SW_BIT_INDEX) = '0' and sw(TRIGGER_CH1_SW_BIT_INDEX) = '0') then
						  state <= BEGIN_CONVST;
						elsif (sw(BRAM_FULL_SW_BIT_INDEX) = '0' and sw(FORCED_MODE_SW_BIT_INDEX) = '0' and sw(TRIGGER_CH1_SW_BIT_INDEX) = '1' and sw(STORE_SW_BIT_INDEX) = '1') then
						  state <= BEGIN_CONVST;
						elsif (sw(BRAM_FULL_SW_BIT_INDEX) = '0' and sw(FORCED_MODE_SW_BIT_INDEX) = '0' and sw(TRIGGER_CH1_SW_BIT_INDEX) = '1' and sw(STORE_SW_BIT_INDEX) = '0') then
						  state <= SET_STORE_FLAG;
						elsif (sw(BRAM_FULL_SW_BIT_INDEX) = '0' and sw(FORCED_MODE_SW_BIT_INDEX) = '1') then
						  state <= BEGIN_CONVST;
						elsif (sw(BRAM_FULL_SW_BIT_INDEX) = '1' and sw(FORCED_MODE_SW_BIT_INDEX) = '1') then
						  state <= WAIT_FORCED;
						elsif (sw(BRAM_FULL_SW_BIT_INDEX) = '1' and sw(FORCED_MODE_SW_BIT_INDEX) = '0') then
						  state <= CLEAR_STORE_FLAG;
						end if;


					when CLEAR_STORE_FLAG =>
						state <= BEGIN_CONVST;


					when others =>
						state <= RESET_STATE;
				end case;
			end if;
		end if;
	end process;

	-------------------------------------------------------------------------------
    -- Dedicated Control Word spreadsheet
    -------------------------------------------------------------------------------
	output_process: process (state)
	begin
		case state is		
            when RESET_STATE  =>  cw <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"11"&"11"&"11"&"11"&"11";
            when LONG_DELAY_STATE  =>  cw <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"11"&"11"&"11"&"10"&"11";
            when RESET_AD7606  =>  cw <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'1'&"11"&"11"&"11"&"11"&"10";
            when WAIT_FORCED  =>  cw <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"11"&"11"&"11"&"11"&"11";
            when SET_STORE_FLAG  =>  cw <= '0'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"11"&"11"&"11"&"11"&"11";
            when BEGIN_CONVST  =>  cw <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"00"&"11"&"11"&"11"&"11";
            when ASSERT_CONVST  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'0'&'1'&'1'&'0'&"00"&"10"&"11"&"11"&"10";
            when WHILE_BUSY_0  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'1'&'1'&'0'&"00"&"10"&"11"&"11"&"11";
            when WHILE_BUSY_1  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'1'&'1'&'0'&"00"&"10"&"11"&"11"&"11";
            when READ_CH1_LOW  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'0'&'0'&'0'&"00"&"10"&"11"&"11"&"10";
            when WRITE_CH1_BRAM  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'1'&'1'&'0'&'0'&'0'&"00"&"10"&"11"&"11"&"11";
            when WRITE_CH1_TRIGGER  =>  cw <= '0'&'0'&'0'&'1'&'1'&'1'&'0'&'0'&'1'&'0'&'0'&'0'&"00"&"10"&"11"&"11"&"11";
            when READ_CH1_HIGH  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'1'&'0'&'0'&"00"&"10"&"11"&"11"&"10";
            when RESET_SHORT  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'1'&'0'&'0'&"00"&"10"&"11"&"11"&"11";
            when READ_CH2_LOW   =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'0'&'0'&'0'&"00"&"10"&"11"&"11"&"10";
            when WRITE_CH2_BRAM  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&'1'&'0'&'0'&'0'&"10"&"10"&"11"&"11"&"11";
            when WRITE_CH2_TRIGGER  =>  cw <= '0'&'0'&'1'&'0'&'1'&'1'&'0'&'0'&'1'&'0'&'0'&'0'&"00"&"10"&"11"&"11"&"11";
            when READ_CH2_HIGH  =>  cw <= '0'&'0'&'0'&'0'&'1'&'1'&'0'&'0'&'1'&'1'&'0'&'0'&"00"&"10"&"11"&"11"&"10";
            when WAIT_FOR_END_OF_SAMPLE_INTERVAL  =>  cw <= '0'&'0'&'0'&'0'&'0'&'1'&'0'&'0'&'1'&'1'&'1'&'0'&"00"&"10"&"11"&"11"&"11";
            when BRAM_FULL  =>  cw <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"00"&"11"&"11"&"11"&"11";
            when CLEAR_STORE_FLAG  =>  cw <= '1'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'1'&'1'&'1'&'0'&"00"&"11"&"11"&"11"&"11";

		end case;
	end process;	                       

end Behavioral;



