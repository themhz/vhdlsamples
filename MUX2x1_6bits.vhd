Library IEEE; --δήλωση βιβλιοθήκης
Use IEEE.std_logic_1164.all;

Entity MUX2x1_6bits is
port (D0,D1: In std_logic_vector(5 downto 0); --είσοδοι
A:In std_logic; --είσοδος επιλογής
Y:Out std_logic_vector(5 downto 0)); --έξοδος
End MUX2x1_6bits;

Architecture dataflow_arc of MUX2x1_6bits is --δήλωση αρχιτεκτονικής
begin
with A select
Y<=D0 when '0',
	D1 when others; --δλδ όταν Α=1
End dataflow_arc;