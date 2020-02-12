----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:20:56 PM
-- Design Name: 
-- Module Name: TriStateBuffer - Behavioral
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

entity TSB4_bit_2_way is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B: in STD_LOGIC_VECTOR(3 downto 0);
           Control: in STD_LOGIC;
           EN: in STD_LOGIC;
           F : out STD_LOGIC_VECTOR (3 downto 0));
end TSB4_bit_2_way;

architecture Behavioral of TSB4_bit_2_way is
--Signal B:std_logic_vector(3 downto 0);
begin
    F<="ZZZZ" when EN='0' else
        A when Control='0' else
        B when Control='1';    

end Behavioral;
