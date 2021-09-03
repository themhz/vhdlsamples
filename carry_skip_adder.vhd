LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY carry_skip_adder IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END carry_skip_adder;

ARCHITECTURE structural OF carry_skip_adder IS
    SIGNAL P, G : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL BP : STD_LOGIC;
    SIGNAL C : STD_LOGIC_VECTOR(8 DOWNTO 0);

    COMPONENT FA IS
        PORT (
            A, B, Ci : IN STD_LOGIC;
            S, Co : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT mux2x1 IS
        PORT (
            D0, D1 : IN STD_LOGIC;
            A : IN STD_LOGIC;
            Y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    P1 : FOR i IN 7 DOWNTO 0 GENERATE
        P(i) <= A(i) XOR B(i);
        P(i) <= A(i) AND B(i);
    END GENERATE;
    C(8) <= Cin;
    FAs : FOR j IN 7 DOWNTO 0 GENERATE
        FAs_8 : FA PORT MAP(A => A(j), B => B(j), Ci => C(j + 1), S => S(j), Co => C(j));
    END GENERATE;

    BP <= P(0) AND P(1) AND P(2) AND P(3) AND P(4) AND P(5) AND P(6) AND P(7);
    MUX : MUX2x1 PORT MAP(D0 => C(0), D1 => C(8), A => BP, Y => Cout);
END structural;