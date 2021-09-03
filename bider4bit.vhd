LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY bider4bit IS
    PORT (
        INR, INL : IN STD_LOGIC;
        clock, reset, K : IN STD_LOGIC;
        OUTR, OUTL : OUT STD_LOGIC
    );
END bider4bit;

ARCHITECTURE structural OF bider4bit IS

    COMPONENT diff_asyn_pos IS
        PORT (
            D : IN STD_LOGIC;
            clock, reset : IN STD_LOGIC;
            Q : OUT STD_LOGIC := '0'
        );
    END COMPONENT;

    COMPONENT mux2x1_behavioral IS
        PORT (
            D0, D1 : IN STD_LOGIC;
            A : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL d0, d1, d2, d3, q0, q1, q2, q3 : STD_LOGIC;
BEGIN
    DFF0 : diff_asyn_pos PORT MAP(D => d0, clock => clock, reset => reset, Q => q0);
    DFF1 : diff_asyn_pos PORT MAP(D => d1, clock => clock, reset => reset, Q => q1);
    DFF2 : diff_asyn_pos PORT MAP(D => d2, clock => clock, reset => reset, Q => q2);
    DFF3 : diff_asyn_pos PORT MAP(D => d3, clock => clock, reset => reset, Q => q3);
    MUX0 : mux2x1_behavioral PORT MAP(D0 => q1, D1 => INR, A => K, Y => d0);
    MUX1 : mux2x1_behavioral PORT MAP(D0 => q2, D1 => q0, A => K, Y => d1);
    MUX2 : mux2x1_behavioral PORT MAP(D0 => q3, D1 => q1, A => K, Y => d2);
    MUX3 : mux2x1_behavioral PORT MAP(D0 => INL, D1 => q2, A => K, Y => d3);
    OUTL <= q0;
    OUTR <= q3;
END structural;