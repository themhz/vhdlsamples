Library IEEE; --δήλωση βιβλιοθήκης
Use IEEE.std_logic_1164.all;

Entity FA_1bit is --δήλωση οντότητας
port (A,B,Ci: In std_logic;
S,Co: Out std_logic);
End FA_1bit;

Architecture FA_1bit_dataflow of FA_1bit is --δήλωση αρχιτεκτονικής
Signal x1,x2,x3: std_logic; --εσωτερικά σήματα
begin
	x1<=A xor B;
	x2<=x1 and Ci;
	x3<=A and B;
	S<=x1 xor Ci; --άθροισμα
	Co<=x2 or x3; --κρατούμενο
End FA_1bit_dataflow;