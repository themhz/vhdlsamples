library IEEE;
use IEEE.std_logic_1164.all;

entity two_adder is
    port (A,B:in std_logic_vector(3 downto 0);
         Cin:in std_logic;
         S:out std_logic_vector(3 downto 0);
         Cout:out std_logic);
end two_adder;

architecture arc of two_adder is
    
    component adder_4 is
        PORT ( A, B : IN std_logic_vector(3 DOWNTO 0);
        Cin : IN std_logic ;
        S : OUT std_logic_vector(3 DOWNTO 0);
        Cout : OUT std_logic);
    end component;
--signal C: std_logic_vector(3 downto 0);
--signal s3,s2,s1,s0: std_logic;
signal S_out : std_logic_vector(3 downto 0);
signal S2_out : std_logic_vector(3 downto 0);
signal C_out: std_logic;
signal and1_out: std_logic;
signal and2_out:std_logic;
signal or_out:std_logic;
signal zero: std_logic;

begin
    
    
    adder1 : adder_4 port map (A,B, Cin, S_out, C_out);

	 zero<= '0';
    and1_out<=S_out(3) AND S_out(2);
    and2_out<=S_out(3) AND S_out(1);
    or_out<= C_out or and1_out or and2_out;

    S2_out(0)<= zero;
    S2_out(1)<= or_out;
    S2_out(2)<= or_out;
    S2_out(3)<= zero;
    adder2 : adder_4 port map (S_out, S2_out, zero, S, Cout);
	 
    -- adder2_1 : adder_4 port map (s0,zero,Cin,S(0));
    -- adder2_2 : adder_4 port map (s1,or_out,Cin,S(1));
    -- adder2_3 : adder_4 port map (s2,or_out,Cin,S(2));
    -- adder2_4 : adder_4 port map (s3,zero,Cin,S(3));
    
end arc;