----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2018 10:06:53 PM
-- Design Name: 
-- Module Name: InsDecoder - Behavioral
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

entity InsDecoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Isjump:in std_logic;
           Regwrite:out std_logic_vector(2 downto 0);
           Operation:out std_logic;--determine functoin
           Reg1:out std_logic_vector(2 downto 0);   --input  for mul 1 to select 1st reg val
           Reg2:out std_logic_vector(2 downto 0);   --input  for mul 2 to select 2nd reg val
           Jumpflag:out std_logic;
           Jumpaddress:out std_logic_vector(2 downto 0);
           Immval:out std_logic_vector(3 downto 0);
           Loadsel:out std_logic
    );
    
end InsDecoder;

architecture Behavioral of InsDecoder is
signal Jump,Move,Add,Neg:std_logic_vector(1 downto 0);
begin
Add<="00";
Neg<="01";
Move<="10";
Jump<="11";

Regwrite<=Ins(9 downto 7);
Operation<='1' when Ins(11 downto 10)=Neg else '0';
Reg1<=Ins(9 downto 7);
Reg2<=Ins(6 downto 4);
Jumpaddress<=Ins(2 downto 0) when Isjump='1' else "ZZZ" ;
Immval<=Ins(3 downto 0);
Loadsel<='0' when (Ins(11 downto 10)=Move)else '1';
Jumpflag<='1' when (Ins(11 downto 10)=Jump) and Isjump='1' else '0';





end Behavioral;
