LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY sipo4bit IS
    PORT (
        clock, reset : IN STD_LOGIC;
        INP : IN STD_LOGIC;
        OUTP : Buffer std_logic_vector(3 downto 0)
    );
END sipo4bit;

ARCHITECTURE behavioral OF sipo4bit IS
BEGIN
    PROCESS (clock, reset)        
    BEGIN
        IF reset = '0' THEN
            OUTP <= "0000";
            ELSIF clock'event and clock ='1' then 
            OUTP(2 downto 0) <= OUTP (3 downto 1);
            OUTP(3) <= INP;
        END IF;
    END PROCESS;
END behavioral;