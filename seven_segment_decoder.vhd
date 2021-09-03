LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY seven_segment_decoder IS
    PORT (
        c : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Outp : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END seven_segment_decoder;

ARCHITECTURE behavioral OF seven_segment_decoder IS
BEGIN

    WITH c SELECT
    Outp <= "1111110" WHEN "0000",
    "0000110" WHEN "0001",
    "1101101" WHEN "0010",
    "1111001" WHEN "0011",
    "0110011" WHEN "0100",
    "1011011" WHEN "0101",
    "1011111" WHEN "0110",
    "1110000" WHEN "0111",
    "1111111" WHEN "1000",
    "1111011" WHEN "1001",
    "0001101" WHEN "1010",
    "0011001" WHEN "1011",
    "0100011" WHEN "1100",
    "1001011" WHEN "1101",
    "0001111" WHEN "1110",
    "0000000" WHEN "1111",
    "0000000" WHEN OTHERS;
END behavioral;