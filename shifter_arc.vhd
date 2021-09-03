LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY shifter IS
    PORT (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END shifter;

ARCHITECTURE shifter_arc OF shifter IS
    -- SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
    SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
    G1 : FOR i IN 0 TO 6 GENERATE
        tmp(i) <= input(i + 1);
    END GENERATE;
    output <= tmp;
END shifter_arc;