module weightCNT #(

    parameter WEIGHT_COLS = 3,
    parameter COUNTER_WEIGHT_WIDTH = $clog2(WEIGHT_COLS)
)
(

input logic clk,
input logic rst,
input logic enable,
output logic [COUNTER_WEIGHT_WIDTH-1:0] weight_count_new

);

always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset count to 0 on reset
            weight_count_new <= 0;
            end

        else if (enable) begin

            if(weight_count_new == WEIGHT_COLS - 1) 
            begin
               weight_count_new <= 0;
            end

            else 
            begin
            weight_count_new <= weight_count_new + 1; 
        end
    end
end

endmodule
