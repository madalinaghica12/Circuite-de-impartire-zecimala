----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 02:20:16 PM
-- Design Name: 
-- Module Name: sumator_zecimal - Behavioral
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

entity sumator_zecimal is
 Port ( x: in std_logic_vector(3 downto 0);
        y: in  std_logic_vector(3 downto 0);
        cin: in std_logic;
        s: out  std_logic_vector(3 downto 0);
        cout: out std_logic);
end sumator_zecimal;

architecture Behavioral of sumator_zecimal is
signal sum,sum1 : std_logic_vector(3 downto 0) := "0000";
signal c,cc,ccc: std_logic:='0';
begin
a1: entity WORK.sumator_4biti port map(x,y,cin,sum,c);
ccc <= c or (sum(3) and sum(2)) or (sum(3) and sum(1));
sum1 <= '0'& ccc & ccc & '0';
a2: entity WORK.sumator_4biti port map(sum1,sum,'0',s,cc);
cout<=ccc;
end Behavioral;
