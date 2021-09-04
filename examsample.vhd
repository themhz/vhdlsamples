LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY examsample IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Ci : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        Co : IN STD_LOGIC;
        OrOut : IN STD_LOGIC;
    );
END examsample;

ARCHITECTURE structural OF examsample IS

    COMPONENT adder4 IS
        PORT (
            Ac, Bc : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Cic : IN STD_LOGIC;
            Sc : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            Coc : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signal S : std_logic_vector(3 DOWNTO 0);
    SIGNAL zero : STD_LOGIC;
    SIGNAL and1 : STD_LOGIC;
    SIGNAL and2 : STD_LOGIC;
    SIGNAL or2 : STD_LOGIC;

BEGIN
    GEN:for i in 0 to 3 GENERATE;
    
    ADD1 : adder4 PORT MAP(A(i), B(i), Ci, S(i), Co); --αντιστοίχιση εισόδων και εξόδων
    zero <= '0';
    and1 <= S(3) AND S(2);
    and2 <= S(3) AND S(1);
    or2 <= and1 OR and2 OR Co;
    ADD2 : adder4 PORT MAP(S(3), S(2), S(1), S(0), zero, or2, or2, zero, Ci, S(3), S(2), S(1), S(0), OrOut); --αντιστοίχιση εισόδων και εξόδων

END structural;