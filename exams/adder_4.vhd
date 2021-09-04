library IEEE;
use IEEE.std_logic_1164.all;

ENTITY adder_4 IS
PORT ( A, B : IN std_logic_vector(3 DOWNTO 0) ;
Cin : IN std_logic ;
S : OUT std_logic_vector(3 DOWNTO 0);
Cout: OUT std_logic);

END adder_4;

ARCHITECTURE struct OF adder_4 IS

    COMPONENT fa_data IS
    PORT (A,B,Cin: in std_logic;
    S,Cout: out std_logic);
    END COMPONENT;
	 
    Signal C: std_logic_vector(4 downto 0);

BEGIN
    C(0)<= Cin;
        p1: FOR i IN 0 to 3 GENERATE
        FA4: fa_data port map (A(i),B(i),C(i),S(i),C(i+1));
        END GENERATE ;
END struct ;