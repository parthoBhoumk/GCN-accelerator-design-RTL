globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}


addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 7.6 -inRowOffset 2 -prefix WELLTAP


addRing -nets {VDD VSS} -around default_power_domain -center 1 -width 1.224 -spacing 0.5 -layer {left M3 right M3 bottom M2 top M2}


sroute -connect { blockPin padPin padRing corePin floatingStripe } -nets {VDD VSS } -layerChangeRange { M1 M3 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 Pad } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 Pad }




//this is for inputs pin assignment only
// you have to assign output pins manually from gui

editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 6 -spreadType side -pin {clk reset start data_in[0] data_in[1] data_in[2] data_in[3] data_in[4] data_in[5] data_in[6] data_in[7] data_in[8] data_in[9] data_in[10] data_in[11] data_in[12] data_in[13] data_in[14] data_in[15] data_in[16] data_in[17] data_in[18] data_in[19] data_in[20] data_in[21] data_in[22] data_in[23] data_in[24] data_in[25] data_in[26] data_in[27] data_in[28] data_in[29] data_in[30] data_in[31] data_in[32] data_in[33] data_in[34] data_in[35] data_in[36] data_in[37] data_in[38] data_in[39] data_in[40] data_in[41] data_in[42] data_in[43] data_in[44] data_in[45] data_in[46] data_in[47] data_in[48] data_in[49] data_in[50] data_in[51] data_in[52] data_in[53] data_in[54] data_in[55] data_in[56] data_in[57] data_in[58] data_in[59] data_in[60] data_in[61] data_in[62] data_in[63] data_in[64] data_in[65] data_in[66] data_in[67] data_in[68] data_in[69] data_in[70] data_in[71] data_in[72] data_in[73] data_in[74] data_in[75] data_in[76] data_in[77] data_in[78] data_in[79] data_in[80] data_in[81] data_in[82] data_in[83] data_in[84] data_in[85] data_in[86] data_in[87] data_in[88] data_in[89] data_in[90] data_in[91] data_in[92] data_in[93] data_in[94] data_in[95] data_in[96] data_in[97] data_in[98] data_in[99] data_in[100] data_in[101] data_in[102] data_in[103] data_in[104] data_in[105] data_in[106] data_in[107] data_in[108] data_in[109] data_in[110] data_in[111] data_in[112] data_in[113] data_in[114] data_in[115] data_in[116] data_in[117] data_in[118] data_in[119] data_in[120] data_in[121] data_in[122] data_in[123] data_in[124] data_in[125] data_in[126] data_in[127] data_in[128] data_in[129] data_in[130] data_in[131] data_in[132] data_in[133] data_in[134] data_in[135] data_in[136] data_in[137] data_in[138] data_in[139] data_in[140] data_in[141] data_in[142] data_in[143] data_in[144] data_in[145] data_in[146] data_in[147] data_in[148] data_in[149] data_in[150] data_in[151] data_in[152] data_in[153] data_in[154] data_in[155] data_in[156] data_in[157] data_in[158] data_in[159]}

editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 1 -layer 5 -spreadType side -pin {data_in[160] data_in[161] data_in[162] data_in[163] data_in[164] data_in[165] data_in[166] data_in[167] data_in[168] data_in[169] data_in[170] data_in[171] data_in[172] data_in[173] data_in[174] data_in[175] data_in[176] data_in[177] data_in[178] data_in[179] data_in[180] data_in[181] data_in[182] data_in[183] data_in[184] data_in[185] data_in[186] data_in[187] data_in[188] data_in[189] data_in[190] data_in[191] data_in[192] data_in[193] data_in[194] data_in[195] data_in[196] data_in[197] data_in[198] data_in[199] data_in[200] data_in[201] data_in[202] data_in[203] data_in[204] data_in[205] data_in[206] data_in[207] data_in[208] data_in[209] data_in[210] data_in[211] data_in[212] data_in[213] data_in[214] data_in[215] data_in[216] data_in[217] data_in[218] data_in[219] data_in[220] data_in[221] data_in[222] data_in[223] data_in[224] data_in[225] data_in[226] data_in[227] data_in[228] data_in[229] data_in[230] data_in[231] data_in[232] data_in[233] data_in[234] data_in[235] data_in[236] data_in[237] data_in[238] data_in[239] data_in[240] data_in[241] data_in[242] data_in[243] data_in[244] data_in[245] data_in[246] data_in[247] data_in[248] data_in[249] data_in[250] data_in[251] data_in[252] data_in[253] data_in[254] data_in[255] data_in[256] data_in[257] data_in[258] data_in[259] data_in[260] data_in[261] data_in[262] data_in[263] data_in[264] data_in[265] data_in[266] data_in[267] data_in[268] data_in[269] data_in[270] data_in[271] data_in[272] data_in[273] data_in[274] data_in[275] data_in[276] data_in[277] data_in[278] data_in[279] data_in[280] data_in[281] data_in[282] data_in[283] data_in[284] data_in[285] data_in[286] data_in[287] data_in[288] data_in[289] data_in[290] data_in[291] data_in[292] data_in[293] data_in[294] data_in[295] data_in[296] data_in[297] data_in[298] data_in[299] data_in[300] data_in[301] data_in[302] data_in[303] data_in[304] data_in[305] data_in[306] data_in[307] data_in[308] data_in[309] data_in[310] data_in[311] data_in[312] data_in[313] data_in[314] data_in[315] data_in[316] data_in[317] data_in[318] data_in[319] data_in[320] data_in[321] data_in[322]}

editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 3 -layer 5 -spreadType side -pin {data_in[323] data_in[324] data_in[325] data_in[326] data_in[327] data_in[328] data_in[329] data_in[330] data_in[331] data_in[332] data_in[333] data_in[334] data_in[335] data_in[336] data_in[337] data_in[338] data_in[339] data_in[340] data_in[341] data_in[342] data_in[343] data_in[344] data_in[345] data_in[346] data_in[347] data_in[348] data_in[349] data_in[350] data_in[351] data_in[352] data_in[353] data_in[354] data_in[355] data_in[356] data_in[357] data_in[358] data_in[359] data_in[360] data_in[361] data_in[362] data_in[363] data_in[364] data_in[365] data_in[366] data_in[367] data_in[368] data_in[369] data_in[370] data_in[371] data_in[372] data_in[373] data_in[374] data_in[375] data_in[376] data_in[377] data_in[378] data_in[379] data_in[380] data_in[381] data_in[382] data_in[383] data_in[384] data_in[385] data_in[386] data_in[387] data_in[388] data_in[389] data_in[390] data_in[391] data_in[392] data_in[393] data_in[394] data_in[395] data_in[396] data_in[397] data_in[398] data_in[399] data_in[400] data_in[401] data_in[402] data_in[403] data_in[404] data_in[405] data_in[406] data_in[407] data_in[408] data_in[409] data_in[410] data_in[411] data_in[412] data_in[413] data_in[414] data_in[415] data_in[416] data_in[417] data_in[418] data_in[419] data_in[420] data_in[421] data_in[422] data_in[423] data_in[424] data_in[425] data_in[426] data_in[427] data_in[428] data_in[429] data_in[430] data_in[431] data_in[432] data_in[433] data_in[434] data_in[435] data_in[436] data_in[437] data_in[438] data_in[439] data_in[440] data_in[441] data_in[442] data_in[443] data_in[444] data_in[445] data_in[446] data_in[447] data_in[448] data_in[449] data_in[450] data_in[451] data_in[452] data_in[453] data_in[454] data_in[455] data_in[456] data_in[457] data_in[458] data_in[459] data_in[460] data_in[461] data_in[462] data_in[463] data_in[464] data_in[465] data_in[466] data_in[467] data_in[468] data_in[469] data_in[470] data_in[471] data_in[472] data_in[473] data_in[474] data_in[475] data_in[476] data_in[477] data_in[478] data_in[479] coo_in[0] coo_in[1] coo_in[2] coo_in[3] coo_in[4] coo_in[5]}


//step7

setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_reorder_scan false
setPlaceMode -place_global_cong_effort low
place_opt_design


optDesign -preCTS

/////step8
setNanoRouteMode -drouteMinimizeLithoEffectOnLayer { f t t t t t t t t t} \
-routeTopRoutingLayer 6 -routeBottomRoutingLayer 1 \
-routeWithViaInPin true


set_ccopt_property buffer_cells {BUFx10_ASAP7_75t_R BUFx12_ASAP7_75t_R
BUFx12f_ASAP7_75t_R BUFx16f_ASAP7_75t_R BUFx24_ASAP7_75t_R
BUFx2_ASAP7_75t_R BUFx3_ASAP7_75t_R BUFx4_ASAP7_75t_R
BUFx5_ASAP7_75t_R BUFx4f_ASAP7_75t_R BUFx6f_ASAP7_75t_R
BUFx8_ASAP7_75t_R HB1xp67_ASAP7_75t_R HB2xp67_ASAP7_75t_R}

set_ccopt_property inverter_cells {INVx11_ASAP7_75t_R
INVx13_ASAP7_75t_R INVx1_ASAP7_75t_R INVx2_ASAP7_75t_R
INVx3_ASAP7_75t_R INVx4_ASAP7_75t_R INVx5_ASAP7_75t_R
INVx6_ASAP7_75t_R INVx8_ASAP7_75t_R INVxp67_ASAP7_75t_R
INVxp33_ASAP7_75t_R}

set_ccopt_property target_max_trans 100ps
set_ccopt_property target_skew 30ps
set_ccopt_property -max_fanout 16

ccopt_design -outDir ./cts/

timeDesign -postCTS -expandedViews -outDir ./cts/timing/

report_ccopt_clock_trees -filename ./cts/clock_trees.rpt
report_ccopt_skew_groups -filename ./cts/skew_groups.rpt

///////step9
optDesign -postCTS -hold

///////step10
setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {t t t t t t t t t t}

setNanoRouteMode -routeWithViaInPin true -routeDesignFixClockNets true -routeTopRoutingLayer 6
setNanoRouteMode -quiet -drouteFixAntenna 0
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

verifyConnectivity
verify_drc

// if violations 
editDeleteViolations
globalDetailRoute

//check again

verifyConnectivity
verify_drc

setAnalysisMode -analysisType onchipvariation
optDesign -postroute -hold

verifyConnectivity
verify_drc

editDeleteViolations
globalDetailRoute

verifyConnectivity
 verify_drc

// step 13

saveNetlist GCN.apr.v -excludeLeafCell -excludeCellInst {FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R}
saveNetlist GCN.apr_pg.v -includePowerGround -excludeLeafCell –excludeCellInst {FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R}




reportClockTree -clk clk -report *.ctsrpt
