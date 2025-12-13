
module top_cpu
  import typedefs::*;
(
  output logic halt,
  output logic load_ir,

  input  logic fetch,
  input  logic cntrl_clk,
  input  logic alu_clk,
  input  logic clk,
  input  logic rst_
);

  // -------------------------------------------------
  // Internal signals
  // -------------------------------------------------
  logic      mem_rd;
  logic      inc_pc;
  logic      load_ac;
  logic      load_pc;
  logic      mem_wr;
  logic      zero;

  opcode_t   opcode;

  logic [7:0] alu_out;
  logic [7:0] data_out;
  logic [7:0] accum;
  logic [7:0] ir_out;

  logic [4:0] addr;
  logic [4:0] pc_addr;
  logic [4:0] ir_addr;

  // -------------------------------------------------
  // Control Unit
  // -------------------------------------------------
  controller u_controller (
    .mem_rd  (mem_rd),
    .load_ir (load_ir),
    .halt    (halt),
    .inc_pc  (inc_pc),
    .load_ac (load_ac),
    .load_pc (load_pc),
    .mem_wr  (mem_wr),
    .opcode  (opcode),
    .zero    (zero),
    .clk     (cntrl_clk),
    .rst_    (rst_)
  );

  // -------------------------------------------------
  // Memory
  // -------------------------------------------------
  internal_mem mem1 (
    .clk      (~cntrl_clk),
    .read     (mem_rd),
    .write    (mem_wr),
    .addr     (addr),
    .data_in  (alu_out),
    .data_out (data_out)
  );

  // -------------------------------------------------
  // ALU
  // -------------------------------------------------
  alu u_alu (
    .out    (alu_out),
    .zero   (zero),
    .accum  (accum),
    .data   (data_out),
    .opcode (opcode),
    .clk    (alu_clk)
  );

  // -------------------------------------------------
  // Accumulator Register
  // -------------------------------------------------
  register accumulator (
    .out     (accum),
    .data    (alu_out),
    .load    (load_ac),
    .aresetn (rst_),
    .clock   (clk)
  );

  // -------------------------------------------------
  // Instruction Register
  // -------------------------------------------------
  register instruction_register (
    .out     (ir_out),
    .data    (data_out),
    .load    (load_ir),
    .aresetn (rst_),
    .clock   (clk)
  );

  // -------------------------------------------------
  // Opcode and Address Decode
  // -------------------------------------------------
  always_comb begin
    opcode  = opcode_t'(ir_out[7:5]);
    ir_addr = ir_out[4:0];
  end

  // -------------------------------------------------
  // Program Counter
  // -------------------------------------------------
  counter program_counter (
    .count   (pc_addr),
    .data    (ir_addr),
    .load    (load_pc),
    .enable  (inc_pc),
    .aresetn (rst_),
    .clock   (clk)
  );

  // -------------------------------------------------
  // Address MUX
  // -------------------------------------------------
  multiplexer addr_mux (
    .out   (addr),
    .in_a  (pc_addr),
    .in_b  (ir_addr),
    .sel_a (fetch)
  );

endmodule : top_cpu


