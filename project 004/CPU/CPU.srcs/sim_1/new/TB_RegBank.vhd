----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2018 07:53:11 PM
-- Design Name: 
-- Module Name: TB_RegBank - Behavioral
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

entity TB_RegBank is
--  Port ( );
end TB_RegBank;

architecture Behavioral of TB_RegBank is
component RegBank
Port (     Clk : in STD_LOGIC;
           Clear : in STD_LOGIC;
           RegSel : in STD_LOGIC_VECTOR (7 downto 0);
           WriteVal : in STD_LOGIC_VECTOR (3 downto 0);
           
           Reg0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;         
signal Clk,Clear:std_logic;
signal RegSel:STD_LOGIC_VECTOR (7 downto 0);          
signal WriteVal,Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7:STD_LOGIC_VECTOR (3 downto 0);      
   
begin
uut:RegBank
port map(
        Clk=>Clk,
        Clear=>Clear,
        RegSel=>RegSel(7 downto 0),
        WriteVal=>WriteVal(3 downto 0),
        Reg0=>Reg0(3 downto 0),
        Reg1=>Reg1(3 downto 0),
        Reg2=>Reg2(3 downto 0),
        Reg3=>Reg3(3 downto 0),
        Reg4=>Reg4(3 downto 0),
        Reg5=>Reg5(3 downto 0),
        Reg6=>Reg6(3 downto 0),
        Reg7=>Reg7(3 downto 0));
process
begin
Clear<='1';
wait for 100ns;
Clear<='0';
wait for 100ns;
RegSel<="00000010"; 
WriteVal<="0001";
WAIT FOR 100NS;
RegSel<="00000100";
WriteVal<="0010";
WAIT FOR 100NS;
RegSel<="00001000";
WriteVal<="0011";
WAIT FOR 100NS;
RegSel<="00010000";
WriteVal<="0100";
WAIT FOR 100NS;
RegSel<="00100000";
WriteVal<="0101";
WAIT FOR 100NS;
RegSel<="01000000";
WriteVal<="0110";
WAIT FOR 100NS;
RegSel<="10000000";
WriteVal<="0111";
WAIT FOR 100NS;

end process; 

process
begin
Clk<='0';
wait for 10ns;
Clk<='1';
wait for 10ns;
end process;

end Behavioral;
