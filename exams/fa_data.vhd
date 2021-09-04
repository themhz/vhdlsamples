library IEEE;
use IEEE.std_logic_1164.all;

entity fa_data is
    port (A,B,Cin: in std_logic;
    S,Cout: out std_logic);
end entity fa_data;

architecture dataflow of fa_data is
    
begin
    S<=(A xor B)xor Cin;
    Cout<=((A xor B)and Cin)or (A and B);
    
end architecture dataflow;