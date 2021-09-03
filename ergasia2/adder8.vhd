LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY adder8 IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Ci : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)        
    );
END adder8;

ARCHITECTURE structural OF adder8 IS

    COMPONENT FA IS
        PORT (
            A, B, Ci : IN STD_LOGIC;
            S, Co : OUT STD_LOGIC);
    END COMPONENT;
    
    Signal C : std_logic_vector(8 DOWNTO 0);    
    
BEGIN    
    C(0) <= Ci;      

    P1 : FOR i IN 0 TO 7 GENERATE
        FA1 : FA PORT MAP(A(i), B(i), C(i), S(i), C(i + 1));           
    END GENERATE;    

END structural;