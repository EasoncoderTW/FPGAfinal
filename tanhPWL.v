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
assign y = (zero_stage_reg)? 0: (x_stage_reg >> slope_stage_reg) + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if(x < 16'hf800) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf800;
	end else 	if(x < 16'hfd94) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf800;
	end else 	if(x < 16'hfe24) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfd94;
	end else 	if(x < 16'hfe84) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfe24;
	end else 	if(x < 16'hfeec) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfe84;
	end else 	if(x < 16'hff74) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hfeec;
	end else 	if(x < 16'h8c) begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'hff74;
	end else 	if(x < 16'h114) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h8c;
	end else 	if(x < 16'h17c) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'h114;
	end else 	if(x < 16'h1dc) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h17c;
	end else 	if(x < 16'h26c) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'h1dc;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h26c;
	end

	if(x < 16'hf800) begin
		bias = 16'h0;
	end else 	if(x < 16'hfcec) begin
		bias = 16'hfeff;
	end else 	if(x < 16'hfe24) begin
		bias = 16'hff03;
	end else 	if(x < 16'hfe4c) begin
		bias = 16'hff0e;
	end else 	if(x < 16'hfe7c) begin
		bias = 16'hff0a;
	end else 	if(x < 16'hfe84) begin
		bias = 16'hff0f;
	end else 	if(x < 16'hfe90) begin
		bias = 16'hff1b;
	end else 	if(x < 16'hfee0) begin
		bias = 16'hff17;
	end else 	if(x < 16'hfeec) begin
		bias = 16'hff1c;
	end else 	if(x < 16'hfef4) begin
		bias = 16'hff37;
	end else 	if(x < 16'hff50) begin
		bias = 16'hff33;
	end else 	if(x < 16'hff6c) begin
		bias = 16'hff38;
	end else 	if(x < 16'hff74) begin
		bias = 16'hff3d;
	end else 	if(x < 16'hff78) begin
		bias = 16'hff83;
	end else 	if(x < 16'hff8c) begin
		bias = 16'hff7e;
	end else 	if(x < 16'hffa8) begin
		bias = 16'hff7a;
	end else 	if(x < 16'h34) begin
		bias = 16'hff76;
	end else 	if(x < 16'h64) begin
		bias = 16'hff72;
	end else 	if(x < 16'h80) begin
		bias = 16'hff6e;
	end else 	if(x < 16'h8c) begin
		bias = 16'hff69;
	end else 	if(x < 16'ha0) begin
		bias = 16'h81;
	end else 	if(x < 16'hbc) begin
		bias = 16'h85;
	end else 	if(x < 16'h114) begin
		bias = 16'h89;
	end else 	if(x < 16'h17c) begin
		bias = 16'hcc;
	end else 	if(x < 16'h1dc) begin
		bias = 16'he8;
	end else 	if(x < 16'h26c) begin
		bias = 16'hf5;
	end else begin
		bias = 16'hfd;
	end
end

endmodule
