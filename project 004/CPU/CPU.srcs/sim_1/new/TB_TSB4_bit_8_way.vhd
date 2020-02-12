----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2018 04:48:42 AM
-- Design Name: 
-- Module Name: TB_TSB4_bit_8_way - Behavioral
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

entity TB_TSB4_bit_8_way is
--  Port ( );
end TB_TSB4_bit_8_way;

architecture Behavioral of TB_TSB4_bit_8_way is
COMPONENT TSB4_bit_8_way
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
END COMPONENT;
SIGNAL A,B,C,D,E,F,G,H,ANSWER:STD_LOGIC_VECTOR (3 downto 0);
SIGNAL CONTROL:STD_LOGIC_VECTOR (2 downto 0);
SIGNAL EN,iSJUMP:STD_LOGIC;
begin
UUT:TSB4_bit_8_way
PORT MAP(
A=>A,
B=>B,
C=>C,
D=>D,
E=>E,
F=>F,
G=>G,
H=>H,
CONTROL=>CONTROL,
EN=>EN,
ANSWER=>ANSWER,
ISJUMP=>ISJUMP);


PROCESS 
BEGIN

A<="0000";
B<="0001";
C<="0010";
D<="0011";
E<="0100";
F<="0101";
G<="0110";
H<="0111";
EN<='1';
CONTROL<="000";
WAIT FOR 100NS;
CONTROL<="001";
WAIT FOR 100NS;
CONTROL<="010";
WAIT FOR 100NS;
CONTROL<="011";
WAIT FOR 100NS;
CONTROL<="100";
WAIT FOR 100NS;
CONTROL<="101";
WAIT FOR 100NS;
CONTROL<="110";
WAIT FOR 100NS;
CONTROL<="111";
WAIT FOR 100NS;
END PROCESS;




end Behavioral;
