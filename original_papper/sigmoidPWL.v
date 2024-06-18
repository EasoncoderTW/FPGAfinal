module original_papper\sigmoidPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg [2:0] slope, slope_stage_reg;
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
	end else 	if((x - 16'hfab8)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'h548)[15]) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfab8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h548;
	end

	if((x - 16'hf6d0)[15]) begin
		bias = 16'h0;
	end else 	if((x - 16'hf8c0)[15]) begin
		bias = 16'h8;
	end else 	if((x - 16'hf9b8)[15]) begin
		bias = 16'h10;
	end else 	if((x - 16'hfa68)[15]) begin
		bias = 16'h18;
	end else 	if((x - 16'hfb28)[15]) begin
		bias = 16'h21;
	end else 	if((x - 16'hfc60)[15]) begin
		bias = 16'h18;
	end else 	if((x - 16'hfcf8)[15]) begin
		bias = 16'hf;
	end else 	if((x - 16'hfdc0)[15]) begin
		bias = 16'h17;
	end else 	if((x - 16'hfe40)[15]) begin
		bias = 16'h20;
	end else 	if((x - 16'hfea0)[15]) begin
		bias = 16'h29;
	end else 	if((x - 16'hfef0)[15]) begin
		bias = 16'h31;
	end else 	if((x - 16'hff40)[15]) begin
		bias = 16'h3a;
	end else 	if((x - 16'hff88)[15]) begin
		bias = 16'h43;
	end else 	if((x - 16'hffd0)[15]) begin
		bias = 16'h4b;
	end else 	if((x - 16'h18)[15]) begin
		bias = 16'h54;
	end else 	if((x - 16'h60)[15]) begin
		bias = 16'h5d;
	end else 	if((x - 16'ha8)[15]) begin
		bias = 16'h66;
	end else 	if((x - 16'hf8)[15]) begin
		bias = 16'h6f;
	end else 	if((x - 16'h148)[15]) begin
		bias = 16'h78;
	end else 	if((x - 16'h1a0)[15]) begin
		bias = 16'h80;
	end else 	if((x - 16'h210)[15]) begin
		bias = 16'h89;
	end else 	if((x - 16'h2b8)[15]) begin
		bias = 16'h92;
	end else 	if((x - 16'h4a0)[15]) begin
		bias = 16'h9a;
	end else 	if((x - 16'h548)[15]) begin
		bias = 16'h91;
	end else 	if((x - 16'h5e0)[15]) begin
		bias = 16'h1e1;
	end else 	if((x - 16'h6a8)[15]) begin
		bias = 16'h1e9;
	end else 	if((x - 16'h7e0)[15]) begin
		bias = 16'h1f1;
	end else 	if((x - 16'hb38)[15]) begin
		bias = 16'h1f9;
	end else begin
		bias = 16'h201;
	end
end

endmodule
