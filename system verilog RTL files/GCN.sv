module GCN
  #(parameter FEATURE_COLS = 96,
    parameter WEIGHT_ROWS = 96,
    parameter FEATURE_ROWS = 6,
    parameter WEIGHT_COLS = 3,
    parameter FEATURE_WIDTH = $clog2(FEATURE_ROWS),
    parameter WEIGHT_WIDTH = 5,
    parameter DOT_PROD_WIDTH = 16,
    parameter ADDRESS_WIDTH = 13,
    parameter COUNTER_WEIGHT_WIDTH = $clog2(WEIGHT_COLS),
    parameter COUNTER_FEATURE_WIDTH = $clog2(FEATURE_ROWS),
    parameter MAX_ADDRESS_WIDTH = 2,
    parameter NUM_OF_NODES = 6,			 
    parameter COO_NUM_OF_COLS = 6,			
    parameter COO_NUM_OF_ROWS = 2,			
    parameter COO_BW = $clog2(COO_NUM_OF_COLS)	
)
(
  input logic clk,	// Clock
  input logic reset,	// Reset 
  input logic start,
  input logic [WEIGHT_WIDTH-1:0] data_in [0:WEIGHT_ROWS-1], //FM and WM Data
  input logic [COO_BW - 1:0] coo_in [0:1], //row 0 and row 1 of the COO Stream

  output logic [COO_BW - 1:0] coo_address, // The column of the COO Matrix 
  output logic [ADDRESS_WIDTH-1:0] read_address, // The Address to read the FM and WM Data
  output logic enable_read, // Enabling the Read of the FM and WM Data
  output logic done, // Done signal indicating that all the calculations have been completed
  output logic [MAX_ADDRESS_WIDTH - 1:0] max_addi_answer [0:FEATURE_ROWS - 1] // The answer to the argmax and matrix multiplication 
); 

logic  [FEATURE_WIDTH - 1:0]read_row_from_comb;
logic done_transwire;
logic done_combwire;
logic [DOT_PROD_WIDTH - 1:0] FWrowINwire  [0:WEIGHT_COLS-1];
logic [DOT_PROD_WIDTH - 1:0] AdjINwire [0:WEIGHT_COLS-1];
logic [DOT_PROD_WIDTH - 1:0] temporary_rowwire  [0:WEIGHT_COLS-1];
logic [FEATURE_WIDTH - 1:0] destinationwire;
logic [2:0]  input_from_arg;

logic [2:0]  input_from_comb;


transformation trans(

 .clk(clk),
 .reset(reset),
 .data_in(data_in),
 .start(start),

 .read_address(read_address),
 .done_trans(done_transwire),
 .enable_read(enable_read),
 .read_row1(read_row_from_comb),
 .FM_WM_Row_Out(FWrowINwire)

);

combinational comb(
 .clk(clk),
 .rst(reset),
 .coo_in(coo_in),
 .done_trans(done_transwire),
 .source(read_row_from_comb),
 .destination(input_from_comb),

 .AdjIN(AdjINwire),
 .FWrowIN(FWrowINwire),

 .temporary_row(temporary_rowwire),
 .coo_address(coo_address),
 .done_comb(done_combwire)

);

Matrix_FM_WM_ADJ_Memory adjfmwm(
    .clk(clk),
    .rst(reset),
    .wr_en((!done_combwire) && done_transwire),       

    .read_row(destinationwire),     
    .fm_wm_adj_out(AdjINwire),

    .write_row(destinationwire),    
    .fm_wm_adj_row_in(temporary_rowwire)

    );


argmax arg(
  .clk(clk),
  .rst(reset),
  .comb_done(done_combwire),
  .row_data(AdjINwire),                 
  .current_row(input_from_arg),         
  .max_addi_answer(max_addi_answer),
  .done(done)

);

assign destinationwire = (done_combwire == 1) ?  input_from_arg : input_from_comb;


endmodule

