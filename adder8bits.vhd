LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY adder8bits IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Cin : IN STD_LOGIC;

        s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END adder8bits;

ARCHITECTURE dataflow OF adder8bits IS
    SIGNAL sum : STD_LOGIC_VECTOR (8 DOWNTO 0);
BEGIN
    sum <= ('0' & A) + B + Cin;
    S <= sum (7 DOWNTO 0);
    Cout <= sum(8);
END dataflow;