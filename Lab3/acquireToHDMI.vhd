--//////////Top Level for signal Acquisition /////////////////////////////--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.acquireToHDMI_package.all;					-- include your library here with added components ac97, ac97cmd
use work.hdmi_package.all;
use work.basicBuildingBlocks_package.all;					-- include your library here with added components ac97, ac97cmd


entity acquireToHDMI is
    PORT ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
		   btn: in	STD_LOGIC_VECTOR(2 downto 0);
		   triggerCh1, triggerCh2: out STD_LOGIC;		   
		   conversionPlusReadoutTime: out STD_LOGIC;
		   sampleTimerRollover: out STD_LOGIC;
		   
		   an7606data: in STD_LOGIC_VECTOR(15 downto 0);
		   an7606convst, an7606cs, an7606rd, an7606reset: out STD_LOGIC;
		   an7606od: out STD_LOGIC_VECTOR(2 downto 0);
		   an7606busy : in STD_LOGIC;
		   
		   tmdsDataP : out  STD_LOGIC_VECTOR (2 downto 0);
           tmdsDataN : out  STD_LOGIC_VECTOR (2 downto 0);
           tmdsClkP : out STD_LOGIC;
           tmdsClkN : out STD_LOGIC;
           hdmiOen:    out STD_LOGIC		   
    );		   
end acquireToHDMI;

architecture behavior of acquireToHDMI is
    
    signal cw: STD_LOGIC_VECTOR(CW_WIDTH - 1 downto 0);
    signal sw: STD_LOGIC_VECTOR(SW_WIDTH - 1 downto 0);
    signal forcedMode: STD_LOGIC;
    signal single_sw : std_logic; 
    
    ----------------------------------------------------------------------------------------------------------------------------------------
    -- make data path signals
    ----------------------------------------------------------------------------------------------------------------------------------------
    signal sw_datapath : std_logic_vector(DATAPATH_SW_WIDTH - 1 downto 0);
    
    
    ----------------------------------------------------------------------------------------------------------------------------------------
    -- putting last button state values here
    ----------------------------------------------------------------------------------------------------------------------------------------
--    signal lastButtonState : std_logic_vector(3 - 1 downto 0);	
    signal forcedBeenClicked : std_logic; 
    signal lastSingle : std_logic;
    
begin

    sw(BUSY_SW_BIT_INDEX) <= an7606busy;
    sw(SINGLE_SW_BIT_INDEX) <= single_sw;
    sw(FORCED_MODE_SW_BIT_INDEX) <= forcedMode;
    sw(DATAPATH_SW_WIDTH - 1 downto 0) <= sw_datapath;
--    sw <= an7606busy & single_sw & forcedMode & sw_datapath;
    ----------------------------------------------------------------------------------------------------------------------------------------
    -- make the datapath
    ----------------------------------------------------------------------------------------------------------------------------------------
    datapath_inst : acquireToHDMI_datapath
    port map (
        clk => clk,
        resetn => resetn,
        cw => cw,
        sw => sw_datapath, 
        an7606data => an7606data,
    
        triggerVolt16bitSigned => (others => '0'),
        triggerTimePixel => (others => '0'),
        ch1Data16bitSLV => open,
        ch2Data16bitSLV => open,
       
        tmdsDataP => tmdsDataP,
        tmdsDataN => tmdsDataN,
        tmdsClkP => tmdsClkP,
        tmdsClkN => tmdsClkN,
        hdmiOen => hdmiOen
    );
    
    ----------------------------------------------------------------------------------------------------------------------------------------
    -- make the control
    ----------------------------------------------------------------------------------------------------------------------------------------
    -- make the full status word from the datapath_sw buttonProcess status word and the ad7606
    control_inst : acquireToHDMI_fsm
    port map (  
        clk => clk,
        resetn => resetn,
        sw => sw,
        cw => cw
    );
    
    ----------------------------------------------------------------------------------------------------------------------------------------
    -- make the stuff for ad7606 
    ----------------------------------------------------------------------------------------------------------------------------------------
    an7606convst <= cw(CONVST_CW_BIT_INDEX);
    an7606cs <= cw(CS_CW_BIT_INDEX);
    an7606rd <= cw(RD_CW_BIT_INDEX);
    an7606reset <= cw(RESET_AD7606_CW_BIT_INDEX);
    an7606od <= "000";
    
    
    ------------------------------------------------------------------------------
    -- Button Process
    ------------------------------------------------------------------------------
    -- lets do the button stuff 
    process(clk)
    begin
        if (resetn = '0') then
            forcedMode <= '1';
            single_sw <= '0';
        else
            if rising_edge(clk) then
                -- forced mode is being clicked
                if (btn(0) = '0') then
                    -- check if its been clicked before
                    if (forcedBeenClicked = '0') then
                        if (forcedMode = '0') then
                            forcedMode <= '1';
                        else 
                            forcedMode <= '0';
                        end if;
                    end if;
                    
                    -- its now been clicked
                    forcedBeenClicked <= '1';
                elsif (btn(0) = '1') then
                    -- its now not been clicked
                    forcedBeenClicked <= '0';
                end if;
            
            

                    
                -- single is being clicked
                if (btn(1) = '0') then
                    if (forcedMode = '1') then
                        single_sw <= '1';
                    else 
                        single_sw <= '0';
                    end if;
                elsif (btn(1) = '1') then
                    single_sw <= '0';
                end if;
                
            end if;
        end if;      
    end process;


    conversionPlusReadoutTime <= cw(CONVERSION_PLUS_READOUT_CW_BIT_INDEX);
    sampleTimerRollover <= cw(SAMPLE_TIMER_ROLLOVER_CW_BIT_INDEX);   
 
    
    
--    sw(SINGLE_FORCED_TRIGGER_SW_BIT_INDEX) <= buttonActivity(0);
    triggerCh2 <= sw(TRIGGER_CH2_SW_BIT_INDEX);
    triggerCh1 <= sw(TRIGGER_CH1_SW_BIT_INDEX);

end behavior;
