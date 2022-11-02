--------------------------------------------------
-- Name: Mark McNulty
-- Date: 10/28/22
-- Purp: convert 2s to pixel value
--------------------------------------------------

--  shift_right(TO_SIGNED(ch2_dout_2s) * (-300), 15) + 350
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity TwosToPixel is
    generic(N: integer := 16);
    port( 
        twosComp: in std_logic_vector(N-1 downto 0);
        pixelVal : out std_logic_vector(N-1 downto 0)
	);
end TwosToPixel;

architecture behavior of TwosToPixel is
    -- any intermediate signals go here
    CONSTANT MULT : INTEGER := -300;
    signal stepOne : SIGNED(32-1 downto 0);
    signal stepTwo : SIGNED(32-1 downto 0);
    signal stepThree : SIGNED(32-1 downto 0);

begin
    -- building the thing goes here
--    stepOne <= TO_SIGNED(twosComp) * TO_SIGNED(-300, 16);
    stepOne <= TO_SIGNED(-300, 16) * signed(twosComp);
    stepTwo <= shift_right(stepOne, 15);
    stepThree <= stepTwo + TO_SIGNED(350, N);
    pixelVal <= std_logic_vector(stepThree(N - 1 downto 0));

end behavior;
