module vectormul

#(
    parameter WEIGHT_ROWS = 96,
    parameter WEIGHT_WIDTH = 5,
    parameter DOT_PROD_WIDTH = 16

)
(
  input logic [WEIGHT_WIDTH-1:0] weight_line [0:WEIGHT_ROWS-1],
  input logic [WEIGHT_WIDTH-1:0] feature_line [0:WEIGHT_ROWS-1],
  
  output logic [DOT_PROD_WIDTH - 1:0] mul_out

);


logic [DOT_PROD_WIDTH - 1:0]temporary_product [0:WEIGHT_ROWS-1];
logic [DOT_PROD_WIDTH - 1:0]intermediate_summed_product [0:7];

always_comb begin

for ( int i = 0; i < WEIGHT_ROWS ; i = i+1 ) begin

    temporary_product[i] = weight_line[i] * feature_line[i];

end



intermediate_summed_product[0] = temporary_product[0] + temporary_product[1] + temporary_product[2] + temporary_product[3] + temporary_product[4] + temporary_product[5]
                                     +temporary_product[6] + temporary_product[7] + temporary_product[8] + temporary_product[9] + temporary_product[10] + temporary_product[11] ;

intermediate_summed_product[1] = temporary_product[12] + temporary_product[13] + temporary_product[14] + temporary_product[15] + temporary_product[16] + temporary_product[17]
                                     +temporary_product[18] + temporary_product[19] + temporary_product[20] + temporary_product[21] + temporary_product[22] + temporary_product[23] ;

intermediate_summed_product[2] = temporary_product[24] + 
temporary_product[25] +
 temporary_product[26] + 
 temporary_product[27] + 
 temporary_product[28] +
temporary_product[29] + 
temporary_product[30] + 
temporary_product[31] + 
temporary_product[32] + 
temporary_product[33] + 
temporary_product[34] + 
temporary_product[35] ;



intermediate_summed_product[3] = temporary_product[36] + 
temporary_product[37] + 
temporary_product[38] + 
temporary_product[39] + 
temporary_product[40] + 
temporary_product[41] + 
temporary_product[42] + 
temporary_product[43] + 
temporary_product[44] + 
temporary_product[45] + 
temporary_product[46] + 
temporary_product[47] ;

intermediate_summed_product[4] = temporary_product[48] + 
temporary_product[49] + 
temporary_product[50] + 
temporary_product[51] + 
temporary_product[52] + 
temporary_product[53] + 
temporary_product[54] + 
temporary_product[55] + 
temporary_product[56] + 
temporary_product[57] + 
temporary_product[58] + 
temporary_product[59];

intermediate_summed_product[5] = temporary_product[60] + 
temporary_product[61] + 
temporary_product[62] + 
temporary_product[63] + 
temporary_product[64] + 
temporary_product[65] + 
temporary_product[66] + 
temporary_product[67] + 
temporary_product[68] + 
temporary_product[69] + 
temporary_product[70] + 
temporary_product[71] ;
intermediate_summed_product[6] = temporary_product[72] + 
temporary_product[73] + 
temporary_product[74] + 
temporary_product[75] + 
temporary_product[76] + 
temporary_product[77] + 
temporary_product[78] + 
temporary_product[79] + 
temporary_product[80] + 
temporary_product[81] + 
temporary_product[82] + 
temporary_product[83] ;
intermediate_summed_product[7] = temporary_product[84] + 
temporary_product[85] + 
temporary_product[86] + 
temporary_product[87] + 
temporary_product[88] + 
temporary_product[89] + 
temporary_product[90] + 
temporary_product[91] + 
temporary_product[92] + 
temporary_product[93] + 
temporary_product[94] +
temporary_product[95] ;

mul_out = intermediate_summed_product[0] + 
intermediate_summed_product[1] + 
intermediate_summed_product[2] + 
intermediate_summed_product[3] + 
intermediate_summed_product[4] + 
intermediate_summed_product[5] + 
intermediate_summed_product[6] + 
intermediate_summed_product[7] ;

end 

endmodule
