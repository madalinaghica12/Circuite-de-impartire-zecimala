----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 01:35:00 PM
-- Design Name: 
-- Module Name: sumator_4biti - Behavioral
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
--use UNISIM.VComponents.all

entity sumator_4biti is
  Port ( x: in std_logic_vector(3 downto 0);
         y: in  std_logic_vector(3 downto 0);
         cin: in std_logic;
         s: out  std_logic_vector(3 downto 0);
         cout: out std_logic);
end sumator_4biti;

architecture Behavioral of sumator_4biti is
begin
 process(x, y, cin)
       variable sum : std_logic_vector(3 downto 0);
       variable carry : std_logic;
   begin
       -- Adunare pe fiecare bit
       sum(0) := x(0) xor y(0) xor cin;
       carry := (x(0) and y(0)) or (x(0) and cin) or (y(0) and cin);
       
       sum(1) := x(1) xor y(1) xor carry;
       carry := (x(1) and y(1)) or (x(1) and carry) or (y(1) and carry);
       
       sum(2) := x(2) xor y(2) xor carry;
       carry := (x(2) and y(2)) or (x(2) and carry) or (y(2) and carry);
       
       sum(3) := x(3) xor y(3) xor carry;
       carry := (x(3) and y(3)) or (x(3) and carry) or (y(3) and carry);
       
       s <= sum;
       cout <= carry;
   end process;
end Behavioral;
