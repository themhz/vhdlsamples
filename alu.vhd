LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ALU IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        ALUS0, ALUS1, ALUS2, ALUS3, ALUS4, ALUS5, ALUS6 : IN STD_LOGIC; --Προσθήκη του ALUS6 σήματος ελέγχου του πέμπτου πολυπλέκτη
        Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END ALU;

ARCHITECTURE structural OF ALU IS

    COMPONENT mux_2x1_8bit IS
        PORT (
            D0, D1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            A : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT mux_4x1_8bit IS
        PORT (
            D0, D1, D2, D3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            A, B : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT adder8 IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            Ci : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL MUX1OUT, MUX2OUT, NOTB, ADDEROUT, MUX3OUT, MUX4OUT : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL ANDOP, OROP, ZERO : STD_LOGIC_VECTOR (7 DOWNTO 0);

    --Επιπλέον προσθήκη σημάτων για την επιλογή MUX5 και της του αποτελέσματος της XOR (Τα άφησα εδώ για να φαίνετε η αλλαγή αλλιώς θα τα έβαζα μαζί με τα άλλα SIGNAL)
    SIGNAL MUX5OUT, XOROP : STD_LOGIC_VECTOR (7 DOWNTO 0);
    

BEGIN
    ZERO <= "00000000";
    NOTB <= NOT B;
    MUX1 : mux_2x1_8bit PORT MAP(A, ZERO, ALUS0, MUX1OUT);
    MUX2 : mux_4x1_8bit PORT MAP(B, ZERO, ZERO, NOTB, ALUS1, ALUS2, MUX2OUT);
    ADDER : adder8 PORT MAP(MUX1OUT, MUX2OUT, ALUS3, ADDEROUT);
    ANDOP <= A AND B;
    OROP <= A OR B;
    MUX3 : mux_2x1_8bit PORT MAP(ANDOP, OROP, ALUS5, MUX3OUT);
    MUX4 : mux_2x1_8bit PORT MAP(ADDEROUT, MUX3OUT, ALUS4, MUX4OUT);

    --Προσθέτω έναν πολυπλέκτη στην έξοδο ώστε να επιλέξω την λειτουργία. Αν είναι 1 τότε θα εμφανίσει το αποτέλεσμα της XOR αλλιως θα εμφανίσει κάτι απο τα προηγούμενα
    XOROP <= A XOR B;
    MUX5 : mux_2x1_8bit PORT MAP(MUX4OUT, XOROP, ALUS6, MUX5OUT);

    --Σχολιάζω την έξοδο και προσθέτω την έξοδο του πέμπτου πολυπλέκτη
    --Y <= MUX4OUT;
    Y <= MUX5OUT;
END structural;