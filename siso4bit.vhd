LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY siso4bit IS
    PORT (
        clock, reset : IN STD_LOGIC;
        INP : IN STD_LOGIC;
        OUTP : OUT STD_LOGIC := '0'
    );
END siso4bit;

ARCHITECTURE behavioral OF siso4bit IS
BEGIN
    PROCESS (clock, reset)
        VARIABLE temp : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    BEGIN
        IF reset = '0' THEN
            temp := "0000";
            ELSIF rising_edge(clock) THEN
            temp := INP & temp (3 DOWNTO 1);
            OUTP <= temp(0);
        END IF;
    END PROCESS;
END behavioral;