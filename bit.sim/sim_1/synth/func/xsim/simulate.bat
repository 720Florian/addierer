@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Dec 27 13:20:24 +0100 2023
REM SW Build 3865809 on Sun May  7 15:05:29 MDT 2023
REM
REM IP Build 3864474 on Sun May  7 20:36:21 MDT 2023
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim One_Bit_Adder_Test_func_synth -key {Post-Synthesis:sim_1:Functional:One_Bit_Adder_Test} -tclbatch One_Bit_Adder_Test.tcl -log simulate.log"
call xsim  One_Bit_Adder_Test_func_synth -key {Post-Synthesis:sim_1:Functional:One_Bit_Adder_Test} -tclbatch One_Bit_Adder_Test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
