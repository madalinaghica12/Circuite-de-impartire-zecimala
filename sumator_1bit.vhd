----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 12:34:08 PM
-- Design Name: 
-- Module Name: sumator_1bit - Behavioral
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

entity sumator_1bit is
    Port( x: in std_logic;
          y: in std_logic;
          cin: in std_logic;
          s: out std_logic;
          cout: out std_logic
    );
end sumator_1bit;

architecture Behavioral of sumator_1bit is

begin
 s <= x xor y xor cin;
 cout <= (x and y) or (x and cin) or (y and cin);
 
end Behavioral;
