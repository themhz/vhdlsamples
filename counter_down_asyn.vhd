LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY counter_down_asyn IS
    PORT (
        clock, reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END counter_down_asyn;

ARCHITECTURE behavioral OF counter_down_asyn IS
    SIGNAL tmp : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
BEGIN

    PROCESS (clock, reset)
    BEGIN
        IF clock'event AND clock = '1' THEN
            IF reset = '1' THEN
                tmp <= "1111";
                ELSE
                tmp <= tmp - 1;
            END IF;
        END IF;
    END PROCESS;

    Q <= tmp;
END behavioral;