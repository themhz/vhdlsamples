LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux2x1_behavioral IS
    PORT (
        D0, D1 : IN STD_LOGIC;
        A : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END mux2x1_behavioral;
ARCHITECTURE behavioral OF mux2x1_behavioral IS
BEGIN
    PROCESS (D0, D1, A)
    BEGIN
        CASE A IS
            WHEN '0' => y <= D0;
            WHEN OTHERS => y <= D1;
        END CASE;
    END PROCESS;
END behavioral;