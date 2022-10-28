

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


-- define the package
package hdmi_package is 

    -- define the videoSignalGenerator
    component videoSignalGenerator is
        port(
            clk: in std_logic;
            resetn: in std_logic;
            hs: out std_logic;
            vs: out std_logic;
            de: out std_logic;
            pixelHorz: out std_logic_vector(11 downto 0);
            pixelVert: out std_logic_vector(11 downto 0));
    end component;

    -- define scopeFace
    component scopeFace is 
        port(
            clk: in std_logic;
            resetn: in std_logic;
            pixelHorz: in std_logic_vector(11 downto 0);
            pixelVert: in std_logic_vector(11 downto 0);
            triggerVolt: in std_logic_vector(11 downto 0);
            triggerTime: in std_logic_vector(11 downto 0);
            red: out std_logic_vector(7 downto 0);
            green: out std_logic_vector(7 downto 0);
            blue: out std_logic_vector(7 downto 0);
            ch1: in std_logic;
            ch1Enb: in std_logic;
            ch2: in std_logic;
            ch2Enb: in std_logic);
    end component;

    
end package;