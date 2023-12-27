----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2023 11:28:08
-- Design Name: 
-- Module Name: One_Bit_Adder_Arch - Behavioral
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

entity One_Bit_Adder_Arch is
    Port ( Pin1 : in STD_LOGIC;
           Pin2 : in STD_LOGIC;
           Carry_In : in STD_LOGIC;
           Sum_Out : out STD_LOGIC;
           Carry_Out : out STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC);
           
end One_Bit_Adder_Arch;

architecture Behavioral of One_Bit_Adder_Arch is
    -- Signale fuer den Addierer
    -- analog zu den Bausteinen in digital logic sim
    signal S1_xor : STD_LOGIC;
    signal S2_and1 : STD_LOGIC;
    signal S3_and2 : STD_LOGIC;

    begin -- architecture
    
    -- synchroner Prozess
    P1: process(Reset, Clk) begin
        -- Reset 
        -- allen nicht eingehenden Signalen ein standard Wert zuweisen
        if Reset = '0' then -- 0 da 'active low'
            -- interne Flip-Flops auf 0
            S1_xor <= '0';
            S2_and1 <= '0';
            S3_and2 <= '0';
            -- ausgaenge auf 0
            Sum_Out <= '0';
            Carry_Out <= '0';
            
        elsif rising_edge(Clk) then
            -- erste logik
            S1_xor <= Pin1 XOR Pin2;
            S2_and1 <= S1_xor AND Carry_In;
            S3_and2 <= Pin1 AND Pin2;
            
            -- Ausgangs Logik
            Sum_Out <= S1_xor XOR Carry_In;
            Carry_Out <= S2_and1 OR S3_and2;
        end if; 
    end process P1;
end Behavioral;
