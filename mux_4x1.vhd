LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux_4x1 IS
    PORT (
        D0, D1, D2, D3 : IN STD_LOGIC;
        A, B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END mux_4x1;

Architecture dataflow_arc of mux_4x1 is 
Signal sel : std_logic_vector(1 downto 0);
begin 
sel <= A & B;
with sel select
Y<= D0 when "00",
    D1 when "01",
    D2 when "10",
    D3 when others;
End dataflow_arc;