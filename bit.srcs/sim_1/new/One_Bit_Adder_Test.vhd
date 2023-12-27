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
        Reset <= '0';
     wait for clk_period * 4;
       Reset <= '1';
     wait for clk_period * 4;
     
       -- First Test Case 
       Pin1        <= '0';
       Pin2        <= '0';
       Carry_IN    <= '0';
       
       wait for clk_period*2;
       
       -- Second Test Case 
       Pin1        <= '1';
       Pin2        <= '0';
       Carry_IN    <= '0';
       
       wait for clk_period*2;
       
        -- First Test Case 
       Pin1        <= '0';
       Pin2        <= '0';
       Carry_IN    <= '0';
       
       wait;    
    end process;
        

end Behavioral;
