----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2018 11:54:17 AM
-- Design Name: 
-- Module Name: LUT_8_12 - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_8_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is
component LUT_8_12
    port(
    address:std_logic_vector(2 downto 0);
    data:std_logic_vector(11 downto 0));
    end component;
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal Instruction_ROM : rom_type := (
        "100010000011",--MOVE R1,3 ;R1<=3
        "100100000001",--MOVE R2,1 ;R2<=1
        "010100000000",--NEG R2    ;R2<=-R2 (-1)
        "001110010000",--ADD R7,R1 ;R7<=R7+R1
        "000010100000",--ADD R1,R2 ;R1<=R1+R2
        "110010000111",--JZR R1,7  ;JUMP TO 7 IF VALUR IN REG R1 IS 0.
        "110000000011",--JZR R0,3  ;JUMP TO 3 IF VALUR IN REG R0 IS 0.
        "000000000000"
   );

begin
data<=Instruction_ROM(to_integer(unsigned(address)));

end Behavioral;
