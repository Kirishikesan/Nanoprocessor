----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 03:04:44 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
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

entity AU_7_seg is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S7seg : out STD_LOGIC_vector(6 downto 0);
           an:out std_logic_vector(3 downto 0)
           );
end AU_7_seg; 

architecture Behavioral of AU_7_seg is
--component AU
--port(A : in STD_LOGIC_VECTOR (3 downto 0);
--    S_7seg : out STD_LOGIC_VECTOR (6 downto 0));
--end component;
component LUT_16_7
port( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
begin
    LUT_16_70:LUT_16_7
    port map(address=>A(2 downto 0),
             data=>S7seg(6 downto 0));
        AN(0) <= '0';
        AN(1) <= '1';
        AN(2) <= '1';
        AN(3) <= '1';
end Behavioral;
