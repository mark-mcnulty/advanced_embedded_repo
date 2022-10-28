----------------------------------------------------------------------------------
-- Include proper comment header block
-- ***Do not use mod operator in this code***
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scopeFace is
    PORT ( 	
        clk: in  STD_LOGIC;
        resetn : in  STD_LOGIC;
        pixelHorz : in  STD_LOGIC_VECTOR(11 downto 0);
        pixelVert : in  STD_LOGIC_VECTOR(11 downto 0);
        triggerVolt: in STD_LOGIC_VECTOR (11 downto 0);
        triggerTime: in STD_LOGIC_VECTOR (11 downto 0);
        red : out  STD_LOGIC_VECTOR(7 downto 0);
        green : out  STD_LOGIC_VECTOR(7 downto 0);
        blue : out  STD_LOGIC_VECTOR(7 downto 0);
        ch1: in STD_LOGIC;
        ch1Enb: in STD_LOGIC;
        ch2: in STD_LOGIC;
        ch2Enb: in STD_LOGIC);
end scopeFace;


architecture Behavioral of scopeFace is

    -- You should create constants for your display so that you can easily move the
    -- oscilloscope face around the display.  This makes it easier to make things look
    -- just right.
    constant H_ACTIVE : STD_LOGIC_VECTOR(11 downto 0) := std_logic_vector(to_unsigned(1280, 12));
    constant V_ACTIVE : STD_LOGIC_VECTOR(11 downto 0) := std_logic_vector(to_unsigned(720, 12));

    -- Finish and add more 
    constant X_OFFSET : STD_LOGIC_VECTOR(11 downto 0) := std_logic_vector(to_unsigned(50, 12));
    constant Y_OFFSET : STD_LOGIC_VECTOR(11 downto 0) := std_logic_vector(to_unsigned(50, 12));

    -- width of the oscilloscope face
    constant X_WIDTH : STD_LOGIC_VECTOR(11 downto 0) := std_logic_vector(to_unsigned(1100, 12));
    constant Y_WIDTH : STD_LOGIC_VECTOR(11 downto 0) := std_logic_vector(to_unsigned(650, 12));

    constant L_EDGE : STD_LOGIC_VECTOR(11 downto 0) := X_OFFSET;
    constant R_EDGE : STD_LOGIC_VECTOR(11 downto 0) := X_WIDTH + X_OFFSET;
    constant T_EDGE : STD_LOGIC_VECTOR(11 downto 0) := Y_OFFSET;
    constant B_EDGE : STD_LOGIC_VECTOR(11 downto 0) := Y_WIDTH + Y_OFFSET;

    -- set colors
    -- You should create constants for your display colors so that modify the colors 
    -- to make things look just right.
    constant BORDER_R : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant BORDER_G : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant BORDER_B : STD_LOGIC_VECTOR(7 downto 0) := X"FF";

    -- Finish and add more 
    constant GRID_R : STD_LOGIC_VECTOR(7 downto 0) := X"40";
    constant GRID_G : STD_LOGIC_VECTOR(7 downto 0) := X"40";
    constant GRID_B : STD_LOGIC_VECTOR(7 downto 0) := X"40";

    
    -- add the trace color
    constant TRACE1_R : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant TRACE1_G : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant TRACE1_B : STD_LOGIC_VECTOR(7 downto 0) := X"00";

    -- add the trace 2 color
    constant TRACE2_R : STD_LOGIC_VECTOR(7 downto 0) := X"00";
    constant TRACE2_G : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant TRACE2_B : STD_LOGIC_VECTOR(7 downto 0) := X"00";

    -- add the marker color
    constant MARKER_R : STD_LOGIC_VECTOR(7 downto 0) := X"00";
    constant MARKER_G : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant MARKER_B : STD_LOGIC_VECTOR(7 downto 0) := X"FF";

    -- add the trigger color
    constant TRIGGER_R : STD_LOGIC_VECTOR(7 downto 0) := X"FF";
    constant TRIGGER_G : STD_LOGIC_VECTOR(7 downto 0) := X"00";
    constant TRIGGER_B : STD_LOGIC_VECTOR(7 downto 0) := X"FF";


    -- Set these signals to '1' when the features should be drawn at the current pixelHorz, pixelVert 
    -- cordinate.  These act like Feature Booleans which you will use in the process(clk) to set the 
    -- correct RGB for this pixel location. Finish and add more.
    signal boarder: STD_LOGIC;
    signal gridH, gridV: STD_LOGIC;
    signal hashH, hashV: STD_LOGIC;
    signal trace1, trace2: STD_LOGIC;
    signal trigger: STD_LOGIC;
    signal markerX, markerY: STD_LOGIC;

begin


    ---------------------------------------------------------------------
    -- Use the Feature Booleans to set the RGB at this pixel location.
    -- The waveforms should sit "on top" of the grid.
    ---------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge (clk) then
            if resetn = '0' then
                red <= (others => '0');
                green <= (others => '0');
                blue <= (others => '0');
            else
                if (boarder = '1') then
                    red <= BORDER_R;
                    green <= BORDER_G;
                    blue <= BORDER_B;
                elsif (markerX = '1') or (markerY = '1') then
                    red <= MARKER_R;
                    green <= MARKER_G;
                    blue <= MARKER_B;
                elsif (trace1 = '1') then 
                    red <= TRACE1_R;
                    green <= TRACE1_G;
                    blue <= TRACE1_B;
                elsif (trace2 = '1') then 
                    red <= TRACE2_R;
                    green <= TRACE2_G;
                    blue <= TRACE2_B;
                elsif ((gridH = '1') or (gridV = '1')) then
                    red <= GRID_R;
                    green <= GRID_G;
                    blue <= GRID_B;
                elsif ((hashH = '1') or (hashV = '1')) then
                    red <= GRID_R;
                    green <= GRID_G;
                    blue <= GRID_B;
                else
                    red <= X"00";
                    green <= X"00";
                    blue <= X"00";
                end if;
            end if;
        end if;
    end process;

--START DRAWING
--
--
--
--START DRAWING



trace1 <= '1' when (ch1 = '1') and (ch1Enb = '1') and (pixelVert >= 50) and (pixelVert <= 650) and (pixelHorz >= 100) and (pixelHorz <= 1100) else '0';
    trace2 <= '1' when (ch2 = '1') and (ch2Enb = '1') and (pixelVert >= 50) and (pixelVert <= 650) and (pixelHorz >= 100) and (pixelHorz <= 1100) else '0';
    
    boarder <=
            '1' when ((pixelHorz = 100) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 1100) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelVert = 50) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 650) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelHorz = 99) and (pixelVert >= 49) and (pixelVert <= 651)) else
            '1' when ((pixelHorz = 1101) and (pixelVert >= 49) and (pixelVert <= 651)) else
            '1' when ((pixelVert = 49) and (pixelHorz >= 99) and (pixelHorz <= 1101)) else
            '1' when ((pixelVert = 651) and (pixelHorz >= 99) and (pixelHorz <= 1101)) else
            '0';
    
    gridH <=
            '1' when ((pixelHorz = 100) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 200) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 300) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 400) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 500) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 600) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 700) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 800) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 900) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '1' when ((pixelHorz = 1000) and (pixelVert >= 50) and (pixelVert <= 650)) else
            '0';
    
    
    gridV <=
            '1' when ((pixelVert = 50) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 110) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 170) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 230) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 290) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 350) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 410) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 470) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 530) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '1' when ((pixelVert = 590) and (pixelHorz >= 100) and (pixelHorz <= 1100)) else
            '0';
    
    
    hashH <=
            '1' when ((pixelHorz = 100) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 100) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 100) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 100) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 100) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 100) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 120) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 120) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 120) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 120) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 120) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 120) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 140) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 140) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 140) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 140) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 140) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 140) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 160) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 160) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 160) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 160) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 160) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 160) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 180) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 180) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 180) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 180) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 180) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 180) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 200) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 200) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 200) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 200) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 200) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 200) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 220) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 220) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 220) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 220) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 220) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 220) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 240) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 240) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 240) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 240) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 240) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 240) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 260) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 260) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 260) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 260) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 260) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 260) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 280) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 280) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 280) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 280) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 280) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 280) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 300) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 300) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 300) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 300) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 300) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 300) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 320) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 320) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 320) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 320) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 320) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 320) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 340) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 340) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 340) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 340) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 340) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 340) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 360) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 360) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 360) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 360) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 360) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 360) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 380) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 380) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 380) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 380) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 380) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 380) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 400) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 400) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 400) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 400) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 400) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 400) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 420) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 420) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 420) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 420) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 420) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 420) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 440) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 440) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 440) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 440) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 440) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 440) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 460) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 460) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 460) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 460) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 460) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 460) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 480) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 480) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 480) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 480) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 480) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 480) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 500) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 500) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 500) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 500) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 500) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 500) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 520) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 520) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 520) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 520) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 520) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 520) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 540) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 540) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 540) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 540) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 540) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 540) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 560) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 560) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 560) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 560) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 560) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 560) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 580) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 580) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 580) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 580) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 580) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 580) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 600) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 600) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 600) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 600) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 600) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 600) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 620) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 620) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 620) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 620) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 620) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 620) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 640) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 640) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 640) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 640) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 640) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 640) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 660) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 660) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 660) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 660) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 660) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 660) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 680) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 680) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 680) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 680) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 680) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 680) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 700) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 700) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 700) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 700) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 700) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 700) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 720) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 720) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 720) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 720) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 720) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 720) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 740) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 740) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 740) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 740) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 740) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 740) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 760) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 760) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 760) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 760) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 760) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 760) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 780) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 780) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 780) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 780) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 780) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 780) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 800) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 800) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 800) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 800) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 800) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 800) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 820) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 820) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 820) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 820) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 820) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 820) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 840) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 840) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 840) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 840) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 840) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 840) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 860) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 860) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 860) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 860) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 860) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 860) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 880) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 880) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 880) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 880) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 880) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 880) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 900) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 900) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 900) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 900) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 900) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 900) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 920) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 920) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 920) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 920) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 920) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 920) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 940) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 940) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 940) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 940) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 940) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 940) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 960) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 960) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 960) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 960) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 960) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 960) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 980) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 980) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 980) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 980) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 980) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 980) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 1000) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 1000) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 1000) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 1000) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 1000) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 1000) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 1020) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 1020) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 1020) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 1020) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 1020) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 1020) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 1040) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 1040) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 1040) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 1040) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 1040) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 1040) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 1060) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 1060) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 1060) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 1060) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 1060) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 1060) and (pixelVert = 352)) else
            '1' when ((pixelHorz = 1080) and (pixelVert = 347)) else
            '1' when ((pixelHorz = 1080) and (pixelVert = 348)) else
            '1' when ((pixelHorz = 1080) and (pixelVert = 349)) else
            '1' when ((pixelHorz = 1080) and (pixelVert = 350)) else
            '1' when ((pixelHorz = 1080) and (pixelVert = 351)) else
            '1' when ((pixelHorz = 1080) and (pixelVert = 352)) else
            '0';
    
    
    hashV <= 
            '1' when ((pixelHorz = 597) and (pixelVert = 50)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 50)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 50)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 50)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 50)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 50)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 62)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 62)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 62)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 62)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 62)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 62)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 74)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 74)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 74)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 74)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 74)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 74)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 86)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 86)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 86)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 86)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 86)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 86)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 98)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 98)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 98)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 98)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 98)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 98)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 110)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 110)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 110)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 110)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 110)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 110)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 122)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 122)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 122)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 122)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 122)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 122)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 134)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 134)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 134)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 134)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 134)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 134)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 146)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 146)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 146)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 146)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 146)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 146)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 158)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 158)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 158)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 158)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 158)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 158)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 170)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 170)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 170)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 170)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 170)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 170)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 182)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 182)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 182)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 182)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 182)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 182)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 194)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 194)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 194)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 194)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 194)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 194)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 206)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 206)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 206)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 206)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 206)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 206)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 218)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 218)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 218)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 218)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 218)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 218)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 230)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 230)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 230)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 230)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 230)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 230)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 242)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 242)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 242)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 242)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 242)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 242)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 254)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 254)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 254)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 254)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 254)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 254)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 266)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 266)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 266)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 266)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 266)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 266)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 278)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 278)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 278)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 278)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 278)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 278)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 290)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 290)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 290)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 290)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 290)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 290)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 302)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 302)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 302)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 302)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 302)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 302)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 314)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 314)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 314)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 314)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 314)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 314)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 326)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 326)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 326)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 326)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 326)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 326)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 338)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 338)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 338)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 338)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 338)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 338)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 350)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 350)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 350)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 350)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 350)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 350)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 362)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 362)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 362)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 362)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 362)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 362)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 374)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 374)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 374)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 374)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 374)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 374)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 386)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 386)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 386)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 386)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 386)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 386)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 398)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 398)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 398)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 398)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 398)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 398)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 410)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 410)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 410)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 410)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 410)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 410)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 422)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 422)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 422)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 422)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 422)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 422)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 434)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 434)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 434)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 434)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 434)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 434)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 446)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 446)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 446)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 446)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 446)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 446)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 458)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 458)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 458)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 458)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 458)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 458)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 470)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 470)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 470)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 470)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 470)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 470)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 482)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 482)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 482)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 482)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 482)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 482)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 494)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 494)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 494)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 494)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 494)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 494)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 506)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 506)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 506)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 506)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 506)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 506)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 518)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 518)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 518)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 518)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 518)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 518)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 530)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 530)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 530)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 530)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 530)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 530)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 542)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 542)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 542)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 542)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 542)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 542)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 554)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 554)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 554)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 554)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 554)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 554)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 566)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 566)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 566)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 566)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 566)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 566)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 578)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 578)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 578)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 578)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 578)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 578)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 590)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 590)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 590)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 590)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 590)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 590)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 602)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 602)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 602)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 602)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 602)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 602)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 614)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 614)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 614)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 614)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 614)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 614)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 626)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 626)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 626)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 626)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 626)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 626)) else 
            '1' when ((pixelHorz = 597) and (pixelVert = 638)) else 
            '1' when ((pixelHorz = 598) and (pixelVert = 638)) else 
            '1' when ((pixelHorz = 599) and (pixelVert = 638)) else 
            '1' when ((pixelHorz = 600) and (pixelVert = 638)) else 
            '1' when ((pixelHorz = 601) and (pixelVert = 638)) else 
            '1' when ((pixelHorz = 602) and (pixelVert = 638)) else 
            '0';
    
    
    markerX <= 
            '1' when (pixelHorz >= triggerTime - 5) and (pixelHorz <= triggerTime + 5) and (pixelVert = 51) else
            '1' when (pixelHorz >= triggerTime - 4) and (pixelHorz <= triggerTime + 4) and (pixelVert = 52) else
            '1' when (pixelHorz >= triggerTime - 3) and (pixelHorz <= triggerTime + 3) and (pixelVert = 53) else
            '1' when (pixelHorz >= triggerTime - 2) and (pixelHorz <= triggerTime + 2) and (pixelVert = 54) else
            '1' when (pixelHorz >= triggerTime - 1) and (pixelHorz <= triggerTime + 1) and (pixelVert = 55) else
            '1' when ((pixelHorz = triggerTime) and (pixelVert = 56)) else 
            '0';
    
    
    markerY <= 
            '1' when (pixelVert >= triggerVolt - 5) and (pixelVert <= triggerVolt + 5) and (pixelHorz = 101) else 
            '1' when (pixelVert >= triggerVolt - 4) and (pixelVert <= triggerVolt + 4) and (pixelHorz = 102) else 
            '1' when (pixelVert >= triggerVolt - 3) and (pixelVert <= triggerVolt + 3) and (pixelHorz = 103) else 
            '1' when (pixelVert >= triggerVolt - 2) and (pixelVert <= triggerVolt + 2) and (pixelHorz = 104) else 
            '1' when (pixelVert >= triggerVolt - 1) and (pixelVert <= triggerVolt + 1) and (pixelHorz = 105) else 
            '1' when ((pixelHorz = 106) and (pixelVert = triggerVolt)) else 
            '0';
    
    
    
    
    
    
    
    
    

-- END DRAWING 
--
--
--
--END DRAWING

  

end Behavioral;


