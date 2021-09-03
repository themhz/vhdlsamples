LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY mux_4x1_8bit IS
    PORT (
        D0, D1, D2, D3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        A, B : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END mux_4x1_8bit;

ARCHITECTURE dataflow_arc OF mux_4x1_8bit IS
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    sel <= A & B;
    WITH sel SELECT
    Y <= D0 WHEN "00",
    D1 WHEN "01",
    D2 WHEN "10",
    D3 WHEN OTHERS;
END dataflow_arc;