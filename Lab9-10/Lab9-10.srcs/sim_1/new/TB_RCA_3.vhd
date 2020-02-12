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

entity TB_RCA_4 is
--  Port ( );
end TB_RCA_4;

architecture Behavioral of TB_RCA_4 is
COMPONENT RCA_4
Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;

           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;

           C_out : out STD_LOGIC);
END COMPONENT;
SIGNAL A0,A1,A2,B0,B1,B2,C_in,S0,S1,S2,C_out :std_logic;

begin
UUT:RCA_4 PORT MAP(
A0=>A0,
A1=>A1,
A2=>A2,
B0=>B0,
B1=>B1,
B2=>B2,
C_in=>C_in,
S0=>S0,
S1=>S1,
S2=>S2,
C_out=>C_out);

 
PROCESS
BEGIN
    A0<='0';
    A1<='0';
    A2<='0';
    B0<='0';
    B1<='0';
    B2<='0';
    C_in<='0';
    WAIT FOR 100 NS;
    A0<='1';
    A1<='0';
    A2<='1';
    B0<='0';
    B1<='1';
    B2<='0';

    wait for 100ns;
    A0<='1';
    A1<='0';
    A2<='0';
    B0<='1';
    B1<='0';
    B2<='0';


    WAIT FOR 100 NS;
    A0<='0';
    A1<='0';
    A2<='0';

    B0<='1';
    B1<='1';
    B2<='1';

 
    WAIT FOR 100 NS;
    A0<='1';
    A1<='1';
    A2<='0';
    B0<='0';
    B1<='1';
    B2<='0';

    WAIT FOR 100 NS;
end process;
end Behavioral;
