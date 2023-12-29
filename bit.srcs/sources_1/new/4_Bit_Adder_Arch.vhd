----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2023 10:58:31
-- Design Name: 
-- Module Name: Four_Bit_Adder_Arch - Behavioral
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

entity Four_Bit_Adder_Arch is
    -- Pin Nummer ist sortiert nach Signifikanz: 
    -- Pin1 ist 1/0 Bit, Pin2 ist 2/0, Pin3 ist 4/0
    Port ( Pin1_Number1 : in STD_LOGIC;
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
           Clk : in STD_LOGIC);
           
end Four_Bit_Adder_Arch;

architecture Behavioral of Four_Bit_Adder_Arch is
    -- Signale fuer den Addierer
    -- analog zu den Bausteinen in digital logic sim
    signal S1_A1_Carry_Bit : STD_LOGIC;
    signal S2_A2_Carry_Bit : STD_LOGIC;
    signal S3_A3_Carry_Bit : STD_LOGIC;
    
    begin -- architecture
    
    FIRST_ADDER : ENTITY work.One_Bit_Adder_Arch(Behavioral) PORT MAP (
        Pin1        => Pin1_Number1,
        Pin2        => Pin1_Number2,
        Carry_In    => Carry_In,
        Sum_Out     => Sum_Out_Pin1,
        Carry_Out   => S1_A1_Carry_Bit,
        Reset       => Reset,
        Clk         => Clk
    );
    
    SECOND_ADDER : ENTITY work.One_Bit_Adder_Arch(Behavioral) PORT MAP (
        Pin1        => Pin2_Number1,
        Pin2        => Pin2_Number2,
        Carry_In    => S1_A1_Carry_Bit, -- Carry Bit des vorherigen Blocks
        Sum_Out     => Sum_Out_Pin2,
        Carry_Out   => S2_A2_Carry_Bit,
        Reset       => Reset,
        Clk         => Clk
    );
    
    THIRD_ADDER : ENTITY work.One_Bit_Adder_Arch(Behavioral) PORT MAP (
        Pin1        => Pin3_Number1,
        Pin2        => Pin3_Number2,
        Carry_In    => S2_A2_Carry_Bit, -- Carry Bit des vorherigen Blocks
        Sum_Out     => Sum_Out_Pin3,
        Carry_Out   => S3_A3_Carry_Bit,
        Reset       => Reset,
        Clk         => Clk
    );
    
    FOURTH_ADDER : ENTITY work.One_Bit_Adder_Arch(Behavioral) PORT MAP (
        Pin1        => Pin4_Number1,
        Pin2        => Pin4_Number2,
        Carry_In    => S3_A3_Carry_Bit, -- Carry Bit des vorherigen Blocks
        Sum_Out     => Sum_Out_Pin4,
        Carry_Out   => Carry_Out,
        Reset       => Reset,
        Clk         => Clk
    );
    
    -- synchroner Prozess
    P1: process(Reset, Clk) begin
        -- Reset 
        -- allen nicht eingehenden Signalen ein standard Wert zuweisen
        if Reset = '0' then -- 0 da 'active low'
            -- interne Flip-Flops auf 0
            S1_A1_Carry_Bit <= '0';
            S2_A2_Carry_Bit <= '0';
            S3_A3_Carry_Bit <= '0';
            
            -- ausgaenge auf 0
            Sum_Out_Pin1 <= '0';
            Sum_Out_Pin2 <= '0';
            Sum_Out_Pin3 <= '0';
            Sum_Out_Pin4 <= '0';
            
            Carry_Out <= '0';
            
        elsif rising_edge(Clk) then
           -- eigentlich müsste alles von allein klappen, da das rising_edge verhalten im 1-Bit
           -- Baustein gehandhabt wird
        end if; 
    end process P1;
end Behavioral;
