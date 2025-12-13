
module alu
  import typedefs::*;  
 (
  output logic [7:0] out,
  output logic       zero,       //carry, zero flag
  input  logic [7:0]  accum,
  input  logic [7:0]  data,
  input  opcode_t    opcode,
  input  logic        clk 
 );


  always_ff @(negedge clk)
     begin
        unique case(opcode)
        HLT : out <=   accum;
        SKZ : out <=   accum;
        ADD : out <=   accum + data;
        AND : out <=   accum & data;
        XOR : out <=   accum ^ data;
        LDA : out <=   data;
        STO : out <=   accum;
        JMP : out <=   accum; 
        endcase 
     end

 always_comb
  zero = (accum == '0);

endmodule : alu
