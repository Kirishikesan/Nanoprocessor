----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2018 10:45:11 AM
-- Design Name: 
-- Module Name: TB_RCA_3 - Behavioral
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

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is
COMPONENT RCA_3
Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
--           C_IN : in STD_LOGIC;
           C_OUT : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;
SIGNAL A,B,S:STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL C_OUT:STD_LOGIC;
begin
UUT:RCA_3 PORT MAP(
A(2 DOWNTO 0)=>A(2 DOWNTO 0),
B(2 DOWNTO 0)=>B(2 DOWNTO 0),
S(2 DOWNTO 0)=>S(2 DOWNTO 0),
--C_IN =>C_IN,
C_OUT=>C_OUT);

PROCESS
BEGIN
    --INITIALIZING
    A<="000";
    B<="000";
    --C_in<='0';
    WAIT FOR 100 NS;
    A<="101";
    B<="010";

    wait for 100ns;
    A<="100";
    B<="100";

    WAIT FOR 100 NS;
    A<="000";
    B<="111";

 
    WAIT FOR 100 NS;
    A<="110";
    B<="010";
    WAIT FOR 100 NS;
END PROCESS;
END BEHAVIORAL;