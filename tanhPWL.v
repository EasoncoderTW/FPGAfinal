module tanhPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [4:0] slope, slope_stage_reg;
reg signed [5:0] bias, bias_stage_reg;
reg signed [15:0] x_delta, x_stage_reg;
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
assign y = (zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> slope_stage_reg) + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if(x < $signed(16'hf000)) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfb28)) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfc48)) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfb28;
	end else 	if(x < $signed(16'hfd08)) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfc48;
	end else 	if(x < $signed(16'hfdd8)) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfd08;
	end else 	if(x < $signed(16'hfee8)) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hfdd8;
	end else 	if(x < $signed(16'h118)) begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if(x < $signed(16'h228)) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h118;
	end else 	if(x < $signed(16'h2f8)) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'h228;
	end else 	if(x < $signed(16'h3b8)) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h2f8;
	end else 	if(x < $signed(16'h4d8)) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'h3b8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h4d8;
	end

	if(x < $signed(16'hf000)) begin
		bias = 16'h0;
	end else 	if(x < $signed(16'hf9d8)) begin
		bias = 16'hfdfd;
	end else 	if(x < $signed(16'hfc48)) begin
		bias = 16'hfe06;
	end else 	if(x < $signed(16'hfc98)) begin
		bias = 16'hfe1c;
	end else 	if(x < $signed(16'hfcf8)) begin
		bias = 16'hfe14;
	end else 	if(x < $signed(16'hfd08)) begin
		bias = 16'hfe1d;
	end else 	if(x < $signed(16'hfd20)) begin
		bias = 16'hfe36;
	end else 	if(x < $signed(16'hfdc0)) begin
		bias = 16'hfe2e;
	end else 	if(x < $signed(16'hfdd8)) begin
		bias = 16'hfe38;
	end else 	if(x < $signed(16'hfde8)) begin
		bias = 16'hfe6e;
	end else 	if(x < $signed(16'hfea0)) begin
		bias = 16'hfe65;
	end else 	if(x < $signed(16'hfed8)) begin
		bias = 16'hfe6f;
	end else 	if(x < $signed(16'hfee8)) begin
		bias = 16'hfe79;
	end else 	if(x < $signed(16'hfef0)) begin
		bias = 16'hff05;
	end else 	if(x < $signed(16'hff18)) begin
		bias = 16'hfefc;
	end else 	if(x < $signed(16'hff50)) begin
		bias = 16'hfef4;
	end else 	if(x < $signed(16'h68)) begin
		bias = 16'hfeec;
	end else 	if(x < $signed(16'hc8)) begin
		bias = 16'hfee4;
	end else 	if(x < $signed(16'h100)) begin
		bias = 16'hfedb;
	end else 	if(x < $signed(16'h118)) begin
		bias = 16'hfed2;
	end else 	if(x < $signed(16'h140)) begin
		bias = 16'h102;
	end else 	if(x < $signed(16'h178)) begin
		bias = 16'h10b;
	end else 	if(x < $signed(16'h228)) begin
		bias = 16'h113;
	end else 	if(x < $signed(16'h2f8)) begin
		bias = 16'h199;
	end else 	if(x < $signed(16'h3b8)) begin
		bias = 16'h1d1;
	end else 	if(x < $signed(16'h4d8)) begin
		bias = 16'h1eb;
	end else begin
		bias = 16'h1fb;
	end
end

endmodule
