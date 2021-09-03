LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY array_multiplier IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END array_multiplier;

ARCHITECTURE structural OF array_multiplier IS
    SIGNAL PR0, PR1, PR2, PR3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL FA0, FA1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL C0, C1, C2 : STD_LOGIC_VECTOR (3 DOWNTO 0);

    COMPONENT HA IS
        PORT (
            A, B : IN STD_LOGIC;
            S, C : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT FA IS
        PORT (
            A, B, Ci : IN STD_LOGIC;
            S, Co : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    PRODUCTS : FOR i IN 3 DOWNTO 0 GENERATE
        PR0(i) <= B(0) AND A(i);
        PR1(i) <= B(1) AND A(i);
        PR2(i) <= B(2) AND A(i);
        PR3(i) <= B(3) AND A(i);
    END GENERATE;

    HA1 : HA PORT MAP(PR0(1), PR1(0), FA0(0), C0(0));
    HA2 : HA PORT MAP(PR1(3), C0(2), FA0(3), C0(3));
    HA3 : HA PORT MAP(FA0(1), PR2(0), FA1(0), C1(0));
    HA4 : HA PORT MAP(FA1(1), PR3(0), S(3), C2(0));

    FAS_1 : FOR j IN 1 DOWNTO 0 GENERATE
        FA1_2 : FA PORT MAP(PR0(j + 2), PR1(j + 1), C0(j), FA0(j + 1), C0(j + 1));
    END GENERATE;

    FAS_2 : FOR K IN 1 DOWNTO 0 GENERATE
        FA3_4 : FA PORT MAP(FA0(K + 2), PR2(K + 1), C1(K), FA1(K + 1), C1(K + 1));
    END GENERATE;

    FA5 : FA PORT MAP(C0(3), PR2(3), C1(2), FA1(3), C1(3));

    FAS_3 : FOR M IN 1 DOWNTO 0 GENERATE
        FA6_7 : FA PORT MAP(FA1(M + 2), PR3(M + 1), C2(M), S(M + 4), C2(M + 1));
    END GENERATE;

    FA8 : FA PORT MAP(C1(3), PR3(3), C2(2), S(6), C2(3));

    S(7) <= C2(3);
    S(0) <= PR0(0);
    S(1) <= FA0(0);
    S(2) <= FA1(0);
END structural;