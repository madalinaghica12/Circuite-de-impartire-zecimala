library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity impartirea_cu_refacere is
generic(n : natural:= 20);
 Port (
 clk: in std_logic;
 rst : in STD_LOGIC;
 start : in STD_LOGIC;
 x : in STD_LOGIC_VECTOR(n-1 downto 0);
 y : in STD_LOGIC_VECTOR(n-1 downto 0);
 a : out STD_LOGIC_VECTOR(n-1 downto 0);
 q : out STD_LOGIC_VECTOR(n-1 downto 0);
 Term : out STD_LOGIC);
end impartirea_cu_refacere;

architecture Behavioral of impartirea_cu_refacere is
signal loada,loadb,loadq,shla,shlq,subb,ovf,selmuxin: std_logic :='0';
signal an,outsuman: std_logic:='1';
signal outb,insum,outsum,outq: std_logic_vector(n-1 downto 0);
signal outa,ina: std_logic_vector(n downto 0);
signal nn: std_logic_vector(3 downto 0):=(others =>'0');
begin
unitateDeControl: entity work.UC_impartire_cu_refacere port map (
 start=>start,clk=>clk,rst=>rst,
 an=>an,selmuxin=>selmuxin,loada=>loada,loadb=>loadb,
 loadq=>loadq,shla=>shla,shlq=>shlq,subb=>subb,
 term=>term,nn=>nn);
registrulb: entity work.registru_nBiti generic map(n => n) port map(
 data_in=>y,
 enable=>loadb,
 clk=>clk,
 rst=>rst,
 data_out=>outb);
insum <= x"99999" - outB when subb = '1' else outB;
suma: entity WORK.sumator_16biti
 port map(
 x=>outa(n-1 downto 0),
 y=>insum,
 cin=>subb,
 s=>outsum,
 cout=>outsuman);

an<=outsum(n-1) or outsum(n-2) or outsum(n-3) or outsum(n-4) ;
ina <= '0' & x"00000" when selmuxin = '1' else an & outsum;
registrula: entity WORK.reg_deplasareStanga
 generic map(n => n+1) port map(
 data_in => ina,
 shift=> outq(n-1 downto n-4),
 load=>loada,
 enable=>shla,
 clk=>clk,
 rst=>rst,
 data_out=>outa);

registrulq: entity WORK.reg_deplasareStanga
 generic map(n => n) port map(
 data_in => x,
 shift=> nn,
 load=>loadq,
 enable=>shlq,
 clk=>clk,
 rst=>rst,
 data_out=>outq);
q<=outq;
a<= outa(n-1 downto 0);
end Behavioral;