--------------------------------------------------------------------
-- Name:	Chris Coulston
-- Date:	Feb 3, 2015
-- Modified:	Sept 2022
-- File:	acquireToHDMI_Datapath.vhdl
-- HW:		Lab 3
-- Crs:		ECE 383 and EENG 498
--
-- Purp: The complete datapath for the audio O'scope
--
-- Documentation:	No help
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
use IEEE.NUMERIC_STD.ALL;

use work.acquireToHDMI_Package.all;			
use work.basicBuildingBlocks_package.all;		
use work.hdmi_package.all;

entity acquireToHDMI_datapath is
    PORT ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
		   cw : in STD_LOGIC_VECTOR(CW_WIDTH -1 downto 0);
		   sw : out STD_LOGIC_VECTOR(DATAPATH_SW_WIDTH - 1 downto 0);
		   an7606data: in STD_LOGIC_VECTOR(DATA_WIDTH_IN_BITS - 1 downto 0);

           triggerVolt16bitSigned: in SIGNED(DATA_WIDTH_IN_BITS - 1 downto 0);
		   triggerTimePixel: in STD_LOGIC_VECTOR(VIDEO_WIDTH_IN_BITS-1 downto 0);
		   ch1Data16bitSLV, ch2Data16bitSLV: out STD_LOGIC_VECTOR(DATA_WIDTH_IN_BITS - 1 downto 0);
		   
		   tmdsDataP : out  STD_LOGIC_VECTOR (2 downto 0);
           tmdsDataN : out  STD_LOGIC_VECTOR (2 downto 0);
           tmdsClkP : out STD_LOGIC;
           tmdsClkN : out STD_LOGIC;
           hdmiOen:    out STD_LOGIC
		   );
end acquireToHDMI_datapath;

architecture behavior of acquireToHDMI_datapath is
    -----------------------------------------------------------------------------------------------------
    -- make our clk signals :)
    signal videoClk : std_logic;
    signal videoClk5x : std_logic;

    -----------------------------------------------------------------------------------------------------
    -- this is where you will define wires
    signal storeIntoBramFlag: STD_LOGIC;

    -----------------------------------------------------------------------------------------------------
    -- ch1 trigger wires
    signal triggerVolt16bitSTD : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch1_reg_1_q : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch1_reg_2_q : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch1_compare_1_gt : std_logic;
    signal ch1_compare_2_lt : std_logic;

    -----------------------------------------------------------------------------------------------------
    -- ch2 trigger wires
    signal ch2_reg_1_q : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch2_reg_2_q : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch2_compare_1_gt : std_logic;
    signal ch2_compare_2_lt : std_logic;

    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for the short counter 
    signal shortDelayCounterOut : std_logic_vector(SHORT_DELAY_50Mhz_CONST_WIDTH - 1 downto 0);

    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for the long counter
    signal longDelayCounterOut : std_logic_vector(LONG_DELAY_50Mhz_CONST_WIDTH - 1 downto 0);


    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for the period counter
    signal periodCounterOut : std_logic_vector(PERIOD_50MHZ_CONST_WIDTH - 1 downto 0);
    signal muxRateSelect : std_logic_vector(PERIOD_50MHZ_CONST_WIDTH - 1 downto 0);
    signal mux8to1select : std_logic_vector(3-1 downto 0);

    -----------------------------------------------------------------------------------------------------
    -- make the shared internal wires for ch1 and ch2 BRAM
    signal wrAddr : std_logic_vector(VIDEO_WIDTH_IN_BITS - 1 downto 0);

    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for the ch1 BRAM
    signal ch1_dout_2s : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch1_dout_pixel : std_logic_vector(AD7606_DATA_SIZE - 1 downto 0);
    signal pixelVert16 : std_logic_vector(AD7606_DATA_SIZE - 1 downto 0);
    signal ch1 : std_logic;

    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for the ch2 BRAM
    signal addrb : std_logic_vector(VIDEO_WIDTH_IN_BITS -1 downto 0);
    signal ch2_dout_2s : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch2_dout_pixel : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal ch2 : std_logic;

    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for scopeface
    signal trigVscr : std_logic_vector(DATA_WIDTH_IN_BITS - 1 downto 0);
    signal trigVscr12bit : std_logic_vector(VIDEO_WIDTH_IN_BITS - 1 downto 0);

    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for the scopeface 


    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for videoSignalGen
    signal pixelHorz : std_logic_vector(VIDEO_WIDTH_IN_BITS - 1 downto 0);
    signal pixelVert : std_logic_vector(VIDEO_WIDTH_IN_BITS - 1 downto 0);
    
    -----------------------------------------------------------------------------------------------------
    -- make the internal wires for graphics
    signal hs, vs, de: std_logic;
    signal rgb : std_logic_vector(24-1 downto 0);
    
    signal red, green, blue : std_logic_vector(8 - 1 downto 0);
    

    -----------------------------------------------------------------------------------------------------
begin

    -- Simple SR Latch to assist FSM
    -- this is where the store logic will be
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(resetn ='0') then
                storeIntoBramFlag <= '0';
            elsif (cw(SET_STORE_FLAG_CW_BIT_INDEX) = '1') then
                storeIntoBramFlag <= '1';
            elsif (cw(CLEAR_STORE_FLAG_CW_BIT_INDEX) = '1') then
                storeIntoBramFlag <= '0';
            end if;
        end if;
    end process;

    -- set the sw to store into BRAM 1 = store bram
    sw(STORE_SW_BIT_INDEX) <= storeIntoBramFlag;

    -- this is where 2sToPixel will be

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- CH1 TRIGGER 
    ----------------------------------------------------------------------------------------------------------------------------------------

    ch1Reg1: genericRegister 
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            clk => clk, 
            resetn => resetn,
            load => cw(TRIG_CH1_WRITE_CW_BIT_INDEX),
            d => an7606data, 
            q =>ch1_reg_1_q
        );
        
    -- assign the output
    ch1Data16bitSLV <= ch1_reg_1_q;

    -- make the signed comparator
    ch1Compare1: signedComparator
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            x => signed(ch1_reg_1_q), 
            y => triggerVolt16bitSigned, 
            g => ch1_compare_1_gt, 
            l => open, 
            e => open
        );

    ch1Reg2: genericRegister
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            clk => clk, 
            resetn => resetn,
            load => cw(TRIG_CH1_WRITE_CW_BIT_INDEX),
            d => ch1_reg_1_q, 
            q => ch1_reg_2_q
        );

    ch1Compare2: signedComparator
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            x => signed(ch1_reg_2_q), 
            y => triggerVolt16bitSigned, 
            g => open, 
            l => ch1_compare_2_lt, 
            e => open
        );

    -- lets assign the status word for ch1 trigger
    sw(TRIGGER_CH1_SW_BIT_INDEX) <= ch1_compare_1_gt and ch1_compare_2_lt;

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- CH2 TRIGGER
    ----------------------------------------------------------------------------------------------------------------------------------------
    ch2Reg1 : genericRegister
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            clk => clk, 
            resetn => resetn,
            load => cw(TRIG_CH2_WRITE_CW_BIT_INDEX),
            d => an7606data, 
            q => ch2_reg_1_q
        );
        
    -- assign the output
    ch2Data16bitSLV <= ch2_reg_1_q;


    -- make the signed comparator
    ch2Compare1: signedComparator
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            x => signed(ch2_reg_1_q), 
            y => triggerVolt16bitSigned, 
            g => ch2_compare_1_gt, 
            l => open, 
            e => open
        );

    ch2Reg2: genericRegister
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            clk => clk, 
            resetn => resetn,
            load => cw(TRIG_CH2_WRITE_CW_BIT_INDEX),
            d => ch2_reg_1_q, 
            q => ch2_reg_2_q
        );

    ch2Compare2: signedComparator
    generic map (n => DATA_WIDTH_IN_BITS)
        port map (
            x => signed(ch2_reg_2_q), 
            y => triggerVolt16bitSigned, 
            g => open, 
            l => ch2_compare_2_lt, 
            e => open
        );

    -- lets assign the status word for ch2 trigger
    sw(TRIGGER_CH2_SW_BIT_INDEX) <= ch2_compare_1_gt and ch2_compare_2_lt;

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- lets make the SHORT delay counter and comparator
    ----------------------------------------------------------------------------------------------------------------------------------------
    shortDelayCounter: genericCounter
    generic map (n => SHORT_DELAY_50Mhz_CONST_WIDTH)
        port map (
            clk => clk, 
            resetn => resetn,
            c => cw(SHORT_DELAY_COUNTER_CW_BIT_INDEX downto SHORT_DELAY_COUNTER_CW_BIT_INDEX - 1),
            d => (SHORT_DELAY_50Mhz_CONST_WIDTH - 1 downto 0 => '0'),
            q => shortDelayCounterOut
        );

    shortDelayCompare: genericCompare
    generic map (n => SHORT_DELAY_50Mhz_CONST_WIDTH)
        port map (
            x => shortDelayCounterOut, 
            y => SHORT_DELAY_50Mhz_COUNTS, 
            g => open, 
            l => open, 
            e => sw(SHORT_DELAY_DONE_SW_BIT_INDEX)
        );

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- lets make the LONG delay counter and comparator
    ----------------------------------------------------------------------------------------------------------------------------------------
    longDelayCounter: genericCounter
    generic map (n => LONG_DELAY_50Mhz_CONST_WIDTH)
        port map (
            clk => clk, 
            resetn => resetn,
            c => cw(LONG_DELAY_COUNTER_CW_BIT_INDEX downto LONG_DELAY_COUNTER_CW_BIT_INDEX - 1),
            d => (LONG_DELAY_50Mhz_CONST_WIDTH - 1 downto 0 => '0'),
            q => longDelayCounterOut
        );

    longDelayCompare: genericCompare
    generic map (n => LONG_DELAY_50Mhz_CONST_WIDTH)
        port map (
            x => longDelayCounterOut, 
            y => LONG_DELAY_50Mhz_COUNTS, 
            g => open, 
            l => open, 
            e => sw(LONG_DELAY_DONE_SW_BIT_INDEX)
        );

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- lets make the counter, 4:1 mux, and comparator for the period counter
    ----------------------------------------------------------------------------------------------------------------------------------------
    periodCounter: genericCounter
    generic map (N => PERIOD_50MHZ_CONST_WIDTH)
        port map (
            clk => clk, 
            resetn => resetn,
            c => cw(SAMPLING_COUNTER_CW_BIT_INDEX downto SAMPLING_COUNTER_CW_BIT_INDEX - 1),                                                  ---std_logic_vector(to_unsigned(0, PERIOD_50MHZ_CONST_WIDTH)),
            d => (PERIOD_50MHZ_CONST_WIDTH - 1 downto 0 => '0'),
            q => periodCounterOut
        );

    -- need a variable that will pad the most significat with zero. 
    mux8to1select <= '0' & cw(SAMPLING_RATE_SELECT_CW_BIT_INDEX downto SAMPLING_RATE_SELECT_CW_BIT_INDEX - 1);
    periodMUX : genericMux8x1
    generic map (N => PERIOD_50MHZ_CONST_WIDTH)
        port map (
            s => mux8to1select,
            f => muxRateSelect,
            y0 => LOWEST_RATE,
            y1 => LOW_RATE,
            y2 => HIGH_RATE,
            y3 => HIGHEST_RATE,
            y4 => HIGHEST_RATE,
            y5 => HIGHEST_RATE,
            y6 => HIGHEST_RATE,
            y7 => HIGHEST_RATE
        );

    periodCompare: genericCompare
    generic map (N => PERIOD_50MHZ_CONST_WIDTH)
        port map (
            x => periodCounterOut, 
            y => muxRateSelect, 
            g => open, 
            l => open, 
            e => sw(SAMPLE_DELAY_DONE_SW_BIT_INDEX)
        );

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- CH1 BRAM 
    ----------------------------------------------------------------------------------------------------------------------------------------
    pixelVert16 <= "0000" & pixelVert;
    addrb <= std_logic_vector(unsigned(pixelHorz) - to_unsigned(L_EDGE_ACTIVE_IN_INTEGER, VIDEO_WIDTH_IN_BITS));
        
        
        
    -- make the counter
    bramSaveLocation : genericCounter 
    generic map (N => VIDEO_WIDTH_IN_BITS)
    port map (
        clk => clk,
        resetn => resetn,
        c => cw(DATA_STORAGE_COUNTER_CW_BIT_INDEX downto DATA_STORAGE_COUNTER_CW_BIT_INDEX - 1),
        d => (others => '0'),
        q => wrAddr
    );
    
    -- make the comparitor that decides if its at the screen width
    atScreenWidth : genericCompare
    generic map (N => VIDEO_WIDTH_IN_BITS)
    port map (
        x => ACTIVE_DISPLAY_WIDTH_PIXELS_BINARY,
        y => wrAddr,
        g => open,
        e => sw(BRAM_FULL_SW_BIT_INDEX),
        l => open
    );
    
    -- make the 2sToPixel for ch1 
    ch1TwosToPixel : TwosToPixel
    generic map (N => 16)
    port map (
        twosComp => ch1_dout_2s, 
        pixelVal => ch1_dout_pixel
    );
    
    -- make the compareitor that sees if ch1 should be high
    ch1Compare: genericCompare
    generic map (N => AD7606_DATA_SIZE)
    port map (
        x => ch1_dout_pixel,
        y => pixelVert16,
        g => open,
        e => ch1,
        l => open
    );
        
     -- make the bram
     dataStorage_ch1: blk_mem_gen_0
     port map(
        clka => clk,
        ena => '1',
        wea => cw(DATA_STORAGE_CH1_WRITE_CW_BIT_INDEX downto DATA_STORAGE_CH1_WRITE_CW_BIT_INDEX),
        addra => wrAddr,                                                                                          -- this is the current bit its going to store
        dina => an7606data,
        clkb => videoClk,
        enb => '1',
        addrb => addrb,
        doutb => ch1_dout_pixel
     );

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- CH2 BRAM 
    ----------------------------------------------------------------------------------------------------------------------------------------
    
    -- make the bram
    
    dataStorage_ch2 : blk_mem_gen_0
    port map (
        addra => wrAddr, 
        wea => cw(DATA_STORAGE_CH2_WRITE_CW_BIT_INDEX downto DATA_STORAGE_CH2_WRITE_CW_BIT_INDEX),
        addrb => addrb,
        doutb => ch2_dout_2s,
        clka => clk,
        clkb => videoClk,
        ena => '1',
        enb => '1',
        dina => an7606data
    );

    -- make the 2sToPixel for ch2
    ch2TwosToPixel : TwosToPixel
    generic map (N => AD7606_DATA_SIZE)
    port map (
        twosComp => ch2_dout_2s, 
        pixelVal => ch2_dout_pixel
    );
    

    -- make the compareitor that sees if ch2 should be high
    ch2Compare : genericCompare
    generic map(N => AD7606_DATA_SIZE)
        port map (
            x => ch2_dout_pixel,
            y => pixelVert16, 
            g => open,
            e => ch2,
            l => open
        );

    ----------------------------------------------------------------------------------------------------------------------------------------
    -- build the trigger voltage 2sToPixel
    ----------------------------------------------------------------------------------------------------------------------------------------
    triggerVoltageTwosToPixel : TwosToPixel
    generic map (N => DATA_WIDTH_IN_BITS)
    port map (
        twosComp => std_logic_vector(triggerVolt16bitSigned),
        pixelVal => trigVscr
    );
    
    ---------------------------------------------------------------------------------------------------------------------------------------- 
    -- HDMI
    ----------------------------------------------------------------------------------------------------------------------------------------
    trigVscr12bit <= trigVscr(VIDEO_WIDTH_IN_BITS - 1 downto 0); 
    
    scope_face : scopeFace
    port map (
        clk => videoClk,
        resetn => resetn, 
        pixelHorz => pixelHorz,
        pixelVert => pixelVert,
        triggerVolt => trigVscr12bit,
        triggerTime => (others => '0'),                                                            --: in STD_LOGIC_VECTOR (11 downto 0);       -- idk
        red => red, 
        green => green,
        blue => blue,
        ch1 => ch1, 
        ch1Enb => '1',
        ch2 => ch2,
        ch2Enb => '1'
    );
    rgb <= red & green & blue;
    
    
    rgb2_dvi : rgb2dvi_0
    PORT MAP(
        TMDS_Clk_p => tmdsClkP,
        TMDS_Clk_n => tmdsClkN,
        TMDS_Data_p => tmdsDataP,
        TMDS_Data_n => tmdsDataN,
      
        oen         => hdmiOen,
      
        -- Auxiliary signals 
        aRst => resetn,                                                                                 -- CHECK THIS
        aRst_n => resetn, 
      
        -- Video in
        vid_pData => rgb,
        vid_pVDE => de,
        vid_pHSync => hs,
        vid_pVSync => vs, 
        PixelClk => videoClk,
      
        SerialClk => videoClk5x
    );

    -- make the videosigGen
    vsg : videoSignalGenerator
    port map (
        clk => videoClk,
        resetn => resetn, 
        hs => hs,
        vs => vs, 
        de => de,
        pixelHorz => pixelHorz,
        pixelVert => pixelVert
    );
    
    
    ---------------------------------------------------------------------------------------------------------------------------------------- 
 
   -- Simulation Clock process definition for 74.25Mhz  videoClk
   -- We are assuming that clk_period = 20ns is defined in acquireToHDMI_Package
   -- 74.25Mhz has a period of 13.5ns   
   videoClk_process :process
   begin
		videoClk <= '0';
		wait for videoClk_period/2;
		videoClk <= '1';
		wait for videoClk_period/2;
   end process;   
   
   -- Simulation Clock process definition for 371.25Mhz  videoClk5x
   -- We are assuming that clk_period = 20ns is defined in acquireToHDMI_Package
   -- 371.25Mhz has a period of 2.6936ns
   videoClk5x_process :process
   begin
		videoClk5x <= '0';
		wait for videoClk5x_period/2;
		videoClk5x <= '1';
		wait for videoClk5x_period/2;
   end process;   
      
    -- make the clock wizard 
    vc: clk_wiz_0
    PORT MAP (
        clk_in1 => clk,
        clk_out1 => videoClk,
        resetn => resetn,
        clk_out2 => videoClk5x);
        
end behavior;
