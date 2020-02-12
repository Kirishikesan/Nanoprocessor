----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2018 12:03:42 PM
-- Design Name: 
-- Module Name: TB_LUT_8_12 - Behavioral
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

entity TB_LUT_8_12 is
--  Port ( );
end TB_LUT_8_12;

architecture Behavioral of TB_LUT_8_12 is

component LUT_8_12
port( address : in STD_LOGIC_VECTOR (2 downto 0);
          data : out STD_LOGIC_VECTOR (11 downto 0));
end component;
signal address :std_logic_vector(2 downto 0);
signal data :std_logic_vector(11 downto 0);
begin

uut:LUT_8_12
port map(address=>address(2 downto 0),
         data=>data(11 downto 0));

process
begin
address<="000";
wait for 100 ns; 
address<="001";
wait for 100 ns; 
address<="010";
wait for 100 ns; 
address<="011";
wait for 100 ns; 
address<="100";
wait for 100 ns; 
address<="101";
wait for 100 ns; 
address<="110";
wait for 100 ns; 
address<="111";
wait for 100 ns; 
end process;

end Behavioral;

