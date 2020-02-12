----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2018 11:03:47 PM
-- Design Name: 
-- Module Name: TSB3_bit_2_way - Behavioral
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


entity TSB3_bit_2_way is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B: in STD_LOGIC_VECTOR(2 downto 0);
           Control: in STD_LOGIC;
           EN: in STD_LOGIC;
           F : out STD_LOGIC_VECTOR (2 downto 0));
end TSB3_bit_2_way;

architecture Behavioral of TSB3_bit_2_way is
--Signal B:std_logic_vector(3 downto 0);
begin
    F<="ZZZ" when EN='0' else
        A when Control='1' else
        B when Control='0'    ;

end Behavioral;

