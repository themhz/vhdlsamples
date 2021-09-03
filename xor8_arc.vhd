LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY xor8 IS
    PORT (
        inp1, inp2 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        outp1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END xor8;

ARCHITECTURE xor8_arc OF xor8 IS
BEGIN
    G1 : FOR i IN 0 TO 7 GENERATE
        outp1(i) <= inp1(i) XOR inp2(i);
    END GENERATE;
END xor8_arc;