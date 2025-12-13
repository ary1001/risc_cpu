

module control 
import typedefs ::*;
(
   output logic mem_rd,
   output logic load_ir,
   output logic halt,
   output logic inc_pc,
   output logic load_ac,
   output logic load_pc,
   output logic mem_wr,
   input  opcode_t  opcode,
   input  logic zero,
   input  logic clk,
   input  logic rst_
);

   state_t p_state;
   state_t n_state;
   logic [6:0] out ;
   
   //assign  {mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr} = out;

   always_ff @(posedge clk or negedge rst_)
     begin
        if (~rst_) 
             p_state <= INST_ADDR;
        else
             p_state <= n_state;  
     end




    always_comb
    begin
       unique case (p_state)
           
           INST_ADDR  :  n_state = INST_FETCH;
           INST_FETCH :  n_state = INST_LOAD; 
           INST_LOAD  :  n_state = IDLE;  
           IDLE       :  n_state = OP_ADDR; 
           OP_ADDR    :  n_state = OP_FETCH;  
           OP_FETCH   :  n_state = ALU_OP;  
           ALU_OP     :  n_state = STORE;  
           STORE      :  n_state = INST_ADDR;
      endcase
    end



    always_comb
    begin
       out = '0;
      // {mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr} = out;
       unique case (p_state)
           
           INST_ADDR       :  out                = '0;
           INST_FETCH      :  out[6]             = '1; 
           INST_LOAD,IDLE  :  out[6:5]           = '1;  
           OP_ADDR         :  out[4:3]           = {opcode inside {HLT}, '1};   
           OP_FETCH        :  out[6]             = opcode inside {ADD, AND, XOR, LDA};  
           ALU_OP          :  {out[6], out[3:1]} = {opcode inside {ADD, AND, XOR, LDA}, (opcode == SKZ) & zero, opcode inside {ADD, AND, XOR, LDA}, opcode == JMP};    
           STORE           :  {out[6], out[3:0]} = {opcode inside {ADD, AND, XOR, LDA},  opcode == JMP        , opcode inside {ADD, AND, XOR, LDA}, opcode == JMP, opcode == STO}; 
           default: out = '0;
      endcase
             {mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr} = out;
    end

endmodule : control
