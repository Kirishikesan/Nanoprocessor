----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2018 04:41:40 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
 Port ( 
 A:in std_logic_vector(3 downto 0);
 B:in STD_LOGIC_VECTOR(3 downto 0);
 C_in : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR(3 downto 0);
 C_out : out STD_LOGIC;
 Operation:in std_logic;
 Sign:out std_logic);
 
end RCA_4;
architecture Behavioral of RCA_4 is
 component FA1
 port (
 A: in std_logic;
 B: in std_logic;
 C_in: in std_logic;
 S: out std_logic;
 C_out: out std_logic);
 end component;

 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C,A00,A11,A22,A33 : std_logic;
 SIGNAL SOUT:STD_LOGIC_VECTOR(3 downto 0);
begin
A00<= A(0) XOR Operation;
A11<= A(1) XOR Operation;
A22<= A(2) XOR Operation;
A33<= A(3) XOR Operation;
 FA_0 : FA1
 port map (
 A => A00,
 B => B(0),
 C_in => '0', -- Set to ground
 S => SOUT(0),
 C_out => FA0_C);
 FA_1 : FA1
 port map (
 A => A11,
 B => B(1),
 C_in => FA0_C,
 S => SOUT(1),
 C_out => FA1_C);
 FA_2 : FA1
  port map (
  A =>A22,
  B => B(2),
  C_in => FA1_C,
  S => SOUT(2),
  C_out => FA2_C);
  FA_3 : FA1
  port map (
  A => A33,
  B => B(3),
  C_in => FA2_C,
  S => SOUT(3),
  C_out => C_out);
S<=SOUT;
Sign<=SOUT(3);
 end Behavioral;
