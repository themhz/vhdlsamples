LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ring_counter_seven_segment_1Hz IS
    PORT (
        clock, reset : IN STD_LOGIC;        
        Outp : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Outsevendigits : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END ring_counter_seven_segment_1Hz;

ARCHITECTURE behavioral OF ring_counter_seven_segment_1Hz IS

    COMPONENT clk1Hz IS
    PORT (
        clk_in, reset : IN STD_LOGIC;
        clk_out : OUT STD_LOGIC
    );
    END COMPONENT;

    COMPONENT seven_segment_decoder IS
        PORT (
            c : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Outp : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL tmp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL sevendigits : STD_LOGIC_VECTOR (6 DOWNTO 0):="0000000";
    SIGNAL clock_1Hz : STD_LOGIC;
BEGIN
        
    clk : clk1Hz PORT MAP(clock, reset, clock_1Hz); 
    --clock_1Hz <= clock;

    PROCESS (clock_1Hz, reset, tmp)
    BEGIN
        IF reset = '1' THEN
            tmp <= "1000";
        ELSIF rising_edge(clock_1Hz) THEN
            tmp(2) <= tmp(3);
            tmp(1) <= tmp(2);
            tmp(0) <= tmp(1);
            tmp(3) <= tmp(0);
        END IF;
    END PROCESS;

    decoder : seven_segment_decoder PORT MAP(tmp, sevendigits);
    
    Outsevendigits <= sevendigits;
    Outp <= tmp;
END behavioral;