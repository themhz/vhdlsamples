LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ALU4BIT IS
    PORT (        
        A, B : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --Αλλάζω σε 4 bit την είσοδο
        ALUS0, ALUS1, ALUS2, ALUS3, ALUS4, ALUS5, ALUS6 : IN STD_LOGIC; --Προσθήκη του ALUS6 σήματος ελέγχου του πέμπτου πολυπλέκτη
        Y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) --Αλλάζω σε 4 bit την έξοδο
    );
END ALU4BIT;

ARCHITECTURE structural OF ALU4BIT IS

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
    SIGNAL AS, BS : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
    ZERO <= "00000000";

    NOTB <= "0000" & NOT B; --Προσθέτω τα 4 μηδενικά και κάνω NOT
    AS <= "0000" & A; --Προσθέτω τα 4 μηδενικά 
    BS <= "0000" & B; --Προσθέτω τα 4 μηδενικά 

    MUX1 : mux_2x1_8bit PORT MAP(AS, ZERO, ALUS0, MUX1OUT);
    MUX2 : mux_4x1_8bit PORT MAP(BS, ZERO, ZERO, NOTB, ALUS1, ALUS2, MUX2OUT);
    ADDER : adder8 PORT MAP(MUX1OUT, MUX2OUT, ALUS3, ADDEROUT);
    ANDOP <= AS AND BS;
    OROP <= AS OR BS;
    MUX3 : mux_2x1_8bit PORT MAP(ANDOP, OROP, ALUS5, MUX3OUT);
    MUX4 : mux_2x1_8bit PORT MAP(ADDEROUT, MUX3OUT, ALUS4, MUX4OUT);

    --Προσθέτω έναν πολυπλέκτη στην έξοδο ώστε να επιλέξω την λειτουργία. Αν είναι 1 τότε θα εμφανίσει το αποτέλεσμα της XOR αλλιως θα εμφανίσει κάτι απο τα προηγούμενα
    XOROP <= AS XOR BS;
    MUX5 : mux_2x1_8bit PORT MAP(MUX4OUT, XOROP, ALUS6, MUX5OUT);

    --Αλλάζω την έξοδο και επιστρέφω μόνο την αρχική τετράχα της MUX5OUT
    Y <= MUX5OUT(3) & MUX5OUT(2) & MUX5OUT(1) & MUX5OUT(0); 
END structural;