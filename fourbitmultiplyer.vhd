Library IEEE;
use IEEE.std_logic_1164.all;


-- Entity 4bitmultiplyer is 
--     port (A3,A2,A1,A0, B3, B2, B1, B0:In std_logic; 
--     P7, P6, P5, P4, P3, P2, P1, P0 :Out std_logic );
-- End 4bitmultiplyer;

Entity fourbitmultiplyer is 
    port (A,B :IN std_logic_vector(3 downto 0); 
    P :Out std_logic_vector(7 downto 0) );
End fourbitmultiplyer;

architecture arxitektoniki of fourbitmultiplyer is
    Component Block1 is 
        port (Ak,Ak1,B0,B1, Cin:In std_logic; 
              Cout,FA_out:Out std_logic );
    end Component;

    Component Block2 is 
        port (Ak,bit_block,Bj,Cin:In std_logic; 
              Cout, FA_out:Out std_logic );
    end Component;
	 
	 SIGNAL zero: std_logic;
    SIGNAL C,CC,CCC: std_logic_vector(0 to 2);
    SIGNAL PP1,PP2: std_logic_vector(0 to 3);

begin
    
	 zero <= '0';
    P(0) <= A(0) and B(0);
	 
    Block10:Block1 port map(A(0), A(1), B(0), B(1), zero, C(0), P(1));
    Block11:Block1 port map(A(1), A(2), B(0), B(1), C(0), C(1), PP1(0));
    Block12:Block1 port map(A(2), A(3), B(0), B(1), C(1), C(2), PP1(1));
    Block13:Block1 port map(A(3), zero, B(0), B(1), C(2), PP1(3), PP1(2));

    Block20:Block2 port map(A(0), PP1(0), B(2), zero, CC(0), P(2));
    Block21:Block2 port map(A(1), PP1(1), B(2), CC(0), CC(1), PP2(0));
    Block22:Block2 port map(A(2), PP1(2), B(2), CC(1), CC(2), PP2(1));
    Block23:Block2 port map(A(3), PP1(3), B(2), CC(2), PP2(3), PP2(2));

    Block30:Block2 port map(A(0), PP2(0), B(3), zero, CCC(0), P(3));
    Block31:Block2 port map(A(1), PP2(1), B(3), CCC(0), CCC(1), P(4));
    Block32:Block2 port map(A(2), PP2(2), B(3), CCC(1), CCC(2), P(5));
    Block33:Block2 port map(A(3), PP2(3), B(3), CCC(2), P(7), P(6));
    
    
end architecture arxitektoniki;