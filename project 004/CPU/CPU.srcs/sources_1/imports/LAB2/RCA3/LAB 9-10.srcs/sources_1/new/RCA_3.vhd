----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2018 10:28:31 AM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
--           C_IN : in STD_LOGIC;
           C_OUT : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end RCA_3;

architecture Behavioral of RCA_3 is
COMPONENT FA
PORT(A:IN STD_LOGIC;
    B:IN STD_LOGIC;
    C_IN:STD_LOGIC;
    S:OUT STD_LOGIC;
    C_OUT:OUT STD_LOGIC);
END COMPONENT;
SIGNAL FA0_C,FA1_C:STD_LOGIC;
    
begin
--C_OUT<='0' when C_IN='1';
FA_0:FA
PORT MAP(
    A=>A(0),
    B=>B(0),
    C_IN=>'0',
    S=>S(0),
    C_OUT=>FA0_C);

FA_1:FA
PORT MAP(
    A=>A(1),
    B=>B(1),
    C_IN=>FA0_C,
    S=>S(1),
    C_OUT=>FA1_C);
    
FA_2:FA
    PORT MAP(
        A=>A(2),
        B=>B(2),
        C_IN=>FA1_C,
        S=>S(2),
        C_OUT=>C_OUT);
end Behavioral;
