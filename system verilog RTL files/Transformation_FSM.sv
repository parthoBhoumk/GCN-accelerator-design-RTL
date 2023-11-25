
module Transformation_FSM 
  #(parameter FEATURE_ROWS = 6,
    parameter WEIGHT_COLS = 3,
    parameter COUNTER_WEIGHT_WIDTH = $clog2(WEIGHT_COLS),
    parameter COUNTER_FEATURE_WIDTH = $clog2(FEATURE_ROWS))
(
  input logic clk,
  input logic reset,
  input logic [COUNTER_WEIGHT_WIDTH-1:0] weight_count,
  input logic [COUNTER_FEATURE_WIDTH-1:0] feature_count,
  input logic start,


  output logic enable_write_fm_wm_prod,
  output logic enable_read,
  output logic enable_write,
  output logic enable_scratch_pad,
  output logic enable_weight_counter,
  output logic enable_feature_counter,
  output logic read_feature_or_weight, 
  output logic done
);

  typedef enum logic [2:0] {
	START,
    	READ_WEIGHT_DATA,
    	INCREMENT_WEIGHT_COUNTER,
	READ_FEATURE_DATA,
	INCREMENT_FEATURE_COUNTER,
	DONE
  } state_t;

  state_t current_state, next_state;

  always_ff @(posedge clk or posedge reset)
    if (reset)
      current_state <= START;
    else
      current_state <= next_state;

  always_comb begin
    case (current_state)

      START: begin
		enable_write_fm_wm_prod = 1'b0;
        	enable_read = 1'b0;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b0;
		enable_weight_counter = 1'b0;
		enable_feature_counter = 1'b0;
		read_feature_or_weight = 1'b0; 
		done = 1'b0;

		if (start) begin
			next_state = READ_WEIGHT_DATA;
		end 
		else begin 
			next_state = START;
		end 
        	
      end

      READ_WEIGHT_DATA: begin
		enable_write_fm_wm_prod = 1'b0;
		enable_read = 1'b1;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b1;
		enable_weight_counter = 1'b0;
		enable_feature_counter = 1'b0;
		read_feature_or_weight=  1'b0; 
		done = 1'b0;

		next_state = READ_FEATURE_DATA;
      end

      INCREMENT_WEIGHT_COUNTER: begin
		enable_write_fm_wm_prod = 1'b0;
        	enable_read = 1'b0;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b0;
		enable_weight_counter = 1'b1;
		enable_feature_counter = 1'b0;
		read_feature_or_weight=  1'b0; 
		done = 1'b0;

        	next_state = READ_WEIGHT_DATA;
      end

      READ_FEATURE_DATA: begin
		enable_write_fm_wm_prod = 1'b0;
        	enable_read = 1'b1;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b0;
		enable_weight_counter = 1'b0;
		enable_feature_counter = 1'b0;
		read_feature_or_weight = 1'b1; 
		done = 1'b0;

        	next_state = INCREMENT_FEATURE_COUNTER;
      end

      INCREMENT_FEATURE_COUNTER: begin
		enable_write_fm_wm_prod = 1'b1;
        	enable_read = 1'b0;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b0;
		enable_weight_counter = 1'b0;
		enable_feature_counter = 1'b1;
		read_feature_or_weight = 1'b1; 
		done = 1'b0;

		if (weight_count == WEIGHT_COLS - 1 && feature_count == FEATURE_ROWS - 1) begin
			next_state = DONE;
		end 
		else if (feature_count == FEATURE_ROWS - 1) begin
			next_state = INCREMENT_WEIGHT_COUNTER;
		end
		else  begin
			next_state = READ_FEATURE_DATA;
		end
      end

      DONE: begin
		enable_write_fm_wm_prod = 1'b0;
        	enable_read = 1'b0;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b0;
		enable_weight_counter = 1'b0;
		enable_feature_counter = 1'b0;
		read_feature_or_weight = 1'b0; 
		done = 1'b1;

		next_state = DONE;
      end

       default : begin
		enable_write_fm_wm_prod = 1'b0;
        	enable_read = 1'b0;
		enable_write = 1'b0;
		enable_scratch_pad = 1'b0;
		enable_weight_counter = 1'b0;
		enable_feature_counter = 1'b0;
		read_feature_or_weight = 1'b0; 
		done = 1'b0;

		next_state = START;
	end

    endcase
  end

endmodule
