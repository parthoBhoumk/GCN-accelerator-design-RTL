module combinational
#(
parameter FEATURE_ROWS = 6,
    parameter WEIGHT_COLS = 3,
    parameter DOT_PROD_WIDTH = 16,
    parameter WEIGHT_WIDTH = $clog2(WEIGHT_COLS),
    parameter FEATURE_WIDTH = $clog2(FEATURE_ROWS)

)
(
    input logic clk,
    input logic rst,
    input logic [2:0]coo_in[0:1],
    input logic done_trans,
    input logic [DOT_PROD_WIDTH - 1:0] FWrowIN  [0:WEIGHT_COLS-1],
    input logic [DOT_PROD_WIDTH - 1:0] AdjIN [0:WEIGHT_COLS-1],

    output logic [FEATURE_WIDTH - 1:0] destination,
    output logic [DOT_PROD_WIDTH - 1:0] temporary_row  [0:WEIGHT_COLS-1],
    output logic [2:0]coo_address,
    output logic done_comb,
    output logic [FEATURE_WIDTH - 1:0] source

);

logic task_;
logic [2:0] coo_count; 
logic [4:0] iter;

always_ff @(posedge clk or posedge rst) begin

            if(rst) begin
            
            
            coo_count <= 0;
            done_comb <= 0;
            iter <= 0;
            task_ <=0;
            end
            else if( done_trans == 0) begin
            coo_count <= 0;
            //done_comb <= 0;
            iter <= 0;
            task_ <=0;  
             end

            else if(done_trans == 1)  begin
            coo_count <= (coo_count==5) ? 0: coo_count + 1; 
            iter <= iter + 1;
            if (coo_count == 5) begin
                task_ <= 1;
            end
                if (iter== 11) begin
                done_comb <= 1'b1;
                end
            
            end 

end

assign source = (task_) ?  (coo_in[0] - 1) : (coo_in[1] -1);
assign destination = (task_) ?  (coo_in[1] -1) : (coo_in[0] -1);

assign  temporary_row[0] = FWrowIN[0] +  AdjIN[0];
assign  temporary_row[1] = FWrowIN[1] +  AdjIN[1];
assign  temporary_row[2] = FWrowIN[2] +  AdjIN[2];


assign coo_address = coo_count;

endmodule
