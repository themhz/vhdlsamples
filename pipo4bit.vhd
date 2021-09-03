LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY pipo4bit IS
    PORT (
        clock, reset : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END pipo4bit;

ARCHITECTURE behavioral OF pipo4bit IS
BEGIN
    PROCESS (clock, reset)
    BEGIN
        IF reset = '0' THEN
            Q <= "0000";
            ELSIF clock'event AND clock = '1' THEN
            Q <= D;
        END IF;
    END PROCESS;
END behavioral;