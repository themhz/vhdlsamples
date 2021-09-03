LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY adder16bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END adder16bit;

ARCHITECTURE arc OF adder16bit IS
BEGIN

    PROCESS (A, B, Cin)
        VARIABLE carry : STD_LOGIC_VECTOR(16 DOWNTO 0);
    BEGIN
        carry(0) := Cin;
        FOR i IN 0 TO 15 LOOP
            S(i) <= (A(i) XOR B(i)) XOR carry(i);
            carry(i + 1) := ((A(i) XOR B(i)) AND carry(i)) OR (A(i) AND B(i));
        END LOOP;
        Cout <= carry(16);
    END PROCESS;
END arc;