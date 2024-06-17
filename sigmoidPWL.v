module sigmoidPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg [4:0] slope, slope_stage_reg;
reg [4:0] bias, bias_stage_reg;
reg [15:0] x_delta, x_stage_reg;
reg zero, zero_stage_reg;
always @(posedge clk) begin
	if(~rst) begin
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
assign y = (zero_stage_reg)? 0: (x_stage_reg >> slope_stage_reg) + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if(x < 16'hf800) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf800;
	end else 	if(x < 16'hfbe0) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf800;
	end else 	if(x < 16'hfd0c) begin
		slope = 16'h5;
		zero = 0;
		x_delta = 16'hfbe0;
	end else 	if(x < 16'hfddc) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfd0c;
	end else 	if(x < 16'hfee8) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfddc;
	end else 	if(x < 16'h118) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if(x < 16'h224) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h118;
	end else 	if(x < 16'h2f4) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'h224;
	end else 	if(x < 16'h420) begin
		slope = 16'h5;
		zero = 0;
		x_delta = 16'h2f4;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h420;
	end

	if(x < 16'hfb68) begin
		bias = 16'h0;
	end else 	if(x < 16'hfd0c) begin
		bias = 16'h4;
	end else 	if(x < 16'hfddc) begin
		bias = 16'he;
	end else 	if(x < 16'hfe04) begin
		bias = 16'h1c;
	end else 	if(x < 16'hfe90) begin
		bias = 16'h18;
	end else 	if(x < 16'hfee8) begin
		bias = 16'h1c;
	end else 	if(x < 16'hfef8) begin
		bias = 16'h42;
	end else 	if(x < 16'hff90) begin
		bias = 16'h3d;
	end else 	if(x < 16'hf4) begin
		bias = 16'h38;
	end else 	if(x < 16'h118) begin
		bias = 16'h33;
	end else 	if(x < 16'h178) begin
		bias = 16'hc1;
	end else 	if(x < 16'h224) begin
		bias = 16'hc5;
	end else 	if(x < 16'h2f4) begin
		bias = 16'he6;
	end else 	if(x < 16'h420) begin
		bias = 16'hf5;
	end else begin
		bias = 16'hfd;
	end
end

endmodule
