module Matrix_FM_WM_ADJ_Memory 
  #(parameter FEATURE_ROWS = 6,
    parameter WEIGHT_COLS = 3,
    parameter DOT_PROD_WIDTH = 16,
    parameter WEIGHT_WIDTH = $clog2(WEIGHT_COLS),
    parameter FEATURE_WIDTH = $clog2(FEATURE_ROWS)
)
(
    input logic clk,
    input logic rst,
    input logic [FEATURE_WIDTH-1:0] write_row,
    input logic [FEATURE_WIDTH-1:0] read_row,
    input logic wr_en,
    input logic [DOT_PROD_WIDTH - 1:0] fm_wm_adj_row_in [0:WEIGHT_COLS-1],
    output logic [DOT_PROD_WIDTH - 1:0] fm_wm_adj_out [0:WEIGHT_COLS-1]
);

    
    // Declare memory array to store matrix data
    logic [DOT_PROD_WIDTH - 1:0] mem  [0:FEATURE_ROWS-1][0:WEIGHT_COLS-1];

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset memory to 0 on reset
	    for (int i = 0; i < WEIGHT_COLS; i = i + 1) begin
		for (int j = 0; j < FEATURE_ROWS; j = j + 1) begin
          	    mem [j][i] <= '0;
 		end 
            end
        end else if (wr_en) begin
            // Write data to memory at the specified row
            mem[write_row][0: WEIGHT_COLS - 1] <= fm_wm_adj_row_in[0: WEIGHT_COLS - 1];

        end
    end

    assign fm_wm_adj_out = mem[read_row];
endmodule