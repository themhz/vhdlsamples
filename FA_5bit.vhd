Library IEEE; --δήλωση βιβλιοθήκης
Use IEEE.std_logic_1164.all; 

Entity FA_5bit is
port(A,B: In std_logic_vector(4 downto 0); --δήλωση των σημάτων εισόδου μεγέθους 4 bits
Ci: In std_logic; --δήλωση της εισόδου του κρατουμένου
S: Out std_logic_vector(4 downto 0);--άθροισμα
C: Out std_logic --κρατούμενο
);
End FA_5bit;

Architecture FA_5bit_structural of FA_5bit is --δήλωση αρχιτεκτονικής

Component FA_1bit is --δήλωση του πλήρη αθροιστή 1 bit ως δομικό στοιχείο
port(A,B,Ci: In std_logic; --είσοδοι: προσθετέοι Α,Β και κρατούμενο Ci
S,Co: Out std_logic); --έξοδοι: άθροισμα S και κρατούμενο C
End Component;

Signal kratoumeno: std_logic_vector(5 downto 0); --δήλωση των κρατούμενων C4,C3,C2,C1,C0,Ci
begin
kratoumeno(0)<=Ci; --το component FA0 έχει είσοδο κρατουμένου C(0) την εξωτερική είσοδο του αρχικού κρατουμένου Ci
P1: for i in 0 to 4 generate
FA5: FA_1bit port map(A(i),B(i),kratoumeno(i),S(i),kratoumeno(i+1)); --αντιστοίχιση εισόδων και εξόδων
End generate; 
C<=kratoumeno(5);

End FA_5bit_structural;