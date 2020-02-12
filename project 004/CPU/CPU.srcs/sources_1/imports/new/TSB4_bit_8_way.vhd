----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2018 11:36:36 PM
-- Design Name: 
-- Module Name: TSB4_bit_8_way - Behavioral
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

entity TSB4_bit_8_way is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B: in STD_LOGIC_VECTOR(3 downto 0);
           C: in STD_LOGIC_VECTOR(3 downto 0);
           D: in STD_LOGIC_VECTOR (3 downto 0);
           E: in STD_LOGIC_VECTOR(3 downto 0);
           F: in STD_LOGIC_VECTOR(3 downto 0);
           G: in STD_LOGIC_VECTOR (3 downto 0);
           H: in STD_LOGIC_VECTOR(3 downto 0);
           Control: in STD_LOGIC_VECTOR(2 downto 0);
           EN: in STD_LOGIC;
           Answer : out STD_LOGIC_VECTOR (3 downto 0);
           Isjump:out std_logic);
end TSB4_bit_8_way;

architecture Behavioral of TSB4_bit_8_way is
Signal AnsTemp:STD_LOGIC_VECTOR (3 downto 0);

begin
AnsTemp<= "ZZZZ" when EN='0' else
        A when Control="000" else
        B when Control="001" else
        C when Control="010" else
        D when Control="011" else
        E when Control="100" else
        F when Control="101" else
        G when Control="110" else
        H when Control="111" ;
Answer<=AnsTemp;
Isjump<='1' when AnsTemp="0000" else '0';

end Behavioral;
