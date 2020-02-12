----------------------------------------------------------------------------------
-- Company: 
-- Engineer: NILAAN L
-- 
-- Create Date: 09/27/2018 03:21:06 PM
-- Design Name: HA
-- Module Name: HA - Behavioral
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

entity HA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC);
           
           
           
           
           
           
           
end HA;

architecture Behavioral of HA is

begin
    S<=A XOR B ;--((NOT A) AND B) OR (A AND (NOT B))
    C<=A AND B;
end Behavioral;
