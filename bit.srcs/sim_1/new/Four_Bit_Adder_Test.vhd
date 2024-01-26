----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2023 12:05:52
-- Design Name: 
-- Module Name: Four_Bit_Adder_Test - Behavioral
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



entity Four_Bit_Adder_Test is
end Four_Bit_Adder_Test;

architecture Behavioral of Four_Bit_Adder_Test is
    
    Component Four_Bit_Adder_Arch
    Port(
       Pin1_Number1 : in STD_LOGIC;
       Pin2_Number1 : in STD_LOGIC;
       Pin3_Number1 : in STD_LOGIC;
       Pin4_Number1 : in STD_LOGIC;
       
       Pin1_Number2 : in STD_LOGIC;
       Pin2_Number2 : in STD_LOGIC;
       Pin3_Number2 : in STD_LOGIC;
       Pin4_Number2 : in STD_LOGIC;
    
       Carry_In : in STD_LOGIC;
       -- output bits
       Sum_Out_Pin1 : out STD_LOGIC;
       Sum_Out_Pin2 : out STD_LOGIC;
       Sum_Out_Pin3 : out STD_LOGIC;
       Sum_Out_Pin4 : out STD_LOGIC;
       
       Carry_Out : out STD_LOGIC;
       
       Reset : in STD_LOGIC;
       Clk : in STD_LOGIC
    );
    END Component;   
    
    signal Pin1_Number1 : STD_LOGIC := '0';
    signal Pin2_Number1 : STD_LOGIC := '0';
    signal Pin3_Number1 : STD_LOGIC := '0';
    signal Pin4_Number1 : STD_LOGIC := '0';
                                 
    signal Pin1_Number2 : STD_LOGIC := '0';
    signal Pin2_Number2 : STD_LOGIC := '0';
    signal Pin3_Number2 : STD_LOGIC := '0';
    signal Pin4_Number2 : STD_LOGIC := '0';

    signal Carry_In : STD_LOGIC := '0';
        -- output bits
    signal Sum_Out_Pin1 : STD_LOGIC := '0';
    signal Sum_Out_Pin2 : STD_LOGIC := '0';
    signal Sum_Out_Pin3 : STD_LOGIC := '0';
    signal Sum_Out_Pin4 : STD_LOGIC := '0';
   
    signal Carry_Out : STD_LOGIC := '0';
      
    signal Reset : STD_LOGIC := '0';
    signal Clk : STD_LOGIC := '0';

    constant clk_period : time := 1ns;
begin
    uut: Four_Bit_Adder_Arch PORT MAP (
        Pin1_Number1    => Pin1_Number1,
        Pin2_Number1    => Pin2_Number1,
        Pin3_Number1    => Pin3_Number1,
        Pin4_Number1    => Pin4_Number1,
        Pin1_Number2    => Pin1_Number2,
        Pin2_Number2    => Pin2_Number2,
        Pin3_Number2    => Pin3_Number2,
        Pin4_Number2    => Pin4_Number2,
        Carry_In        => Carry_In,
        Sum_Out_Pin1    => Sum_Out_Pin1,
        Sum_Out_Pin2    => Sum_Out_Pin2,
        Sum_Out_Pin3    => Sum_Out_Pin3,
        Sum_Out_Pin4    => Sum_Out_Pin4,
        Carry_Out       => Carry_Out,
        Reset           => Reset,
        Clk             => Clk
    );
    
    clk_process : process
    
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
        
    end process;    
    
    stim_proc: process
    begin
        -- 4 Pulse Reset, 4 Pulse Puffer
        Reset <= '0';
        wait for clk_period * 4;
        Reset <= '1';
        wait for clk_period * 4;
     
        -- Test cases für einen 1-Bit addierer, mit drei Eingängen
        -- (carry, p1, p2) und zwei Ausgängengen (carry, sum)
        -- werden so genannt: Puls | (eingabe) -> (erwartung)
        -- carry an erster stelle, da es signifikanter ist
        -- Puls ist der Puls, bei dem das Ergebnis stabil im Register liegt
        
        -- Erster Test: 10 | (0,0,0) -> (0,0)
        Pin1_Number1    <= '0';
        Pin2_Number1    <= '0';
        Pin3_Number1    <= '0';
        Pin4_Number1    <= '0';
        Pin1_Number2    <= '0';
        Pin2_Number2    <= '0';
        Pin3_Number2    <= '0';
        Pin4_Number2    <= '0';
        Carry_In        <= '0';
        wait for clk_period*2;
        
        -- Zweiter Test: 12 | (0,1,0) -> (0, 1) 
        Pin1_Number1    <= '1';
        Pin2_Number1    <= '0';
        Pin3_Number1    <= '0';
        Pin4_Number1    <= '0';
        Pin1_Number2    <= '0';
        Pin2_Number2    <= '0';
        Pin3_Number2    <= '0';
        Pin4_Number2    <= '0';
        Carry_In        <= '0';

        
        wait;    
    end process;
end Behavioral;
