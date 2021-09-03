LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY diff_asynchronous IS
    PORT (
        D : IN STD_LOGIC;
        clock, reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC := '0'
    );
END diff_asynchronous;

ARCHITECTURE behavioral OF diff_asynchronous IS
BEGIN
    PROCESS (clock, reset)
    BEGIN
        IF reset = '1' THEN
            Q <= '0';
            ELSIF falling_edge(clock) THEN
            Q <= D;
        END IF;
    END PROCESS;
END behavioral;