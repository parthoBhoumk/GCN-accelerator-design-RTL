module read_address
#(
parameter WEIGHT_COLS = 3,
parameter COUNTER_WEIGHT_WIDTH = $clog2(WEIGHT_COLS),
parameter FEATURE_ROWS = 6,
parameter COUNTER_FEATURE_WIDTH = $clog2(FEATURE_ROWS)

)
(

input logic enable_feature,    //equal to read_feature_or_weight
input logic [COUNTER_FEATURE_WIDTH-1:0] feature_count,
input logic [COUNTER_WEIGHT_WIDTH-1:0] weight_count,

output logic  [12 : 0]read_address

);




always_comb begin

if(enable_feature) begin
    read_address = feature_count + 512;

    end

else begin

    read_address = weight_count;
    end
end

endmodule
