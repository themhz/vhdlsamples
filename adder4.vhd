LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY adder4 IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Ci : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Co : OUT STD_LOGIC
    );
END adder4;

ARCHITECTURE structural OF adder4 IS

    COMPONENT FA IS
        PORT (
            A, B, Ci : IN STD_LOGIC;
            S, Co : OUT STD_LOGIC);
    END COMPONENT;
    
    Signal C : std_logic_vector(4 DOWNTO 0);    
    
BEGIN    
    C(0) <= Ci;
    

    P1 : FOR i IN 0 TO 3 GENERATE
        FA1 : FA PORT MAP(A(i), B(i), C(i), S(i), C(i + 1));           
    END GENERATE;
    Co <= C(4);            

END structural;