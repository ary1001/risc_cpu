

///for controller
package typedefs;

 timeunit 1ns;
 timeprecision 100ps;

  typedef enum bit [1:0] {S[2]} cons;
  parameter BIT_SIZE = 8;
  parameter BC_SIZE  = 5;

 typedef enum bit [2:0] { HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} opcode_t;

 typedef enum bit [2:0] { INST_ADDR, INST_FETCH, INST_LOAD, IDLE, OP_ADDR, OP_FETCH, ALU_OP, STORE } state_t;

endpackage : typedefs
