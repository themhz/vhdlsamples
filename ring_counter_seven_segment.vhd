LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ring_counter_seven_segment IS
    PORT (
        clock, reset : IN STD_LOGIC;        
        Outp : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Outsevendigits : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END ring_counter_seven_segment;

ARCHITECTURE behavioral OF ring_counter_seven_segment IS
    COMPONENT seven_segment_decoder IS
        PORT (
            c : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Outp : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL tmp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL sevendigits : STD_LOGIC_VECTOR (6 DOWNTO 0):="0000000";
BEGIN

    decoder : seven_segment_decoder PORT MAP(tmp, sevendigits);
    PROCESS (clock, reset, tmp)
    BEGIN
        IF reset = '1' THEN
            tmp <= "1000";
        ELSIF rising_edge(clock) THEN
            tmp(2) <= tmp(3);
            tmp(1) <= tmp(2);
            tmp(0) <= tmp(1);
            tmp(3) <= tmp(0);
        END IF;
    END PROCESS;

    
    
    Outsevendigits <= sevendigits;
    Outp <= tmp;
END behavioral;