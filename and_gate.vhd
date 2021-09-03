LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY and_gate IS
    PORT (
        A, B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END and_gate;

ARCHITECTURE dataflow OF and_gate IS
BEGIN
    Y <= A AND B;
END dataflow;