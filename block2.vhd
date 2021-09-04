Library IEEE;
use IEEE.std_logic_1164.all;

Entity Block2 is 
    port (Ak,bit_block,Bj,Cin:In std_logic; 
    Cout, FA_out:Out std_logic );
End Block2;

Architecture arc of Block2 is

    Component FA is 
        port (A, B, Ci: in std_logic;
        S,Co:out std_logic);
    end Component;

    Signal tmp :std_logic;
    Begin 
        tmp <= Ak and Bj;       
    FA1:FA port map(tmp, bit_block, Cin, FA_out, Cout);
END arc;
    