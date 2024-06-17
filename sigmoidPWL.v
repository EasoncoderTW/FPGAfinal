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
assign y = (zero_stage_reg)? 0: ({16{x_stage_reg[15]},x_stage_reg} >> slope_stage_reg)[15:0] + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if((x - 16'hf000)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hf7c0)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfa18)[15]) begin
		slope = 16'h5;
		zero = 0;
		x_delta = 16'hf7c0;
	end else 	if((x - 16'hfbb8)[15]) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfa18;
	end else 	if((x - 16'hfdd0)[15]) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfbb8;
	end else 	if((x - 16'h230)[15]) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfdd0;
	end else 	if((x - 16'h448)[15]) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h230;
	end else 	if((x - 16'h5e8)[15]) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'h448;
	end else 	if((x - 16'h840)[15]) begin
		slope = 16'h5;
		zero = 0;
		x_delta = 16'h5e8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h840;
	end

	if((x - 16'hf6d0)[15]) begin
		bias = 16'h0;
	end else 	if((x - 16'hfa18)[15]) begin
		bias = 16'h8;
	end else 	if((x - 16'hfbb8)[15]) begin
		bias = 16'h1c;
	end else 	if((x - 16'hfc08)[15]) begin
		bias = 16'h39;
	end else 	if((x - 16'hfd20)[15]) begin
		bias = 16'h30;
	end else 	if((x - 16'hfdd0)[15]) begin
		bias = 16'h38;
	end else 	if((x - 16'hfdf0)[15]) begin
		bias = 16'h84;
	end else 	if((x - 16'hff20)[15]) begin
		bias = 16'h7a;
	end else 	if((x - 16'h1e8)[15]) begin
		bias = 16'h71;
	end else 	if((x - 16'h230)[15]) begin
		bias = 16'h67;
	end else 	if((x - 16'h2f0)[15]) begin
		bias = 16'h183;
	end else 	if((x - 16'h448)[15]) begin
		bias = 16'h18b;
	end else 	if((x - 16'h5e8)[15]) begin
		bias = 16'h1cd;
	end else 	if((x - 16'h840)[15]) begin
		bias = 16'h1ea;
	end else begin
		bias = 16'h1fb;
	end
end

endmodule
