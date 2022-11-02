--------------------------------------------------
-- Name: Mark McNulty
-- Date: 10/28/22
-- Purp: to compare two signed vectors
--------------------------------------------------

--  shift_right(TO_SIGNED(ch2_dout_2s) * (-300), 15) + 350
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity signedComparator is
    generic(N: integer := 4);
    port( 
        x, y: in signed(N-1 downto 0);
        g, l, e : out std_logic
	);
end signedComparator;

architecture behavior of signedComparator is
    -- any intermediate signals go here
    signal tmp : std_logic_vector(3-1 downto 0);


begin
    -- building the thing goes here
    tmp <=  "100" when x > y else 
            "010" when x < y else
            "001";

    -- assign the outputs
    g <= tmp(2);
    l <= tmp(1);
    e <= tmp(0);
    
end behavior;
