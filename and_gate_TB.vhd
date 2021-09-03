LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY and_gate_TB IS
END and_gate_TB;

ARCHITECTURE TB OF and_gate_TB IS

    COMPONENT and_gate IS
        PORT (
            A, B : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL x, y, z : STD_LOGIC;
BEGIN
    TB : and_gate PORT MAP(x, y, z);
    x <= '0', '1' AFTER 20 ns, '0' AFTER 40 ns, '1' AFTER 60 ns;
    y <= '0', '1' AFTER 40 ns;
END TB;