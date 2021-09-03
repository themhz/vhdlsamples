LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FA IS
    PORT (
        A, B, Ci : IN STD_LOGIC;
        S, Co : OUT STD_LOGIC);
END FA;

ARCHITECTURE dataflow OF FA IS
    SIGNAL X1, X2, X3 : STD_LOGIC;
BEGIN
    X1 <= A XOR B;
    X2 <= X1 AND Ci;
    X3 <= A AND B;
    S <= X1 XOR Ci;
    Co <= X2 OR X3;
END dataflow;