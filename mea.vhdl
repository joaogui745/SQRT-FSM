library IEEE;
use IEEE.std_logic_1164.all;

entity SQRT is
    port(
        x : in integer;
        clk : in std_logic;
        start : in std_logic;
        result : out integer;
        done : out std_logic
    );
end entity SQRT;

architecture behavior of SQRT is
    type state_type is (n1, n2, n3, n4, idle);
    signal r, d, s : integer;
    signal t : std_logic; 
    signal state : state_type := idle;
begin
    MEA : process(clk)
    begin
        if rising_edge(clk) then
            case(state) is
                when n1 => r <= 1; d <= 2; s <= 4; t <= '1'; state <= n2;
                when n2 => if t = '1' then r <= r + 1; d <= d + 2; state <= n3;
                            else result <= r; done <= '1'; state <= idle; end if;
                when n3 => s <= s + d + 1; state <= n4;
                when n4 => if s <= x then t <= '1'; else t <= '0'; end if; state <= n2;
                
                when idle => if start = '1' then done <= '0'; state <= n1; end if;
            end case ;
        end if ;
    end process;
end behavior;
