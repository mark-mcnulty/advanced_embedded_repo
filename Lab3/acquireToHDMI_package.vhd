----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.hdmi_package.all;


package acquireToHDMI_package is


-- Clock period definitions
CONSTANT clk_period : time := 20 ns;			-- 50Mhz crystal input (XTL_IN).
CONSTANT videoClk_period : time := 13468 ps;
CONSTANT videoClk5x_period : time := 2694 ps;

-- You need to complete this
type state_type is (RESET_STATE);

----------------------------- VARIABLES -------------------------------
CONSTANT AD7606_DATA_SIZE : NATURAL := 16;
CONSTANT VIDEO_WIDTH_IN_BITS : NATURAL := 12;                           
CONSTANT ACTIVE_DISPLAY_REGION_WIDTH_IN_BITS : NATURAL := 10;


CONSTANT SCREEN_WIDTH_IN_INTEGER : NATURAL := 1280;
CONSTANT L_EDGE_ACTIVE_IN_INTEGER : INTEGER := 100;

CONSTANT DATA_WIDTH_IN_BITS : NATURAL := 16;                         
CONSTANT PERIOD_50MHZ_CONST_WIDTH : NATURAL := 32;


CONSTANT ACTIVE_DISPLAY_WIDTH_PIXELS : NATURAL := 1000;
CONSTANT ACTIVE_DISPLAY_WIDTH_PIXELS_BINARY : STD_LOGIC_VECTOR(VIDEO_WIDTH_IN_BITS - 1 downto 0) := std_logic_vector(to_unsigned(ACTIVE_DISPLAY_WIDTH_PIXELS, VIDEO_WIDTH_IN_BITS)); 

---------------------------- CONTROL WORD -----------------------------
CONSTANT CW_WIDTH : NATURAL := 22;
CONSTANT CLEAR_STORE_FLAG_CW_BIT_INDEX : NATURAL := 21;
CONSTANT SET_STORE_FLAG_CW_BIT_INDEX : NATURAL := 20;
CONSTANT TRIG_CH2_WRITE_CW_BIT_INDEX : NATURAL := 19;
CONSTANT TRIG_CH1_WRITE_CW_BIT_INDEX : NATURAL := 18;
CONSTANT CONVERSION_PLUS_READOUT_CW_BIT_INDEX : NATURAL := 17;
CONSTANT SAMPLE_TIMER_ROLLOVER_CW_BIT_INDEX : NATURAL := 16;
CONSTANT DATA_STORAGE_CH2_WRITE_CW_BIT_INDEX : NATURAL := 15;
CONSTANT DATA_STORAGE_CH1_WRITE_CW_BIT_INDEX : NATURAL := 14;
CONSTANT CONVST_CW_BIT_INDEX : NATURAL := 13;
CONSTANT RD_CW_BIT_INDEX : NATURAL := 12;
CONSTANT CS_CW_BIT_INDEX : NATURAL := 11;
CONSTANT RESET_AD7606_CW_BIT_INDEX : NATURAL := 10;
CONSTANT DATA_STORAGE_COUNTER_CW_BIT_INDEX : NATURAL := 9; -- 9:8
CONSTANT SAMPLING_COUNTER_CW_BIT_INDEX : NATURAL := 7; -- 7:6
CONSTANT SAMPLING_RATE_SELECT_CW_BIT_INDEX : NATURAL := 5; -- 5:4
CONSTANT LONG_DELAY_COUNTER_CW_BIT_INDEX : NATURAL := 3; -- 3:2
CONSTANT SHORT_DELAY_COUNTER_CW_BIT_INDEX : NATURAL := 1; -- 1:0

---------------------------- STATUS WORD -----------------------------
CONSTANT DATAPATH_SW_WIDTH : NATURAL := 7;
CONSTANT SW_WIDTH : NATURAL := 10;

CONSTANT BUSY_SW_BIT_INDEX : NATURAL := 9;
CONSTANT SINGLE_SW_BIT_INDEX : NATURAL := 8;
CONSTANT FORCED_MODE_SW_BIT_INDEX : NATURAL := 7;

CONSTANT STORE_SW_BIT_INDEX : NATURAL := 6;
CONSTANT BRAM_FULL_SW_BIT_INDEX : NATURAL := 5;
CONSTANT TRIGGER_CH2_SW_BIT_INDEX : NATURAL := 4;
CONSTANT TRIGGER_CH1_SW_BIT_INDEX : NATURAL := 3;
CONSTANT SAMPLE_DELAY_DONE_SW_BIT_INDEX : NATURAL := 2;
CONSTANT LONG_DELAY_DONE_SW_BIT_INDEX : NATURAL := 1;
CONSTANT SHORT_DELAY_DONE_SW_BIT_INDEX : NATURAL := 0;



CONSTANT LONG_DELAY_50Mhz_CONST_WIDTH : NATURAL := 24;
-- For Synthesis
--CONSTANT LONG_DELAY_50Mhz_COUNTS : STD_LOGIC_VECTOR(LONG_DELAY_50Mhz_CONST_WIDTH - 1 downto 0) := x"00FFFF";
-- For Simulation
 CONSTANT LONG_DELAY_50Mhz_COUNTS : STD_LOGIC_VECTOR(LONG_DELAY_50Mhz_CONST_WIDTH - 1 downto 0) := x"000020";

CONSTANT SHORT_DELAY_50Mhz_CONST_WIDTH : NATURAL := 8; 
CONSTANT SHORT_DELAY_50Mhz_COUNTS : STD_LOGIC_VECTOR(SHORT_DELAY_50Mhz_CONST_WIDTH - 1 downto 0) := x"10";

CONSTANT HIGHEST_RATE   : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(300, 32));
CONSTANT HIGH_RATE      : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(600, 32));
CONSTANT LOW_RATE       : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(1200, 32));
CONSTANT LOWEST_RATE    : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(2400, 32));


-- this is where we will instantiate the components
component acquireToHDMI_fsm is
    PORT (  clk : in  STD_LOGIC;
            resetn : in  STD_LOGIC;
            sw: in STD_LOGIC_VECTOR(SW_WIDTH - 1 downto 0);
            cw: out STD_LOGIC_VECTOR (CW_WIDTH - 1 downto 0));
end component;

component acquireToHDMI_datapath is
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
end component;

component acquireToHDMI is
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
end component;	

component an7606 is
    PORT ( clk : in  STD_LOGIC;
           an7606data: out STD_LOGIC_VECTOR(15 downto 0);
           an7606convst, an7606cs, an7606rd, an7606reset: in STD_LOGIC;
           an7606od: in STD_LOGIC_VECTOR(2 downto 0);
           an7606busy : out STD_LOGIC);
END component;

component blk_mem_gen_0 is
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(VIDEO_WIDTH_IN_BITS - 1 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(VIDEO_WIDTH_IN_BITS - 1 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END component;

component clk_wiz_0 is 
    PORT(
     clk_in1 : in std_logic;
     clk_out1 : out std_logic;
     resetn : in std_logic;
     clk_out2 : out std_logic
    );
end component;

component rgb2dvi_0 is
   Port (
      -- DVI 1.0 TMDS video interface
      TMDS_Clk_p : out std_logic;
      TMDS_Clk_n : out std_logic;
      TMDS_Data_p : out std_logic_vector(2 downto 0);
      TMDS_Data_n : out std_logic_vector(2 downto 0);
      
      oen         : out std_logic;
      
      -- Auxiliary signals 
      aRst : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
      aRst_n : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
      
      -- Video in
      vid_pData : in std_logic_vector(23 downto 0);
      vid_pVDE : in std_logic;
      vid_pHSync : in std_logic;
      vid_pVSync : in std_logic;
      PixelClk : in std_logic; --pixel-clock recovered from the DVI interface
      
      SerialClk : in std_logic); -- 5x PixelClk
end component;

    
component TwosToPixel is
generic(N: integer := 16);
    port( 
        twosComp: in std_logic_vector(N-1 downto 0);
        pixelVal : out std_logic_vector(N-1 downto 0)
    );
end component;

component signedComparator is
generic(N: integer := 4);
port( 
    x, y: in signed(N-1 downto 0);
    g, l, e : out std_logic
);
end component;

end package;