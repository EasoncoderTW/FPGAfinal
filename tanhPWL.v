module tanhPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg [4:0] slope, slope_stage_reg;
reg [5:0] bias, bias_stage_reg;
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
assign y = (zero_stage_reg)? 0: ({16{x_stage_reg[15]},x_stage_reg} >> slope_stage_reg)[15:0] + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if((x - 16'hf000)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfb28)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfc48)[15]) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfb28;
	end else 	if((x - 16'hfd08)[15]) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfc48;
	end else 	if((x - 16'hfdd8)[15]) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfd08;
	end else 	if((x - 16'hfee8)[15]) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hfdd8;
	end else 	if((x - 16'h118)[15]) begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if((x - 16'h228)[15]) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h118;
	end else 	if((x - 16'h2f8)[15]) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'h228;
	end else 	if((x - 16'h3b8)[15]) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h2f8;
	end else 	if((x - 16'h4d8)[15]) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'h3b8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h4d8;
	end

	if((x - 16'hf000)[15]) begin
		bias = 16'h0;
	end else 	if((x - 16'hf9d8)[15]) begin
		bias = 16'hfdfd;
	end else 	if((x - 16'hfc48)[15]) begin
		bias = 16'hfe06;
	end else 	if((x - 16'hfc98)[15]) begin
		bias = 16'hfe1c;
	end else 	if((x - 16'hfcf8)[15]) begin
		bias = 16'hfe14;
	end else 	if((x - 16'hfd08)[15]) begin
		bias = 16'hfe1d;
	end else 	if((x - 16'hfd20)[15]) begin
		bias = 16'hfe36;
	end else 	if((x - 16'hfdc0)[15]) begin
		bias = 16'hfe2e;
	end else 	if((x - 16'hfdd8)[15]) begin
		bias = 16'hfe38;
	end else 	if((x - 16'hfde8)[15]) begin
		bias = 16'hfe6e;
	end else 	if((x - 16'hfea0)[15]) begin
		bias = 16'hfe65;
	end else 	if((x - 16'hfed8)[15]) begin
		bias = 16'hfe6f;
	end else 	if((x - 16'hfee8)[15]) begin
		bias = 16'hfe79;
	end else 	if((x - 16'hfef0)[15]) begin
		bias = 16'hff05;
	end else 	if((x - 16'hff18)[15]) begin
		bias = 16'hfefc;
	end else 	if((x - 16'hff50)[15]) begin
		bias = 16'hfef4;
	end else 	if((x - 16'h68)[15]) begin
		bias = 16'hfeec;
	end else 	if((x - 16'hc8)[15]) begin
		bias = 16'hfee4;
	end else 	if((x - 16'h100)[15]) begin
		bias = 16'hfedb;
	end else 	if((x - 16'h118)[15]) begin
		bias = 16'hfed2;
	end else 	if((x - 16'h140)[15]) begin
		bias = 16'h102;
	end else 	if((x - 16'h178)[15]) begin
		bias = 16'h10b;
	end else 	if((x - 16'h228)[15]) begin
		bias = 16'h113;
	end else 	if((x - 16'h2f8)[15]) begin
		bias = 16'h199;
	end else 	if((x - 16'h3b8)[15]) begin
		bias = 16'h1d1;
	end else 	if((x - 16'h4d8)[15]) begin
		bias = 16'h1eb;
	end else begin
		bias = 16'h1fb;
	end
end

endmodule
