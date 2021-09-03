LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY register_8bit IS
    PORT (
        Rin : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        clock, reset, load, inc : IN STD_LOGIC;
        Rout : OUT STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000"
    );
END register_8bit;

ARCHITECTURE behavioral OF register_8bit IS
    SIGNAL reg_data : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
BEGIN
    PROCESS (clock, reset)
    BEGIN
        IF reset = '1' THEN
            reg_data <= "00000000";
            ELSIF falling_edge(clock) THEN
            IF load = '1' THEN
                reg_data <= Rin;
                ELSIF inc = '1' THEN
                reg_data <= reg_data + 1;
            END IF;
        END IF;
    END PROCESS;

    Rout <= reg_data;
END behavioral;