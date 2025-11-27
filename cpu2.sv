
module cpu import typedefs ::*;
(
 output logic halt,
 output logic load_ir,
 input  logic fetch,
 input  logic cntrl_clk,
 input  logic alu_clk,
 input  logic clk,
 input  logic rst_ 
);

 logic mem_rd, inc_pc, load_ac, load_pc, mem_wr, zero;
 opcode_t opcode;
 logic [7:0] alu_out, data_out, accum;
 logic [4:0] addr; 
 logic [7:0] ir_out;
 logic [4:0] pc_addr, ir_addr;

 control 
controller(
   .mem_rd  (mem_rd),
   .load_ir (load_ir),
   .halt    (halt),
   .inc_pc  (inc_pc),
   .load_ac (load_ac),
   .load_pc (load_pc),
   .mem_wr  (mem_wr),
   .opcode  (opcode),              // input
   .zero    (zero),                //input
   .clk     (cntrl_clk),           // ctrl clk
   .rst_    (rst_)
);


mem mem1(
        .clk  (~cntrl_clk),       //~ctrl clk
	.read (mem_rd),           // input
	.write  (mem_wr),         //input 
	.addr   (addr) ,          // input
	.data_in (alu_out)  ,     //input
        .data_out (data_out)
	   );

alu  unit
 (
  .out    (alu_out),
  .zero   (zero),   
  .accum  (accum),                // input
  .data   (data_out),             // input
  .opcode (opcode),               // input 
  .clk    (alu_clk) 
 );


 register  accumulator     
(
                               .out (accum),  
                               .data (alu_out),      //input
                               .load    (load_ac),   // input  
                               .aresetn  (rst_),     
                               .clock   (clk)
                              );


 register  instruction_register   
(
                               .out (ir_out),  
                               .data (data_out),      //input  // getting address from memory
                               .load    (load_ir),   // input  
                               .aresetn  (rst_),     
                               .clock   (clk)
 );

//assign opcode =  (ir_out[7:5]);
assign opcode =  opcode_t'(ir_out[7:5]);
assign ir_addr = ir_out[4:0];                             

counter program_counter
(
                               .count  (pc_addr),                          
                               .data   (ir_addr),     // input  // instruction_reg, ka address   // program address ke liye ya program initialise
                               .load   (load_pc),        // input
                               .enable (inc_pc),        // input
                               .aresetn (rst_),
                               .clock   (clk)
                              );

scale_mux addr_mux
 (
  .out (addr),
  .in_a (pc_addr),
  .in_b (ir_addr), 
  .sel_a (fetch));

endmodule
