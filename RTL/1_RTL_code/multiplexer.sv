
module multiplexer
  import typedefs::*;
(
  output logic [BC_SIZE-1:0] out,
  input  logic [BC_SIZE-1:0] in_a,
  input  logic [BC_SIZE-1:0] in_b,
  input  const               sel_a
);

  // -------------------------------------------------
  // Combinational MUX
  // -------------------------------------------------
  always_comb begin : mux
    unique case (sel_a)
      S0      : out = in_b;
      S1      : out = in_a;
      default : out = 'x;
    endcase
  end : mux

endmodule : multiplexer


