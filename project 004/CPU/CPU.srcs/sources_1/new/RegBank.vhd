----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2018 07:42:37 PM
-- Design Name: 
-- Module Name: RegBank - Behavioral
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

entity RegBank is
    Port ( Clk : in STD_LOGIC;
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
           
end RegBank;

architecture Behavioral of RegBank is

component Reg
port(      D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Res:in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal yout:STD_LOGIC_VECTOR (7 downto 0);

signal R0_Val,R1_Val,R2_Val,R3_Val,R4_Val,R5_Val,R6_Val,R7_Val,WriteVal1:STD_LOGIC_VECTOR (3 downto 0);
 
begin
   

    WriteVal1<=WriteVal;


    Yout<=RegSel;

    R0:Reg
    port map(  D=>"0000",
               En=>Yout(1),
               Res=>Clear,
               Clk =>Clk,
               Q =>R0_Val);
    R1:Reg
    port map(  D=>WriteVal1,
               En=>Yout(1),
               Res=>Clear,
               Clk =>Clk,
               Q =>R1_Val);
    R2:Reg
    port map(  D=>WriteVal1,
               En=>Yout(2),
               Res=>Clear,
               Clk =>Clk,
               Q =>R2_Val);
    R3:Reg
     port map(  D=>WriteVal1,
                En=>Yout(3),
                Res=>Clear,
                Clk =>Clk,
                Q =>R3_Val);
    R4:Reg
     port map(  D=>WriteVal1,
                En=>Yout(4),
                Res=>Clear,
                Clk =>Clk,
                Q =>R4_Val);   
    R5:Reg
    port map(  D=>WriteVal1,
               En=>Yout(5),
               Res=>Clear,
               Clk =>Clk,
               Q =>R5_Val);
    R6:Reg
     port map(  D=>WriteVal1,
                En=>Yout(6),
                Res=>Clear,
                Clk =>Clk,
                Q =>R6_Val);
    R7:Reg
     port map(  D=>WriteVal1,
                En=>Yout(7),
                Res=>Clear,
                Clk =>Clk,
                Q =>R7_Val);
                
Reg0<=R0_Val;
Reg1<=R1_Val;
Reg2<=R2_Val;
Reg3<=R3_Val;
Reg4<=R4_Val;
Reg5<=R5_Val;
Reg6<=R6_Val;
Reg7<=R7_Val;
end Behavioral;
