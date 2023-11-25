module featureCNT

  #(
    parameter FEATURE_ROWS = 6,
    parameter COUNTER_FEATURE_WIDTH = $clog2(FEATURE_ROWS)
    )

(
input logic clk,
input logic rst,
input logic enable,
output logic [COUNTER_FEATURE_WIDTH-1:0] feature_count_new
);


always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset count to 0 on reset
            feature_count_new <= 0;
            end

        else if (enable) begin

            if(feature_count_new == FEATURE_ROWS - 1) begin

               feature_count_new <= 0;
            end

            else begin
            feature_count_new <= feature_count_new + 1; 
        end
    end
end

endmodule
