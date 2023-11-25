module transformation #(
    parameter FEATURE_COLS = 96,
    parameter WEIGHT_ROWS = 96,
    parameter FEATURE_ROWS = 6,
    parameter WEIGHT_COLS = 3,
    parameter FEATURE_WIDTH = 3,
    parameter WEIGHT_WIDTH = 5,
    parameter DOT_PROD_WIDTH = 16,
    parameter ADDRESS_WIDTH = 13,
    parameter COUNTER_WEIGHT_WIDTH = $clog2(WEIGHT_COLS),
    parameter COUNTER_FEATURE_WIDTH = $clog2(FEATURE_ROWS)
)
(
input logic clk,
input logic reset,
input logic [FEATURE_WIDTH - 1:0] read_row1,
input logic [WEIGHT_WIDTH-1:0] data_in [0:WEIGHT_ROWS-1],
input logic start,

output logic [12:0] read_address,
output logic done_trans,
output logic enable_read,
output logic [DOT_PROD_WIDTH - 1:0] FM_WM_Row_Out [0:WEIGHT_COLS-1]

);

logic enable_weight_counterwire;
logic enable_feature_counterwire;
logic read_feature_or_weightwire;
logic enable_scratch_padwire;
logic enable_writewire;
logic enable_write_fm_wm_prodwire;

logic [COUNTER_FEATURE_WIDTH-1:0]feature_countwire;
logic [COUNTER_WEIGHT_WIDTH-1:0]weight_countwire;
logic [WEIGHT_WIDTH-1:0] weight_linewire [0:WEIGHT_ROWS-1];
logic [DOT_PROD_WIDTH - 1:0]mul_outwire;


Transformation_FSM FSM(
    .clk(clk),
    .reset(reset),
    .weight_count(weight_countwire),
    .feature_count(feature_countwire),
    .start(start),

    .enable_read(enable_read),
    .enable_write(enable_writewire),
    .enable_feature_counter(enable_feature_counterwire),
    .enable_weight_counter(enable_weight_counterwire),
    .read_feature_or_weight(read_feature_or_weightwire),
    .enable_scratch_pad(enable_scratch_padwire),
    .enable_write_fm_wm_prod(enable_write_fm_wm_prodwire),
    .done(done_trans)


);



featureCNT feature(
    .clk(clk),
    .rst(reset),
    .enable(enable_feature_counterwire),
    .feature_count_new(feature_countwire)
    );

weightCNT weight(
    .clk(clk),
    .rst(reset),
    .enable(enable_weight_counterwire),
    .weight_count_new(weight_countwire)
    );

read_address read(

    .enable_feature(read_feature_or_weightwire),
    .feature_count(feature_countwire),
    .weight_count(weight_countwire),
    .read_address(read_address)


);

Scratch_Pad spad(
    .clk(clk),
    .reset(reset),  
    .write_enable(enable_scratch_padwire),
    .weight_col_in(data_in) ,
    .weight_col_out(weight_linewire)

);

vectormul vect(

    .weight_line(weight_linewire),
    .feature_line(data_in),
    .mul_out(mul_outwire)

);

Matrix_FM_WM_Memory fmwm(
    .clk(clk),
    .rst(reset),
    .write_row(feature_countwire),
    .write_col(weight_countwire),
    .wr_en(enable_write_fm_wm_prodwire),
    .read_row(read_row1),
    .fm_wm_row_out(FM_WM_Row_Out),
    .fm_wm_in(mul_outwire)
    );
    
endmodule