----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2018 03:06:10 PM
-- Design Name: 
-- Module Name: TB_CPU - Behavioral
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

entity TB_CPU is
--  Port ( );
end TB_CPU;

architecture Behavioral of TB_CPU is
component CPU
port(Clk:in std_logic;
    Reset:in std_logic;
    led : out STD_LOGIC_VECTOR (3 downto 0);
    S7seg:out std_logic_vector(6 downto 0);
    an: out STD_LOGIC_VECTOR (3 downto 0);
    CFlag:out std_logic);
end component;
signal CFlag,Clk,Reset:std_logic;
signal an,led:STD_LOGIC_VECTOR (3 downto 0);
signal S7seg:STD_LOGIC_VECTOR (6 downto 0);
begin
UUT:CPU
port map(Clk=>Clk,
         Reset=>Reset,
         led=>led(3 downto 0),
         S7seg=>S7seg,
         an=>an,
         CFlag=>CFlag);
process 
begin
Reset<='1';

wait for 100ns;
Reset<='0';
wait for 100ns;

end process;
process
begin
Clk<='0';
wait for 1ns;
Clk<='1';
wait for 1ns;
end process;
end Behavioral;
