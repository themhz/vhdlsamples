LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY clk1Hz IS
    PORT (
        clk_in, reset : IN STD_LOGIC;
        clk_out : OUT STD_LOGIC
    );
END clk1Hz;

ARCHITECTURE behavioral OF clk1Hz IS
    SIGNAL tmp : STD_LOGIC;
    SIGNAL counter : INTEGER RANGE 0 TO 24999999 := 0;
BEGIN
    PROCESS (clk_in, reset)
    BEGIN
        IF reset = '1' THEN
            tmp <= '0';
            counter <= 0;
            ELSIF rising_edge(clk_in) THEN
            IF counter = 24999999 THEN
                tmp <= NOT(tmp);
                counter <= 0;
                ELSE
                counter <= counter + 1;
            END IF;
        END IF;
    END PROCESS;

    clk_out <= tmp;
END behavioral;