library IEEE;
Use IEEE.std_logic_1164.ALL;
Use IEEE.numeric_std.ALL;

ENTITY variable_or_signal IS
    PORT (
        clock : IN STD_LOGIC;
        v_out_done, s_out_done : OUT STD_LOGIC;
        variable_out, signal_out : OUT NATURAL RANGE 0 TO 6);
END variable_or_signal;

ARCHITECTURE behavioral OF variable_or_signal IS
    SIGNAL tmp_variable : STD_LOGIC := '0';
    SIGNAL s_count : NATURAL RANGE 0 TO 6 := 0;
    SIGNAL tmp_signal : STD_LOGIC := '0';
BEGIN

    PROCESS (clock)
        VARIABLE v_count : NATURAL RANGE 0 TO 5 := 0;
        VARIABLE v_count2 : NATURAL RANGE 0 TO 5 := 0;
        VARIABLE v_count3 : NATURAL RANGE 0 TO 5 := 0;
    BEGIN
        IF rising_edge(clock) THEN
            v_count := v_count + 1;
            v_count2 := v_count2 + 1;

            s_count <= s_count + 1;
            IF v_count = 5 THEN
                v_count := 0;
                v_count2 := 0;
                tmp_variable <= '1';
            ELSE
                tmp_variable <= '0';
            END IF;

            IF s_count = 5 THEN
                s_count <= 0;
                tmp_signal <= '1';
            ELSE
                tmp_signal <= '0';
            END IF;
        END IF;
        variable_out <= v_count;
    END PROCESS;
    signal_out <= s_count;
    v_out_done <= tmp_variable;
    s_out_done <= tmp_signal;
END behavioral;