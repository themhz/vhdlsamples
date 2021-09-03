LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux_2x1_8bit IS
    PORT (
        D0, D1: IN std_logic_vector(7 downto 0);
        A : IN STD_LOGIC;
        Y : OUT std_logic_vector(7 downto 0)
    );
END mux_2x1_8bit;

Architecture dataflow_arc of mux_2x1_8bit is 
begin 
with A select
Y<= D0 when '0',
    D1 when others;
End dataflow_arc;