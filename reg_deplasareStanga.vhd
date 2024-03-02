library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity reg_deplasareStanga is
GENERIC ( n : natural ) ;
 Port (
 data_in: in std_logic_vector(n-1 downto 0);
 shift: in std_logic_vector(3 downto 0);
 load: in std_logic;
 enable: in std_logic;
 clk: in std_logic;
 rst: in std_logic;
 data_out: out std_logic_vector(n-1 downto 0)
 );
end reg_deplasareStanga;
architecture Behavioral of reg_deplasareStanga is
signal iesire: std_logic_vector(n-1 downto 0):=(others => '0');
begin
registru: process(data_in,shift,load,enable,rst,clk)
begin
 if rising_edge(clk) then
 if rst = '1' then
 iesire <= (others => '0');
 elsif load = '1' then
 iesire <= data_in;
 elsif enable = '1' then
 iesire <= iesire(n-5 downto 0) & shift;
 end if;

 end if;
end process registru;
data_out<= iesire;
end Behavioral;