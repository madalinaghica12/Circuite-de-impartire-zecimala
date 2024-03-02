----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2023 03:40:31 PM
-- Design Name: 
-- Module Name: registru_nBiti - Behavioral
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
entity registru_nBiti is
 GENERIC ( n : natural ) ;
 Port (
 data_in: in std_logic_vector(n-1 downto 0);
 enable: in std_logic;
 clk: in std_logic;
 rst: in std_logic;
 data_out: out std_logic_vector(n-1 downto 0)
 );
end registru_nBiti;

architecture Behavioral of registru_nBiti is
begin
registru: process(data_in,enable,rst,clk)
begin
 if rising_edge(clk) then
 if rst = '1' then
 data_out <= (others => '0');
 elsif enable = '1' then
 data_out <= data_in;
 end if;

 end if;
end process registru;
end Behavioral;
