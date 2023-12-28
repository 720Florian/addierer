----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2023 12:07:52
-- Design Name: 
-- Module Name: One_Bit_Adder_Test - Behavioral
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



entity One_Bit_Adder_Test is
end One_Bit_Adder_Test;

architecture Behavioral of One_Bit_Adder_Test is
    
    Component One_Bit_Adder_Arch
    Port(
        Pin1 : in STD_LOGIC;
        Pin2 : in STD_LOGIC;
        Carry_In : in STD_LOGIC;
        Sum_Out : out STD_LOGIC;
        Carry_Out : out STD_LOGIC;
        Reset : in STD_LOGIC;
        Clk : in STD_LOGIC
        );
    END Component;   
    
    --Inputs
    signal Pin1 : STD_LOGIC := '0';
    signal Pin2 : STD_LOGIC := '0';
    signal Carry_IN : STD_LOGIC := '0'; 
    signal Reset : STD_LOGIC := '0';
    signal Clk : STD_LOGIC := '0';
    
    --Outputs
    signal Sum_Out : STD_LOGIC := '0';
    signal Carry_Out : STD_LOGIC := '0';

    constant clk_period : time := 1ns;
begin
    uut: One_Bit_Adder_Arch PORT MAP (
        Pin1        => Pin1,
        Pin2        => Pin2,
        Carry_IN    => Carry_IN,
        Sum_Out     => Sum_Out,
        Carry_Out   => Carry_Out,
        Reset       => Reset,
        Clk         => Clk
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
        
        -- Erster Test: 12 | (0,0,0) -> (0,0)
        Carry_In    <= '0';
        Pin1        <= '0';
        Pin2        <= '0';
        wait for clk_period*2;
        
        -- Zweiter Test: 14 | (0,1,0) -> (0, 1) 
        Carry_In    <= '0';
        Pin1        <= '1';
        Pin2        <= '0';
        wait for clk_period*2;
        -- Dritter Test: 16 | (0,0,1) -> (0, 1)
        Carry_In    <= '0';
        Pin1        <= '0';
        Pin2        <= '1';
        wait for clk_period*2;
        
        -- Vierter Test: 18 | (0,1,1) -> (1, 0)
        -- Der erste Test, bei dem Carry_Out High sein sollte!
        Carry_In    <= '0';
        Pin1        <= '1';
        Pin2        <= '1';
        wait for clk_period*2;
        
        -- Fünfter: 20 | (1,0,0) -> (0,1)
        -- Erster Test, bei dem Carry_In high sein wird! 
        -- Carry wird ab jetzt immer high sein
        Carry_IN    <= '1'; -- wichtig!
        Pin1        <= '0';
        Pin2        <= '0';
        wait for clk_period*2;
        
        -- Sechster Test: 22 | (1,1,0) -> (1, 0) 
        Carry_IN    <= '1'; -- wichtig!
        Pin1        <= '1';
        Pin2        <= '0';
        wait for clk_period*2;
        -- Siebter Test: 24 | (1,0,1) -> (1, 0)
        Carry_IN    <= '1'; -- wichtig!
        Pin1        <= '0';
        Pin2        <= '1';
        wait for clk_period*2;
        
        -- Achter Test: 26 | (1,1,1) -> (1, 1)
        -- Der einzige Test, bei dem alle Outputs High sein sollten
        Carry_IN    <= '1'; -- wichtig!
        Pin1        <= '1';
        Pin2        <= '1';
        
        wait;    
    end process;
end Behavioral;
