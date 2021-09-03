LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY counter_up_asyn IS
    PORT (
        clock, reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END counter_up_asyn;

ARCHITECTURE behavioral OF counter_up_asyn IS
    SIGNAL tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN
    
    PROCESS (clock, reset)
    BEGIN
        IF reset = '1' THEN
            tmp <= "0000";
            ELSIF clock'event AND clock = '0' THEN
            tmp <= tmp + 1;
        END IF;
    END PROCESS;

    Q <= tmp;
END behavioral;