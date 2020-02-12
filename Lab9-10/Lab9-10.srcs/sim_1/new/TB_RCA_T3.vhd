----------------------------------------------------------------------------------
-- Company: 
-- Engineer: NILAAN L
-- 
-- Create Date: 10/10/2018 09:42:17 PM
-- Design Name: 
-- Module Name: TB_RCA_4 - Behavioral
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

entity TB_RCA_T3 is
--  Port ( );
end TB_RCA_T3;

architecture Behavioral of TB_RCA_T3 is
COMPONENT RCA_4
Port (     A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           B : in STD_LOGIC_VECTOR(2 DOWNTO 0);

           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(2 DOWNTO 0);


           C_out : out STD_LOGIC);
END COMPONENT;
SIGNAL A,B,S :std_logic_vector(2 DOWNTO 0);
SIGNAL C_out,C_in :std_logic;

begin
UUT:RCA_4 PORT MAP(
A(2 DOWNTO 0)=>A(2 DOWNTO 0),
B(2 DOWNTO 0)=>B(2 DOWNTO 0),
C_in=>C_in,
S(2 DOWNTO 0)=>S(2 DOWNTO 0),
C_out=>C_out);

 
PROCESS
BEGIN
    A<="000";
    B<="000";
    C_in<='0';
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
end process;
end Behavioral;
