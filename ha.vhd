LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY HA IS
    PORT (
        A, B : IN STD_LOGIC;
        S, C : OUT STD_LOGIC);
END HA;

ARCHITECTURE dataflow OF HA IS    
BEGIN
    S <= A XOR B;
    C <= A AND B;    
    
END dataflow;