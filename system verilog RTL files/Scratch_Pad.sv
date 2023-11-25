
module Scratch_Pad 
  #(parameter WEIGHT_ROWS = 96,
    parameter WEIGHT_WIDTH = 5
)

(
  input logic clk,
  input logic reset,
  input logic write_enable,
  input wire [WEIGHT_WIDTH-1:0] weight_col_in [0:WEIGHT_ROWS-1],
  output logic [WEIGHT_WIDTH-1:0] weight_col_out [0:WEIGHT_ROWS-1]
);

 logic [WEIGHT_WIDTH-1:0] memory [0:WEIGHT_ROWS-1];

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin 
       for (int i = 0; i < WEIGHT_ROWS; i = i + 1) begin
          memory[i] <= '0;
       end
    end
    else if (write_enable) begin
      memory <= weight_col_in;
    end
  end

  assign weight_col_out = memory;

endmodule