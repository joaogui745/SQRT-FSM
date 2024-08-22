library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
	--vazio
end testbench;

architecture testing of testbench is
	signal clock : std_logic := '0';
    signal start : std_logic := '0';
	signal n : integer := 9;
	signal isqrt : integer;
    signal done : std_logic;
	component SQRT is
		port (
		x : in integer;
		clk : in std_logic;
		start : in std_logic;
		result : out integer;
		done : out std_logic
		);
	end component SQRT;
begin
INTSQRT : SQRT port map (
		n, clock, start, isqrt, done
	);
    

process
begin
	clock <= clock xor '1';
	wait for 2 ns;
end process ;

process begin
	start <= '1';
    wait for 10 ns;
    start <= '0';
    wait until done = '1';
    n <= 16;
    start <= '1';
    wait for 10 ns;
    start <= '0';
    wait until done = '1';
    wait;
end process;


end testing ;