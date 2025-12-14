# Simple 8-bit RISC-Based CPU (SystemVerilog)


## 📌 Overview
This repository contains a **cycle-accurate SystemVerilog implementation of a simple RISC-style CPU**, designed with a **centralized control FSM** and verified using **ModelSim**.  
The CPU follows a **multi-cycle fetch–decode–execute architecture**, prioritizing clarity of control, timing determinism, and verification transparency.

The design is suitable for:
- RTL / ASIC learning
- CPU microarchitecture understanding
- Interview and portfolio demonstration
- Educational and diagnostic program execution

---

## ⚙️ Performance & Timing Characteristics

### Clocking
- **Master Clock Period**: 1 ns  
- **Control Clock (`ctrl_clk`)**: Derived from master clock

### Instruction Timing
- **Instruction Latency**:  
  - **8 control clock cycles**  
  - **16 master clock cycles**

- **Instruction Throughput**:  
  - One instruction completes every **8 control clock cycles**  
  - Throughput equals latency (non-pipelined design)

> ⚠️ This is a **multi-cycle, non-pipelined CPU**, optimized for control clarity rather than peak IPC.

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

RTL/README.md                               → CPU ARCHITECTURE EXPLAINATION

RTL/2_TESTBENCH/cpu_test.sv                 → Testbench

RTL/2_TESTBENCH/test.do                     → format_view

RTL/3_DOCS                                  → block_diagram of cpu : state_diagram of controller : state_table of controller

RTL/4_SIMULATION_VERIFICATION/README.md     → Simulation results

RTL/4_SIMULATION_VERIFICATION/transcript_summary.txt     → Simulation results summary

RTL/4_SCHEMATIC/netlist.pdf             → Schematic

LOGIC_SYNTHESIS/SETUP_SYNTHESIS         → Synthesis scripts

LOGIC_SYNTHESIS/NETLIST                 → Synthesised netlist and schematic         

LOGIC_SYNTHESIS/PPA_Reports             → PPA Analysis

---

# 👨‍💻 Author
Aryan Mahajan

---

## ▶️ How to Run Simulation

```tcl
vlog *.sv
vsim tb_cpu
run -all



