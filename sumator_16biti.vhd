----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 03:32:32 PM
-- Design Name: 
-- Module Name: sumator_16biti - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumator_16biti is
Port ( x : in STD_LOGIC_VECTOR (19 downto 0);
       y : in STD_LOGIC_VECTOR (19 downto 0);
      cin : in STD_LOGIC;
      s : out STD_LOGIC_VECTOR (19 downto 0);
       cout : out STD_LOGIC);
end sumator_16biti;

architecture Behavioral of sumator_16biti is
signal carry: std_logic_vector(4 downto 0):="00000";
signal sum : std_logic_vector(19 downto 0):=x"00000";
begin
a1: entity WORK.sumator_zecimal port map(x=>x(3 downto 0),y=>y(3 downto 0),cin=>cin,s=>sum(3 downto 0),cout=>carry(0));
a2: entity WORK.sumator_zecimal port map(x=>x(7 downto 4),y=>y(7 downto 4),cin=>carry(0),s=>sum(7 downto 4),cout=>carry(1));
a3: entity WORK.sumator_zecimal port map(x=>x(11 downto 8),y=>y(11 downto 8),cin=>carry(1),s=>sum(11 downto 8),cout=>carry(2));
a4: entity WORK.sumator_zecimal port map(x=>x(15 downto 12),y=>y(15 downto 12),cin=>carry(2),s=>sum(15 downto 12),cout=>carry(3));
a5: entity WORK.sumator_zecimal port map(x=>x(19 downto 16),y=>y(19downto 16),cin=>carry(3),s=>sum(19 downto 16),cout=>carry(4));
s<=sum;
cout<=carry(4);
end Behavioral;