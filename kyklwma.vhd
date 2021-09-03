Library IEEE; --δήλωση βιβλιοθήκης
Use IEEE.std_logic_1164.all;

Entity kyklwma is --δήλωση οντότητας
port(A,B: std_logic_vector(4 downto 0);
Cin: In std_logic;
S: Out std_logic_vector(5 downto 0));
End kyklwma;

Architecture kyklwma_dataflow of kyklwma is --δήλωση αρχιτεκτονικής


Component FA_5bit is --δήλωση αθροιστή 5 bit ως δομικού στοιχείου του κυκλώματος
port(A,B: In std_logic_vector(4 downto 0); --δήλωση των σημάτων εισόδου μεγέθους 5 bits
Ci: In std_logic; --δήλωση της εισόδου του κρατουμένου
S: Out std_logic_vector(4 downto 0);--άθροισμα
C: Out std_logic --κρατούμενο
);
End Component;

Component  MUX2x1_6bits is  --ο πολυπλέκτης ως δομικό στοιχείο
port (D0,D1: In std_logic_vector(5 downto 0); --είσοδοι
A:In std_logic; --είσοδος επιλογής
Y:Out std_logic_vector(5 downto 0)); --έξοδος
End Component;

signal one: std_logic;
signal zero: std_logic;
signal FA1_S_Out: std_logic_vector(4 downto 0);
Signal FA1_C_out:std_logic;
signal FA2_S_Out: std_logic_vector(4 downto 0);
Signal FA2_C_out:std_logic;
Signal MUX_IN_1:std_logic_vector(5 downto 0);
Signal MUX_IN_2:std_logic_vector(5 downto 0);

begin
one<='0';
zero<='1';
L1: FA_5bit port map(A,B,one,FA1_S_Out,FA1_C_out);
L2: FA_5bit port map(A,B,zero,FA2_S_Out,FA2_C_out);
MUX_IN_1<=FA1_C_out & FA1_S_Out;
MUX_IN_2<=FA2_C_out & FA2_S_Out;
L3: MUX2x1_6bits port map(MUX_IN_1,MUX_IN_2,Cin,S);

End kyklwma_dataflow;