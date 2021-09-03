LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY shift_register IS
    PORT (
        data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        Q : BUFFER STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000"
    );
END shift_register;

ARCHITECTURE behavioral OF shift_register IS
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge (clk) THEN
            IF load = '1' THEN
                Q <= data_in;
                ELSE
                F1 : FOR i IN 0 TO 6 LOOP
                    Q(i) <= Q(i + 1);
                END LOOP;
                Q(7) <= '0';
            END IF;
        END IF;
    END PROCESS;
END behavioral;