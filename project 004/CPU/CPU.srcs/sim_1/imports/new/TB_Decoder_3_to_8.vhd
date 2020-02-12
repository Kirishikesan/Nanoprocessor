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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
    COMPONENT Decoder_3_to_8
    PORT(I : in STD_LOGIC_VECTOR (2 downto 0);
         EN : in STD_LOGIC;
         Y : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
        SIGNAL I :STD_LOGIC_VECTOR(2 downto 0);
        SIGNAL Y :STD_LOGIC_VECTOR(7 downto 0);
        SIGNAL EN :STD_LOGIC;
       
        
begin
    


UUT:Decoder_3_to_8
 PORT MAP(
    I(2 DOWNTO 0)=>I(2 DOWNTO 0),
    EN=>EN,
    Y(7 DOWNTO 0)=>Y(7 DOWNTO 0));
    
PROCESS
BEGIN 
--ENBLE THE 2-4 DECORDERS
    EN<='1';
--TESTING
  I<="000";
  WAIT FOR 100NS;
  I<="001";
  WAIT FOR 100NS;
  I<="010";
  WAIT FOR 100NS;
  I<="011";
  WAIT FOR 100NS;
  I<="100";
  WAIT FOR 100NS;
  I<="101";
  WAIT FOR 100NS;
  I<="110";
  WAIT FOR 100NS;
  I<="111";
  WAIT FOR 100NS;
    
END PROCESS;

end Behavioral;
