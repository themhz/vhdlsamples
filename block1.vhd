Library IEEE;
use IEEE.std_logic_1164.all;

Entity Block1 is 
    port (Ak,Ak1,B0,B1, Cin:In std_logic; 
    Cout, FA_out:Out std_logic );
End Block1;

Architecture arc of Block1 is

    Component FA is 
        port (A, B, Ci: in std_logic;
        S,Co:out std_logic);
    end Component;

    Signal tmp1, tmp2:std_logic;
    Begin 
        tmp1 <= Ak1 and B0;
        tmp2 <= Ak and B1;
    FA1:FA port map(tmp1, tmp2, Cin, FA_out, Cout);
END arc;
    