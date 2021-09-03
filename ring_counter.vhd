LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ring_counter IS
    PORT (
        clock, reset : IN STD_LOGIC;
        Outp : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END ring_counter;

ARCHITECTURE behavioral OF ring_counter IS
    SIGNAL tmp : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
BEGIN
    PROCESS (clock, reset)
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
    Outp <= tmp;
END behavioral;