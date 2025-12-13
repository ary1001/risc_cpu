## Simulation and Verification

### Verification Strategy
The CPU design is verified using a **self-checking SystemVerilog testbench**
(`cpu_test.sv`) executed in **ModelSim**.

Verification is based on executing diagnostic programs and validating:
- Correct instruction sequencing
- Proper control signal generation
- Accurate Program Counter behavior
- Correct halting conditions

The testbench automatically determines **PASS/FAIL** for each test.

---

### Testbench Operation Flow

1. The testbench prompts the user to select a diagnostic test.
2. The selected microcode (`.dat`) file is loaded into memory.
3. The CPU is reset and execution begins.
4. Debug messages are printed during execution.
5. The testbench waits for the CPU to assert the `halt` signal.
6. When `halt` is asserted:
   - The Program Counter (`pc_addr`) is checked.
   - If the PC matches the expected value → **TEST PASSED**
   - Otherwise → **TEST FAILED**
7. The testbench returns to test selection.

---

### Diagnostic Programs

### Diagnostic Test 1 – Basic Instruction Test
**Program:** `CPUtest1.dat`  
**Purpose:** Verifies basic VeriRISC instructions  
**Expected Halt Address:** `0x17`

Instructions tested:
- LDA
- ADD
- AND
- XOR
- STO
- JMP
- HLT

**Pass Condition:**  
CPU asserts `halt` with `pc_addr == 0x17`

---

### Diagnostic Test 2 – Advanced Instruction Test
**Program:** `CPUtest2.dat`  
**Purpose:** Verifies advanced control and instruction sequencing  
**Expected Halt Address:** `0x10`

**Pass Condition:**  
CPU asserts `halt` with `pc_addr == 0x10`

---

### Diagnostic Test 3 – Fibonacci Program
**Program:** `CPUtest3.dat`  
**Purpose:** Computes Fibonacci sequence from 0 to 144 and stores results in memory  
**Expected Halt Address:** `0x0C`

**Pass Condition:**  
CPU asserts `halt` with `pc_addr == 0x0C`



