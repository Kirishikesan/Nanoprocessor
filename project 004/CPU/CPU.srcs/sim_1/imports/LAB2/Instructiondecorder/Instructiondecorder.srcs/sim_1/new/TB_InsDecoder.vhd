----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2018 11:08:01 PM
-- Design Name: 
-- Module Name: TB_InsDecoder - Behavioral
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

entity TB_InsDecoder is
--  Port ( );
end TB_InsDecoder;

architecture Behavioral of TB_InsDecoder is
component InsDecoder
 port(     Ins : in STD_LOGIC_VECTOR (11 downto 0);
            Isjump:in std_logic;
           Regwrite:out std_logic_vector(2 downto 0);
           Operation:out std_logic;--determine functoin
           Reg1:out std_logic_vector(2 downto 0);   --input  for mul 1 to select 1st reg val
           Reg2:out std_logic_vector(2 downto 0);   --input  for mul 2 to select 2nd reg val
           Jumpflag:out std_logic;
           Jumpaddress:out std_logic_vector(2 downto 0);
           Immval:out std_logic_vector(3 downto 0);
           Loadsel:out std_logic);
end component;
signal Ins:std_logic_vector(11 downto 0);
signal Regwrite,Reg1,Reg2,Jumpaddress :std_logic_vector(2 downto 0);
signal Operation:std_logic;
signal Isjump,Jumpflag,Loadsel :std_logic;
signal Immval:std_logic_vector(3 downto 0);
begin
uut:InsDecoder
 port map(
Ins(11 downto 0)=>Ins(11 downto 0),
Isjump=>Isjump,
Regwrite(2 downto 0)=>Regwrite(2 downto 0),
Operation=>Operation,
Reg1(2 downto 0)=>Reg1(2 downto 0),
Reg2(2 downto 0)=>Reg2(2 downto 0),
Jumpflag=>Jumpflag,
Jumpaddress(2 downto 0)=>Jumpaddress(2 downto 0),
Immval(3 downto 0)=>Immval(3 downto 0),
Loadsel=>Loadsel);

process
begin
Isjump<='0';

Ins<="100010000011";
wait for 100ns;
Ins<="100100000001";
wait for 100ns;
Ins<="010100000000";
wait for 100ns;
Ins<="001110010000";
wait for 100ns;
Ins<="000010100000";
wait for 100ns;
Ins<="110010000111";
wait for 100ns;
Ins<="110000000011";
wait for 100ns;
Isjump<='1';
Ins<="110010000111";
wait for 100ns;
Ins<="110000000011";
wait for 100ns;

end process;

end Behavioral;
