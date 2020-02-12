----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2018 10:43:37 PM
-- Design Name: 
-- Module Name: CPU - Behavioral
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

entity CPU is
    Port ( 
    Clk:in std_logic;
    Reset:in std_logic;
    led : out STD_LOGIC_VECTOR (3 downto 0);
    S7seg:out std_logic_vector(6 downto 0);
    an: out STD_LOGIC_VECTOR (3 downto 0);
    CFlag:out std_logic);
    
end CPU;

architecture Behavioral of CPU is
component Slow_Clk 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
component ProgramCounter 
    Port ( Inp : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clkp : in STD_LOGIC;
           RomSel : out STD_LOGIC_VECTOR (2 downto 0));  
           
end component; 
component LUT_8_12
port(      address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;
component TSB3_bit_2_way
port(      A : in STD_LOGIC_VECTOR (2 downto 0);
           B: in STD_LOGIC_VECTOR(2 downto 0);
           Control: in STD_LOGIC;
           EN: in STD_LOGIC;
           F : out STD_LOGIC_VECTOR (2 downto 0));
end component;
component RCA_3
port ( A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (2 downto 0);
--        C_IN : in STD_LOGIC;
          C_OUT : out STD_LOGIC;
          S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component InsDecoder
port(      Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Isjump:in std_logic;
           Regwrite:out std_logic_vector(2 downto 0);
           Operation:out std_logic;--determine functoin add or sub
           Reg1:out std_logic_vector(2 downto 0);   --input  for mul 1 to select 1st reg val
           Reg2:out std_logic_vector(2 downto 0);   --input  for mul 2 to select 2nd reg val
           Jumpflag:out std_logic;
           Jumpaddress:out std_logic_vector(2 downto 0);
           Immval:out std_logic_vector(3 downto 0);
           Loadsel:out std_logic );
end component;
component TSB4_bit_2_way
port(A : in STD_LOGIC_VECTOR (3 downto 0);
           B: in STD_LOGIC_VECTOR(3 downto 0);
           Control: in STD_LOGIC;
           EN: in STD_LOGIC;
           F : out STD_LOGIC_VECTOR (3 downto 0));
end component;      
component Decoder_3_to_8
port (   I : in STD_LOGIC_VECTOR (2 downto 0);
         EN : in STD_LOGIC;
         Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component RegBank
Port ( Clk : in STD_LOGIC;
           Clear : in STD_LOGIC;
           RegSel : in STD_LOGIC_VECTOR (7 downto 0);
           WriteVal : in STD_LOGIC_VECTOR (3 downto 0);
           
           Reg0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component TSB4_bit_8_way
port(      A : in STD_LOGIC_VECTOR (3 downto 0);
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
end component;

component RCA_4
port(   A:in std_logic_vector(3 downto 0);
        B:in STD_LOGIC_VECTOR(3 downto 0);
        C_in : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR(3 downto 0);
        C_out : out STD_LOGIC;
        Operation:in std_logic;
        Sign:out std_logic);
end component;

component AU_7_seg
port (     A : in STD_LOGIC_VECTOR (2 downto 0);
           S7seg : out STD_LOGIC_vector(6 downto 0);
           an:out std_logic_vector(3 downto 0));
end component;




signal Operation,Isjump1,Isjump,Slw_clk,Jumpflag,CarryFlag,Loadsel,Sign,C_out:std_logic; 

signal nxt,address,RomSel,A,B,S,Jumpaddress,Regwrite,Reg1,Reg2:STD_LOGIC_VECTOR (2 downto 0);
signal AU_Reg2,AU_Reg1,R0_Val,R1_Val,R2_Val,R3_Val,R4_Val,R5_Val,R6_Val,R7_Val,Out1,ToWrite,Temp,Immval,D:STD_LOGIC_VECTOR (3 downto 0);
signal Yout:STD_LOGIC_VECTOR (7  downto 0);

signal data:STD_LOGIC_VECTOR (11 downto 0);



begin
    Slow_Clk0:Slow_Clk
    port map(Clk_in=>Clk,
             Clk_out=>Slw_clk);
             
    CarryFlag<='0';
    
    PC:ProgramCounter
    port map(Inp=>nxt,
             Res=>Reset,
             Clkp=>Slw_clk,
             RomSel=>RomSel);
             
    LUT_8_12_0:LUT_8_12
    PORT MAP(address=>RomSel,
             data=>data);
             
    CounterTSB:TSB3_bit_2_way
    port map(  A =>Jumpaddress,
               B=>S,
               Control=>Jumpflag,  -- when control '1'=>F=A else B
               EN=>'1',
               F=>nxt);
               
    RCA_3A:RCA_3
    port map(A=>RomSel,
             B=>"001",
            S=>S);
            
    InsDec:InsDecoder
    port map(  Ins=>data,
               Isjump=>Isjump,
               Regwrite=>Regwrite,
               Operation=>Operation,--determine functoin
               Reg1=>Reg1,   --input  for mul 1 to select 1st reg val
               Reg2=>Reg2,   --input  for mul 2 to select 2nd reg val
               Jumpflag=>Jumpflag,
               Jumpaddress=>Jumpaddress,
               Immval=>Immval,
               Loadsel=>Loadsel );
                         
    ValToWrite:TSB4_bit_2_way
    port map(A =>Immval,
             B=>Temp,
             Control=>Loadsel,   --  F=A when Loadsel = '0' else B
             EN=>'1',
             F=>ToWrite);
              
  
    Decoder_3_to_8_A:Decoder_3_to_8
    port map(   I =>Regwrite,
                EN =>'1',
                Y=>Yout);    

                
    RegBankA:RegBank 
    port map(Clk =>Clk,
               Clear=>Reset,
               RegSel=>Yout,
               WriteVal=>ToWrite,
               
               Reg0=>R0_Val,
               Reg1=>R1_Val,
               Reg2=>R2_Val,
               Reg3=>R3_Val,
               Reg4=>R4_Val,
               Reg5=>R5_Val,
               Reg6=>R6_Val,
               Reg7=>R7_Val);
                    
    AU_Reg_Sel1:TSB4_bit_8_way
    port map(  A =>R0_Val,
               B=>R1_Val,
               C=>R2_Val,
               D=>R3_Val,
               E=>R4_Val,
               F=>R5_Val,
               G=>R6_Val,
               H=>R7_Val,
               Control=>Reg1,
               EN=>'1',
               Answer=>AU_Reg1,
               Isjump=>Isjump);
    AU_Reg_Sel2:TSB4_bit_8_way
    port map(  A =>R0_Val,
               B=>R1_Val,
               C=>R2_Val,
               D=>R3_Val,
               E=>R4_Val,
               F=>R5_Val,
               G=>R6_Val,
               H=>R7_Val,
               Control=>Reg2,
               EN=>'1',
               Answer=>AU_Reg2,
               Isjump=>Isjump1);
               
    AU:RCA_4
    port map(   A=>AU_Reg1,
                B=>AU_Reg1,
                C_in =>'0',
                S=>Temp,
                C_out=>CarryFlag,
                Operation=>Operation,   --add or sub input 
                Sign=>Sign);            -- SIGN OF THE OUTPUT ;IF '1' ouput is (-) else +
    SegDis:AU_7_seg
    port map ( A =>R7_val(2 downto 0),
               S7seg=>S7seg,
               an=>an);
    
CFlag<= CarryFlag;
LED<=R7_val;
end Behavioral;
