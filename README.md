# Simple 8-bit RISC-Based CPU (SystemVerilog)

## Overview
This project implements a **simple RISC-based CPU** using **SystemVerilog**, designed to demonstrate the complete **fetch–decode–execute** cycle using modular RTL components.

The CPU is instruction-driven, controlled by a finite state control unit, and supports basic arithmetic, logical, memory, and control-flow instructions.

---

## 🔍 Patterns Detected
- 1101  
- 1010  
- 1001  
- 0110  

## 🗂 Repository Structure
RTL/1_RTL_code/seq_det.sv               → RTL design

RTL/2_TESTBENCH/tb_seq_det.sv           → Testbench

RTL/3_SIMULATION_VERIFICATION/README.md → Simulation results

RTL/4_SCHEMATIC/netlist.pdf             → Schematic

LOGIC_SYNTHESIS/SETUP_SYNTHESIS         → Synthesis scripts

LOGIC_SYNTHESIS/NETLIST                 → Synthesised netlist and schematic         

LOGIC_SYNTHESIS/PPA_Reports             → PPA Analysis


## ▶ Simulation
To run in ModelSim:
vsim -do 3_SIMULATION_VERIFICATION/seq.do


## 👨‍💻 Author
Aryan Mahajan

