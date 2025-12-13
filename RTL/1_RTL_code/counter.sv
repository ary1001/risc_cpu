

//Behavioural modelling of synchronous 4-bit binary counter with parallel load
module counter 
import typedefs ::*; 
(
                               output logic [BC_SIZE-1:0] count,  
                               input  logic [BC_SIZE-1:0] data,   
                               input  logic               load,    
                               input  logic               enable, 
                               input  logic               aresetn,
                               input  logic               clock
                              );

always_ff @(posedge clock or negedge aresetn)
begin : block_a
  if (~aresetn)  count <= '0;

  else if (load)        count <= data;

  else if (enable)         count <= count + 1'b1;

  else;
end : block_a
endmodule
