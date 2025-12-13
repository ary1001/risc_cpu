
# Simple 8-bit RISC-Based CPU (SystemVerilog)

## Overview
This project implements a **simple accumulator-based CPU** using **SystemVerilog**, designed to demonstrate the complete **fetch–decode–execute** cycle using modular RTL components.

The CPU is instruction-driven, controlled by a finite state control unit, and supports basic arithmetic, logical, memory, and control-flow instructions.

---

## CPU Architecture

The CPU consists of the following major blocks:

### 1. Program Counter (PC)
- Holds the address of the next instruction.
- Can be:
  - Incremented (`inc_pc`)
  - Loaded with a new address (`load_pc`) for jumps
- Output feeds the address MUX.

### 2. Address MUX 
- Selects the memory address source:
  - **PC address** during instruction fetch
  - **Instruction address field** during operand access
- Controlled by `fetch` signal.

### 3. Memory
- Single-port memory used for:
  - Instruction fetch
  - Data read/write
- Controlled by:
  - `mem_rd` → read enable
  - `mem_wr` → write enable
- Address comes from the MUX.
- Data input comes from ALU output.

### 4. Instruction Register (IR)
- Latches instruction fetched from memory.
- Instruction format:
  
[7:5] Opcode

[4:0] Address / Operand
- Opcode is type-cast into `opcode_t`.

### 5. Accumulator Register (AC)
- Stores intermediate and final results.
- Loaded from ALU output when `load_ac` is asserted.

### 6. Arithmetic Logic Unit (ALU)
- Performs arithmetic and logical operations.
- Inputs:
  - Accumulator value
  - Memory data
  - Opcode
- Output:
  - Result to accumulator or memory
  - `zero` flag for conditional operations

### 7. Control Unit
- Decodes opcode and status flags.
- Generates all control signals:
  - `mem_rd`, `mem_wr`
  - `load_ir`, `load_ac`, `load_pc`
  - `inc_pc`
  - `halt`
- Operates on a separate control clock.

---

## Instruction Execution Flow

If all components operate correctly, the CPU performs:

1. **Fetch**
   - PC → Memory
   - Instruction loaded into IR

2. **Decode**
   - Opcode decoded by control unit

3. **Operand Fetch (if required)**
   - Address field → Memory
   - Data read into ALU input

4. **Execute**
   - ALU performs operation
   - Flags updated

5. **Write Back**
   - Result stored in Accumulator or Memory

This cycle repeats until a **HLT** instruction is encountered.

---

## Opcode Encoding and Operations

| Opcode | Encoding | CPU Operation | Description |
|------|---------|---------------|------------|
| HLT  | `000` | Halt | Stops CPU execution |
| SKZ  | `001` | Skip if Zero | Skips next instruction if zero flag is set |
| ADD  | `010` | Add | `AC ← AC + MEM[addr]` |
| AND  | `011` | AND | `AC ← AC & MEM[addr]` |
| XOR  | `100` | XOR | `AC ← AC ^ MEM[addr]` |
| LDA  | `101` | Load Accumulator | `AC ← MEM[addr]` |
| STO  | `110` | Store Accumulator | `MEM[addr] ← AC` |
| JMP  | `111` | Jump | `PC ← addr` |

---

## Control Outputs and Their Functions

| Control Signal | Function |
|---------------|----------|
| `mem_rd` | Enables memory read |
| `mem_wr` | Enables memory write |
| `load_ir` | Loads instruction into IR |
| `load_ac` | Loads ALU result into accumulator |
| `load_pc` | Loads PC with jump address |
| `inc_pc` | Increments PC |
| `halt` | Stops CPU execution |
| `fetch` | Selects PC address via MUX |

---

## Clocking Strategy

- **Control Clock (`cntrl_clk`)**
  - Drives FSM-based control logic
- **ALU Clock (`alu_clk`)**
  - Synchronizes ALU output updates
- **System Clock (`clk`)**
  - Used for registers and program counter

This separation improves clarity between **control sequencing** and **datapath operations**.

---

## Author
**Aryan Mahajan**  
Hardware / VLSI Enthusiast  
RTL Design | FSM | CPU Microarchitecture
