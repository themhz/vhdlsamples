LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY johnson_counter IS
    PORT (
        clock, reset : IN STD_LOGIC;
        Outp : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END johnson_counter;

ARCHITECTURE behavioral OF johnson_counter IS

    COMPONENT clk1Hz IS
        PORT (
            clk_in, reset : IN STD_LOGIC;
            clk_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL tmp : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL clock_1Hz : STD_LOGIC;
BEGIN

    clk : clk1Hz PORT MAP(clock, reset, clock_1Hz);
    --clock_1Hz <=clock;
    PROCESS (clock_1Hz, reset)
    BEGIN
        IF reset = '1' THEN
            tmp <= "1000";
            ELSIF rising_edge(clock_1Hz) THEN
            tmp(2) <= tmp(3);
            tmp(1) <= tmp(2);
            tmp(0) <= tmp(1);
            IF tmp = "1111" THEN
                tmp(3) <= '0';
                ELSIF tmp = "0000" THEN
                tmp <= "1000";
            END IF;

        END IF;
    END PROCESS;

    Outp <= tmp;
END behavioral;