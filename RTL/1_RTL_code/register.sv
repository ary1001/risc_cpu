
//Behavioural modelling of synchronous 8-bit register with parallel load
module register 
import typedefs::*;     
(
                               output logic [BIT_SIZE-1:0]out,  
                               input  logic [BIT_SIZE-1:0]data,   
                               input  logic               load,     
                               input  logic               aresetn,
                               input  logic               clock
                              );
  //timeunit 1ns;
  //timeprecision 100ps;

always_ff @(posedge clock or negedge aresetn)
begin : block_a
  if (~aresetn)  out <= '0;

  else if (load)          out <= data;

  else;
end : block_a
endmodule
