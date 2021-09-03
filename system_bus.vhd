LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY system_bus IS
    PORT (
        A, B, C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S0, S1, S2 : IN STD_LOGIC;
        data_bus : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END system_bus;

ARCHITECTURE behavioral OF system_bus IS
    SIGNAL control : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    control <= S2 & S1 & S0;

    PROCESS (control)
    BEGIN
        CASE control IS
            WHEN "001" => data_bus <= A;
            WHEN "010" => data_bus <= B;
            WHEN "100" => data_bus <= C;
            WHEN OTHERS => data_bus <= "0000";
        END CASE;
    END PROCESS;
END behavioral;