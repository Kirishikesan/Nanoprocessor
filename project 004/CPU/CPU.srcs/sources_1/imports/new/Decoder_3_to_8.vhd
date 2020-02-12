----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2018 03:01:21 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    COMPONENT Decoder_2_TO_4
    PORT(I : IN STD_LOGIC_VECTOR(1 downto 0);
          EN :IN  STD_LOGIC;
          Y :  OUT STD_LOGIC_VECTOR (3 downto 0));
   END COMPONENT ;
   SIGNAL Y0, Y1 : std_logic_vector (3 DOWNTO 0);

begin
Decoder_2_TO_4_0:Decoder_2_TO_4
    PORT MAP(
    I(1 DOWNTO 0)=>I(1 DOWNTO 0),
    EN=>EN,
    Y(3 DOWNTO 0)=>Y0(3 DOWNTO 0));

Decoder_2_TO_4_1:Decoder_2_TO_4
    PORT MAP(
    I(1 DOWNTO 0)=>I(1 DOWNTO 0),
    EN=>EN,
    Y(3 DOWNTO 0)=>Y1(3 DOWNTO 0));
    
Y(0)<=Y0(0) AND (NOT I(2));
Y(1)<=Y0(1) AND (NOT I(2));
Y(2)<=Y0(2) AND (NOT I(2));
Y(3)<=Y0(3) AND (NOT I(2));

Y(4)<=Y1(0) AND  I(2);
Y(5)<=Y1(1) AND  I(2);
Y(6)<=Y1(2) AND  I(2);
Y(7)<=Y1(3) AND  I(2);


end Behavioral;
