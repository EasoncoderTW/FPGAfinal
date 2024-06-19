module siluPWL(
	input clk,
	input rst_n,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [3:0] slope, slope_stage_reg;
reg signed [15:0] bias, bias_stage_reg;
reg signed [15:0] x_delta, x_stage_reg;
reg zero, zero_stage_reg;
always @(posedge clk) begin
	if(~rst_n) begin
		slope_stage_reg <= 0;
		bias_stage_reg <= 0;
		x_stage_reg <= 0;
		zero_stage_reg <= 0;
	end else begin
		slope_stage_reg <= slope;
		bias_stage_reg <= bias;
		x_stage_reg <= (x - x_delta);
		zero_stage_reg <= zero;
	end
end
assign y = ((zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> slope_stage_reg)) + bias_stage_reg;

	wire [15:0] compare_slope_0 = (x - 16'hf000); // -8.000000 
	wire [15:0] compare_slope_1 = (x - 16'hfe50); // -0.843750 
	wire [15:0] compare_slope_2 = (x - 16'hff80); // -0.250000 
	wire [15:0] compare_slope_3 = (x - 16'h108); // 0.515625 

	wire [15:0] compare_bias_0 = (x - 16'hf310); // -6.468750 
	wire [15:0] compare_bias_1 = (x - 16'hf558); // -5.328125 
	wire [15:0] compare_bias_2 = (x - 16'hf690); // -4.718750 
	wire [15:0] compare_bias_3 = (x - 16'hf760); // -4.312500 
	wire [15:0] compare_bias_4 = (x - 16'hf808); // -3.984375 
	wire [15:0] compare_bias_5 = (x - 16'hf898); // -3.703125 
	wire [15:0] compare_bias_6 = (x - 16'hf918); // -3.453125 
	wire [15:0] compare_bias_7 = (x - 16'hf988); // -3.234375 
	wire [15:0] compare_bias_8 = (x - 16'hf9f0); // -3.031250 
	wire [15:0] compare_bias_9 = (x - 16'hfa58); // -2.828125 
	wire [15:0] compare_bias_10 = (x - 16'hfab0); // -2.656250 
	wire [15:0] compare_bias_11 = (x - 16'hfb08); // -2.484375 
	wire [15:0] compare_bias_12 = (x - 16'hfb60); // -2.312500 
	wire [15:0] compare_bias_13 = (x - 16'hfbb8); // -2.140625 
	wire [15:0] compare_bias_14 = (x - 16'hfc10); // -1.968750 
	wire [15:0] compare_bias_15 = (x - 16'hfc80); // -1.750000 
	wire [15:0] compare_bias_16 = (x - 16'hfd20); // -1.437500 
	wire [15:0] compare_bias_17 = (x - 16'hfdf0); // -1.031250 
	wire [15:0] compare_bias_18 = (x - 16'hfed0); // -0.593750 
	wire [15:0] compare_bias_19 = (x - 16'hff48); // -0.359375 
	wire [15:0] compare_bias_20 = (x - 16'hff80); // -0.250000 
	wire [15:0] compare_bias_21 = (x - 16'hff90); // -0.218750 
	wire [15:0] compare_bias_22 = (x - 16'h88); // 0.265625 
	wire [15:0] compare_bias_23 = (x - 16'hc8); // 0.390625 
	wire [15:0] compare_bias_24 = (x - 16'hf8); // 0.484375 
	wire [15:0] compare_bias_25 = (x - 16'h108); // 0.515625 
	wire [15:0] compare_bias_26 = (x - 16'h118); // 0.546875 
	wire [15:0] compare_bias_27 = (x - 16'h148); // 0.640625 
	wire [15:0] compare_bias_28 = (x - 16'h180); // 0.750000 
	wire [15:0] compare_bias_29 = (x - 16'h1c8); // 0.890625 
	wire [15:0] compare_bias_30 = (x - 16'h268); // 1.203125 
	wire [15:0] compare_bias_31 = (x - 16'h2f0); // 1.468750 
	wire [15:0] compare_bias_32 = (x - 16'h380); // 1.750000 
	wire [15:0] compare_bias_33 = (x - 16'h3e8); // 1.953125 
	wire [15:0] compare_bias_34 = (x - 16'h448); // 2.140625 
	wire [15:0] compare_bias_35 = (x - 16'h4a0); // 2.312500 
	wire [15:0] compare_bias_36 = (x - 16'h4f0); // 2.468750 
	wire [15:0] compare_bias_37 = (x - 16'h540); // 2.625000 
	wire [15:0] compare_bias_38 = (x - 16'h598); // 2.796875 
	wire [15:0] compare_bias_39 = (x - 16'h5f8); // 2.984375 
	wire [15:0] compare_bias_40 = (x - 16'h660); // 3.187500 
	wire [15:0] compare_bias_41 = (x - 16'h6c8); // 3.390625 
	wire [15:0] compare_bias_42 = (x - 16'h748); // 3.640625 
	wire [15:0] compare_bias_43 = (x - 16'h7d0); // 3.906250 
	wire [15:0] compare_bias_44 = (x - 16'h880); // 4.250000 
	wire [15:0] compare_bias_45 = (x - 16'h948); // 4.640625 
	wire [15:0] compare_bias_46 = (x - 16'ha60); // 5.187500 
	wire [15:0] compare_bias_47 = (x - 16'hc40); // 6.125000 

/**************** Compare and LUT *****************/
always @(*) begin
	if(compare_slope_0[15]) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_1[15]) begin // -0.843750 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_2[15]) begin // -0.250000 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfe50;
	end else 	if(compare_slope_3[15]) begin // 0.515625 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'hff80;
	end else begin
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'h108;
	end

	if(compare_bias_0[15]) begin // -6.468750
		bias = 16'h0; // 0.000000 
	end else 	if(compare_bias_1[15]) begin // -5.328125
		bias = 16'hfff8; // -0.015625 
	end else 	if(compare_bias_2[15]) begin // -4.718750
		bias = 16'hfff0; // -0.031250 
	end else 	if(compare_bias_3[15]) begin // -4.312500
		bias = 16'hffe8; // -0.046875 
	end else 	if(compare_bias_4[15]) begin // -3.984375
		bias = 16'hffe0; // -0.062500 
	end else 	if(compare_bias_5[15]) begin // -3.703125
		bias = 16'hffd8; // -0.078125 
	end else 	if(compare_bias_6[15]) begin // -3.453125
		bias = 16'hffcf; // -0.095703 
	end else 	if(compare_bias_7[15]) begin // -3.234375
		bias = 16'hffc7; // -0.111328 
	end else 	if(compare_bias_8[15]) begin // -3.031250
		bias = 16'hffbe; // -0.128906 
	end else 	if(compare_bias_9[15]) begin // -2.828125
		bias = 16'hffb5; // -0.146484 
	end else 	if(compare_bias_10[15]) begin // -2.656250
		bias = 16'hffac; // -0.164062 
	end else 	if(compare_bias_11[15]) begin // -2.484375
		bias = 16'hffa4; // -0.179688 
	end else 	if(compare_bias_12[15]) begin // -2.312500
		bias = 16'hff9b; // -0.197266 
	end else 	if(compare_bias_13[15]) begin // -2.140625
		bias = 16'hff92; // -0.214844 
	end else 	if(compare_bias_14[15]) begin // -1.968750
		bias = 16'hff8a; // -0.230469 
	end else 	if(compare_bias_15[15]) begin // -1.750000
		bias = 16'hff81; // -0.248047 
	end else 	if(compare_bias_16[15]) begin // -1.437500
		bias = 16'hff78; // -0.265625 
	end else 	if(compare_bias_17[15]) begin // -1.031250
		bias = 16'hff70; // -0.281250 
	end else 	if(compare_bias_18[15]) begin // -0.593750
		bias = 16'hff79; // -0.263672 
	end else 	if(compare_bias_19[15]) begin // -0.359375
		bias = 16'hff71; // -0.279297 
	end else 	if(compare_bias_20[15]) begin // -0.250000
		bias = 16'hff7a; // -0.261719 
	end else 	if(compare_bias_21[15]) begin // -0.218750
		bias = 16'hffcc; // -0.101562 
	end else 	if(compare_bias_22[15]) begin // 0.265625
		bias = 16'hffc3; // -0.119141 
	end else 	if(compare_bias_23[15]) begin // 0.390625
		bias = 16'hffcd; // -0.099609 
	end else 	if(compare_bias_24[15]) begin // 0.484375
		bias = 16'hffd7; // -0.080078 
	end else 	if(compare_bias_25[15]) begin // 0.515625
		bias = 16'hffe2; // -0.058594 
	end else 	if(compare_bias_26[15]) begin // 0.546875
		bias = 16'ha8; // 0.328125 
	end else 	if(compare_bias_27[15]) begin // 0.640625
		bias = 16'h9d; // 0.306641 
	end else 	if(compare_bias_28[15]) begin // 0.750000
		bias = 16'h93; // 0.287109 
	end else 	if(compare_bias_29[15]) begin // 0.890625
		bias = 16'h89; // 0.267578 
	end else 	if(compare_bias_30[15]) begin // 1.203125
		bias = 16'h7f; // 0.248047 
	end else 	if(compare_bias_31[15]) begin // 1.468750
		bias = 16'h76; // 0.230469 
	end else 	if(compare_bias_32[15]) begin // 1.750000
		bias = 16'h7e; // 0.246094 
	end else 	if(compare_bias_33[15]) begin // 1.953125
		bias = 16'h86; // 0.261719 
	end else 	if(compare_bias_34[15]) begin // 2.140625
		bias = 16'h8f; // 0.279297 
	end else 	if(compare_bias_35[15]) begin // 2.312500
		bias = 16'h98; // 0.296875 
	end else 	if(compare_bias_36[15]) begin // 2.468750
		bias = 16'ha0; // 0.312500 
	end else 	if(compare_bias_37[15]) begin // 2.625000
		bias = 16'ha8; // 0.328125 
	end else 	if(compare_bias_38[15]) begin // 2.796875
		bias = 16'hb0; // 0.343750 
	end else 	if(compare_bias_39[15]) begin // 2.984375
		bias = 16'hb9; // 0.361328 
	end else 	if(compare_bias_40[15]) begin // 3.187500
		bias = 16'hc2; // 0.378906 
	end else 	if(compare_bias_41[15]) begin // 3.390625
		bias = 16'hca; // 0.394531 
	end else 	if(compare_bias_42[15]) begin // 3.640625
		bias = 16'hd3; // 0.412109 
	end else 	if(compare_bias_43[15]) begin // 3.906250
		bias = 16'hdb; // 0.427734 
	end else 	if(compare_bias_44[15]) begin // 4.250000
		bias = 16'he4; // 0.445312 
	end else 	if(compare_bias_45[15]) begin // 4.640625
		bias = 16'hec; // 0.460938 
	end else 	if(compare_bias_46[15]) begin // 5.187500
		bias = 16'hf4; // 0.476562 
	end else 	if(compare_bias_47[15]) begin // 6.125000
		bias = 16'hfc; // 0.492188 
	end else begin
		bias = 16'h104; // 0.492188 
	end
end

endmodule
