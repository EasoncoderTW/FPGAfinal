module sigmoidPWL(
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
assign y = (zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> slope_stage_reg) + bias_stage_reg;

	wire [15:0] compare_slope_0 = (x - 16'hf000); // -8.000000 
	wire [15:0] compare_slope_1 = (x - 16'hf7c0); // -4.125000 
	wire [15:0] compare_slope_2 = (x - 16'hfa18); // -2.953125 
	wire [15:0] compare_slope_3 = (x - 16'hfbb8); // -2.140625 
	wire [15:0] compare_slope_4 = (x - 16'hfdd0); // -1.093750 
	wire [15:0] compare_slope_5 = (x - 16'h230); // 1.093750 
	wire [15:0] compare_slope_6 = (x - 16'h448); // 2.140625 
	wire [15:0] compare_slope_7 = (x - 16'h5e8); // 2.953125 
	wire [15:0] compare_slope_8 = (x - 16'h840); // 4.125000 

	wire [15:0] compare_bias_0 = (x - 16'hf6d0); // -4.593750 
	wire [15:0] compare_bias_1 = (x - 16'hfa18); // -2.953125 
	wire [15:0] compare_bias_2 = (x - 16'hfbb8); // -2.140625 
	wire [15:0] compare_bias_3 = (x - 16'hfc08); // -1.984375 
	wire [15:0] compare_bias_4 = (x - 16'hfd20); // -1.437500 
	wire [15:0] compare_bias_5 = (x - 16'hfdd0); // -1.093750 
	wire [15:0] compare_bias_6 = (x - 16'hfdf0); // -1.031250 
	wire [15:0] compare_bias_7 = (x - 16'hff20); // -0.437500 
	wire [15:0] compare_bias_8 = (x - 16'h1e8); // 0.953125 
	wire [15:0] compare_bias_9 = (x - 16'h230); // 1.093750 
	wire [15:0] compare_bias_10 = (x - 16'h2f0); // 1.468750 
	wire [15:0] compare_bias_11 = (x - 16'h448); // 2.140625 
	wire [15:0] compare_bias_12 = (x - 16'h5e8); // 2.953125 
	wire [15:0] compare_bias_13 = (x - 16'h840); // 4.125000 

/**************** Compare and LUT *****************/
always @(*) begin
	if(compare_slope_0[15]) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_1[15]) begin // -4.125000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_2[15]) begin // -2.953125 
		slope = 16'h5; // 0.031250
		zero = 0;
		x_delta = 16'hf7c0;
	end else 	if(compare_slope_3[15]) begin // -2.140625 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'hfa18;
	end else 	if(compare_slope_4[15]) begin // -1.093750 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfbb8;
	end else 	if(compare_slope_5[15]) begin // 1.093750 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfdd0;
	end else 	if(compare_slope_6[15]) begin // 2.140625 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'h230;
	end else 	if(compare_slope_7[15]) begin // 2.953125 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'h448;
	end else 	if(compare_slope_8[15]) begin // 4.125000 
		slope = 16'h5; // 0.031250
		zero = 0;
		x_delta = 16'h5e8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h840;
	end

	if(compare_bias_0[15]) begin // -4.593750
		bias = 16'h0; // 0.000000 
	end else 	if(compare_bias_1[15]) begin // -2.953125
		bias = 16'h8; // 0.015625 
	end else 	if(compare_bias_2[15]) begin // -2.140625
		bias = 16'h1c; // 0.054688 
	end else 	if(compare_bias_3[15]) begin // -1.984375
		bias = 16'h39; // 0.111328 
	end else 	if(compare_bias_4[15]) begin // -1.437500
		bias = 16'h30; // 0.093750 
	end else 	if(compare_bias_5[15]) begin // -1.093750
		bias = 16'h38; // 0.109375 
	end else 	if(compare_bias_6[15]) begin // -1.031250
		bias = 16'h84; // 0.257812 
	end else 	if(compare_bias_7[15]) begin // -0.437500
		bias = 16'h7a; // 0.238281 
	end else 	if(compare_bias_8[15]) begin // 0.953125
		bias = 16'h71; // 0.220703 
	end else 	if(compare_bias_9[15]) begin // 1.093750
		bias = 16'h67; // 0.201172 
	end else 	if(compare_bias_10[15]) begin // 1.468750
		bias = 16'h183; // 0.755859 
	end else 	if(compare_bias_11[15]) begin // 2.140625
		bias = 16'h18b; // 0.771484 
	end else 	if(compare_bias_12[15]) begin // 2.953125
		bias = 16'h1cd; // 0.900391 
	end else 	if(compare_bias_13[15]) begin // 4.125000
		bias = 16'h1ea; // 0.957031 
	end else begin
		bias = 16'h1fb; // 0.957031 
	end
end

endmodule
