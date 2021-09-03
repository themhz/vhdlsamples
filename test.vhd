LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY tester IS
    PORT (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(0 to 7)
    );
END tester;

ARCHITECTURE tester_arc OF tester IS    
    -- SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
    G1 : FOR i IN 0 TO 7 GENERATE
        output(i) <= input(i);
    END GENERATE;
    -- output <= tmp;
END tester_arc;