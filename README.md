# Simple 8-bit RISC-Based CPU (SystemVerilog)

## Overview
This project implements a **simple RISC-based CPU** using **SystemVerilog**, designed to demonstrate the complete **fetch–decode–execute** cycle using modular RTL components.

The CPU is instruction-driven, controlled by a finite state control unit, and supports basic arithmetic, logical, memory, and control-flow instructions.

---


# ✅ Diagnostic Test Programs
## 🧪 Test 1 – Basic Instruction Test

File: CPUtest1.dat

Tests: HLT, ADD, AND, XOR, LDA, STO, JMP

Expected Halt PC: 0x17

Result: ✅ PASS

## 🧪 Test 2 – Advanced Instruction Test

File: CPUtest2.dat

Tests extended instruction behavior

Expected Halt PC: 0x10

Result: ✅ PASS

## 🧪 Test 3 – Fibonacci Program

File: CPUtest3.dat

Computes Fibonacci sequence (0 → 144)

Stores results in memory

Expected Halt PC: 0x0C

Result: ✅ PASS

---

# ✔ Pass/Fail Criteria

A test passes if:

halt signal is asserted

Program Counter matches expected halt address 

---

# 🗂 Repository Structure
RTL/1_RTL_code/top_cpu.sv                   → TOP RTL design

RTL/README.md                               → RTL EXPLAINATION

RTL/2_TESTBENCH/cpu_test.sv                 → Testbench

RTL/2_TESTBENCH/test.do                     → format_view

RTL/3_DOCS                                  → block_diagram of cpu : state_diagram of controller : state_table of controller

RTL/4_SIMULATION_VERIFICATION/README.md     → Simulation results

RTL/4_SIMULATION_VERIFICATION/transcript_summary.txt     → Simulation results summary

RTL/4_SCHEMATIC/netlist.pdf             → Schematic

LOGIC_SYNTHESIS/SETUP_SYNTHESIS         → Synthesis scripts

LOGIC_SYNTHESIS/NETLIST                 → Synthesised netlist and schematic         

LOGIC_SYNTHESIS/PPA_Reports             → PPA Analysis


## ▶ Simulation
To run in ModelSim:
vsim -do RTL/4_SIMULATION_VERIFICATION/test.do


# 👨‍💻 Author
Aryan Mahajan

