----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2018 01:45:05 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
component Reg
port(D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Slow_Clk
 port (
    Clk_in : in STD_LOGIC;
    Clk_out: out STD_LOGIC);
end component;
component RCA_4
port(  A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;


 signal Clk_slow1,Y : std_logic;

 signal Q0, Q1 ,S0: std_logic_vector(3 downto 0); 
 
 
 
begin
Y<=not(RegSel);
Slow_Clk0 : Slow_Clk
     port map (
     Clk_in => Clk,
     Clk_out => Clk_slow1);
Reg0:Reg
port map(
D=>A,
En=>RegSel,
Clk=>Clk_slow1,
Q=>Q0);

REG1:Reg
port map(
D=>A,
En=> Y,
Clk=>Clk_slow1,
Q=>Q1);

RCA_40:RCA_4
port map(  A0 =>Q0(0),
           A1 =>Q0(1),
           A2 =>Q0(2),
           A3=>Q0(3),
           B0=>Q1(0),
           B1=>Q1(1),
           B2=>Q1(2),
           B3=>Q1(3),
           C_in=>'0',
           S0=>S0(0),
           S1=>S0(1),
           S2=>S0(2),
           S3=>S0(3),
           C_out=>Carry);

S(0)<=S0(0);
S(1)<=S0(1);
S(2)<=S0(2);
S(3)<=S0(3);
Zero<=not(S0(0) OR S0(1) OR S0(2));

end Behavioral;
