module tanhPWL(
	input clk,
	input rst_n,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [4:0] slope, slope_stage_reg;
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
	wire [15:0] compare_slope_1 = (x - 16'hfb28); // -2.421875 
	wire [15:0] compare_slope_2 = (x - 16'hfc48); // -1.859375 
	wire [15:0] compare_slope_3 = (x - 16'hfd08); // -1.484375 
	wire [15:0] compare_slope_4 = (x - 16'hfdd8); // -1.078125 
	wire [15:0] compare_slope_5 = (x - 16'hfee8); // -0.546875 
	wire [15:0] compare_slope_6 = (x - 16'h118); // 0.546875 
	wire [15:0] compare_slope_7 = (x - 16'h228); // 1.078125 
	wire [15:0] compare_slope_8 = (x - 16'h2f8); // 1.484375 
	wire [15:0] compare_slope_9 = (x - 16'h3b8); // 1.859375 
	wire [15:0] compare_slope_10 = (x - 16'h4d8); // 2.421875 

	wire [15:0] compare_bias_0 = (x - 16'hf000); // -8.000000 
	wire [15:0] compare_bias_1 = (x - 16'hf9d8); // -3.078125 
	wire [15:0] compare_bias_2 = (x - 16'hfc48); // -1.859375 
	wire [15:0] compare_bias_3 = (x - 16'hfc98); // -1.703125 
	wire [15:0] compare_bias_4 = (x - 16'hfcf8); // -1.515625 
	wire [15:0] compare_bias_5 = (x - 16'hfd08); // -1.484375 
	wire [15:0] compare_bias_6 = (x - 16'hfd20); // -1.437500 
	wire [15:0] compare_bias_7 = (x - 16'hfdc0); // -1.125000 
	wire [15:0] compare_bias_8 = (x - 16'hfdd8); // -1.078125 
	wire [15:0] compare_bias_9 = (x - 16'hfde8); // -1.046875 
	wire [15:0] compare_bias_10 = (x - 16'hfea0); // -0.687500 
	wire [15:0] compare_bias_11 = (x - 16'hfed8); // -0.578125 
	wire [15:0] compare_bias_12 = (x - 16'hfee8); // -0.546875 
	wire [15:0] compare_bias_13 = (x - 16'hfef0); // -0.531250 
	wire [15:0] compare_bias_14 = (x - 16'hff18); // -0.453125 
	wire [15:0] compare_bias_15 = (x - 16'hff50); // -0.343750 
	wire [15:0] compare_bias_16 = (x - 16'h68); // 0.203125 
	wire [15:0] compare_bias_17 = (x - 16'hc8); // 0.390625 
	wire [15:0] compare_bias_18 = (x - 16'h100); // 0.500000 
	wire [15:0] compare_bias_19 = (x - 16'h118); // 0.546875 
	wire [15:0] compare_bias_20 = (x - 16'h140); // 0.625000 
	wire [15:0] compare_bias_21 = (x - 16'h178); // 0.734375 
	wire [15:0] compare_bias_22 = (x - 16'h228); // 1.078125 
	wire [15:0] compare_bias_23 = (x - 16'h2f8); // 1.484375 
	wire [15:0] compare_bias_24 = (x - 16'h3b8); // 1.859375 
	wire [15:0] compare_bias_25 = (x - 16'h4d8); // 2.421875 

/**************** Compare and LUT *****************/
always @(*) begin
	if(compare_slope_0[15]) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_1[15]) begin // -2.421875 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_2[15]) begin // -1.859375 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'hfb28;
	end else 	if(compare_slope_3[15]) begin // -1.484375 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfc48;
	end else 	if(compare_slope_4[15]) begin // -1.078125 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfd08;
	end else 	if(compare_slope_5[15]) begin // -0.546875 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'hfdd8;
	end else 	if(compare_slope_6[15]) begin // 0.546875 
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if(compare_slope_7[15]) begin // 1.078125 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'h118;
	end else 	if(compare_slope_8[15]) begin // 1.484375 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'h228;
	end else 	if(compare_slope_9[15]) begin // 1.859375 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'h2f8;
	end else 	if(compare_slope_10[15]) begin // 2.421875 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'h3b8;
	end else begin
		slope = 16'h0; // 0.000000
		zero = 1;
		x_delta = 16'h4d8;
	end

	if(compare_bias_0[15]) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if(compare_bias_1[15]) begin // -3.078125
		bias = 16'hfdfd; // -1.005859 
	end else 	if(compare_bias_2[15]) begin // -1.859375
		bias = 16'hfe06; // -0.988281 
	end else 	if(compare_bias_3[15]) begin // -1.703125
		bias = 16'hfe1c; // -0.945312 
	end else 	if(compare_bias_4[15]) begin // -1.515625
		bias = 16'hfe14; // -0.960938 
	end else 	if(compare_bias_5[15]) begin // -1.484375
		bias = 16'hfe1d; // -0.943359 
	end else 	if(compare_bias_6[15]) begin // -1.437500
		bias = 16'hfe36; // -0.894531 
	end else 	if(compare_bias_7[15]) begin // -1.125000
		bias = 16'hfe2e; // -0.910156 
	end else 	if(compare_bias_8[15]) begin // -1.078125
		bias = 16'hfe38; // -0.890625 
	end else 	if(compare_bias_9[15]) begin // -1.046875
		bias = 16'hfe6e; // -0.785156 
	end else 	if(compare_bias_10[15]) begin // -0.687500
		bias = 16'hfe65; // -0.802734 
	end else 	if(compare_bias_11[15]) begin // -0.578125
		bias = 16'hfe6f; // -0.783203 
	end else 	if(compare_bias_12[15]) begin // -0.546875
		bias = 16'hfe79; // -0.763672 
	end else 	if(compare_bias_13[15]) begin // -0.531250
		bias = 16'hff05; // -0.490234 
	end else 	if(compare_bias_14[15]) begin // -0.453125
		bias = 16'hfefc; // -0.507812 
	end else 	if(compare_bias_15[15]) begin // -0.343750
		bias = 16'hfef4; // -0.523438 
	end else 	if(compare_bias_16[15]) begin // 0.203125
		bias = 16'hfeec; // -0.539062 
	end else 	if(compare_bias_17[15]) begin // 0.390625
		bias = 16'hfee4; // -0.554688 
	end else 	if(compare_bias_18[15]) begin // 0.500000
		bias = 16'hfedb; // -0.572266 
	end else 	if(compare_bias_19[15]) begin // 0.546875
		bias = 16'hfed2; // -0.589844 
	end else 	if(compare_bias_20[15]) begin // 0.625000
		bias = 16'h102; // 0.503906 
	end else 	if(compare_bias_21[15]) begin // 0.734375
		bias = 16'h10b; // 0.521484 
	end else 	if(compare_bias_22[15]) begin // 1.078125
		bias = 16'h113; // 0.537109 
	end else 	if(compare_bias_23[15]) begin // 1.484375
		bias = 16'h199; // 0.798828 
	end else 	if(compare_bias_24[15]) begin // 1.859375
		bias = 16'h1d1; // 0.908203 
	end else 	if(compare_bias_25[15]) begin // 2.421875
		bias = 16'h1eb; // 0.958984 
	end else begin
		bias = 16'h1fb; // 0.958984 
	end
end

endmodule
