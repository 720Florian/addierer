-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Wed Dec 27 13:20:20 2023
-- Host        : DESKTOP-HP8S7BO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/vhdl/bit/bit.sim/sim_1/synth/func/xsim/One_Bit_Adder_Test_func_synth.vhd
-- Design      : One_Bit_Adder_Arch
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbv676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity One_Bit_Adder_Arch is
  port (
    Pin1 : in STD_LOGIC;
    Pin2 : in STD_LOGIC;
    Carry_In : in STD_LOGIC;
    Sum_Out : out STD_LOGIC;
    Carry_Out : out STD_LOGIC;
    Reset : in STD_LOGIC;
    Clk : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of One_Bit_Adder_Arch : entity is true;
end One_Bit_Adder_Arch;

architecture STRUCTURE of One_Bit_Adder_Arch is
  signal Carry_In_IBUF : STD_LOGIC;
  signal Carry_Out_OBUF : STD_LOGIC;
  signal Carry_Out_i_1_n_0 : STD_LOGIC;
  signal Clk_IBUF : STD_LOGIC;
  signal Clk_IBUF_BUFG : STD_LOGIC;
  signal Pin1_IBUF : STD_LOGIC;
  signal Pin2_IBUF : STD_LOGIC;
  signal Reset_IBUF : STD_LOGIC;
  signal S1_xor : STD_LOGIC;
  signal S1_xor0 : STD_LOGIC;
  signal S1_xor_i_2_n_0 : STD_LOGIC;
  signal S2_and1 : STD_LOGIC;
  signal S2_and10 : STD_LOGIC;
  signal S3_and2 : STD_LOGIC;
  signal S3_and20 : STD_LOGIC;
  signal Sum_Out0 : STD_LOGIC;
  signal Sum_Out_OBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of S1_xor_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of S2_and1_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of S3_and2_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Sum_Out_i_1 : label is "soft_lutpair0";
begin
Carry_In_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Carry_In,
      O => Carry_In_IBUF
    );
Carry_Out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Carry_Out_OBUF,
      O => Carry_Out
    );
Carry_Out_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S2_and1,
      I1 => S3_and2,
      O => Carry_Out_i_1_n_0
    );
Carry_Out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_IBUF_BUFG,
      CE => '1',
      CLR => S1_xor_i_2_n_0,
      D => Carry_Out_i_1_n_0,
      Q => Carry_Out_OBUF
    );
Clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Clk_IBUF,
      O => Clk_IBUF_BUFG
    );
Clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Clk,
      O => Clk_IBUF
    );
Pin1_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Pin1,
      O => Pin1_IBUF
    );
Pin2_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Pin2,
      O => Pin2_IBUF
    );
Reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Reset,
      O => Reset_IBUF
    );
S1_xor_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Pin2_IBUF,
      I1 => Pin1_IBUF,
      O => S1_xor0
    );
S1_xor_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Reset_IBUF,
      O => S1_xor_i_2_n_0
    );
S1_xor_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_IBUF_BUFG,
      CE => '1',
      CLR => S1_xor_i_2_n_0,
      D => S1_xor0,
      Q => S1_xor
    );
S2_and1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S1_xor,
      I1 => Carry_In_IBUF,
      O => S2_and10
    );
S2_and1_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_IBUF_BUFG,
      CE => '1',
      CLR => S1_xor_i_2_n_0,
      D => S2_and10,
      Q => S2_and1
    );
S3_and2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Pin1_IBUF,
      I1 => Pin2_IBUF,
      O => S3_and20
    );
S3_and2_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_IBUF_BUFG,
      CE => '1',
      CLR => S1_xor_i_2_n_0,
      D => S3_and20,
      Q => S3_and2
    );
Sum_Out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Sum_Out_OBUF,
      O => Sum_Out
    );
Sum_Out_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Carry_In_IBUF,
      I1 => S1_xor,
      O => Sum_Out0
    );
Sum_Out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_IBUF_BUFG,
      CE => '1',
      CLR => S1_xor_i_2_n_0,
      D => Sum_Out0,
      Q => Sum_Out_OBUF
    );
end STRUCTURE;
