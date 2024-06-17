module siluPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg [3:0] slope, slope_stage_reg;
reg [6:0] bias, bias_stage_reg;
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
	end else 	if(x < 16'hff28) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf800;
	end else 	if(x < 16'hffc0) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hff28;
	end else 	if(x < 16'h84) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hffc0;
	end else begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h84;
	end

	if(x < 16'hf988) begin
		bias = 16'h0;
	end else 	if(x < 16'hfaac) begin
		bias = 16'hfffc;
	end else 	if(x < 16'hfb48) begin
		bias = 16'hfff8;
	end else 	if(x < 16'hfbb0) begin
		bias = 16'hfff4;
	end else 	if(x < 16'hfc04) begin
		bias = 16'hfff0;
	end else 	if(x < 16'hfc4c) begin
		bias = 16'hffec;
	end else 	if(x < 16'hfc8c) begin
		bias = 16'hffe8;
	end else 	if(x < 16'hfcc4) begin
		bias = 16'hffe4;
	end else 	if(x < 16'hfcf8) begin
		bias = 16'hffdf;
	end else 	if(x < 16'hfd2c) begin
		bias = 16'hffdb;
	end else 	if(x < 16'hfd58) begin
		bias = 16'hffd6;
	end else 	if(x < 16'hfd84) begin
		bias = 16'hffd2;
	end else 	if(x < 16'hfdb0) begin
		bias = 16'hffce;
	end else 	if(x < 16'hfddc) begin
		bias = 16'hffc9;
	end else 	if(x < 16'hfe08) begin
		bias = 16'hffc5;
	end else 	if(x < 16'hfe40) begin
		bias = 16'hffc1;
	end else 	if(x < 16'hfe90) begin
		bias = 16'hffbc;
	end else 	if(x < 16'hfef8) begin
		bias = 16'hffb8;
	end else 	if(x < 16'hff68) begin
		bias = 16'hffbd;
	end else 	if(x < 16'hffa4) begin
		bias = 16'hffb9;
	end else 	if(x < 16'hffc0) begin
		bias = 16'hffbd;
	end else 	if(x < 16'hffc8) begin
		bias = 16'hffe6;
	end else 	if(x < 16'h44) begin
		bias = 16'hffe2;
	end else 	if(x < 16'h64) begin
		bias = 16'hffe7;
	end else 	if(x < 16'h7c) begin
		bias = 16'hffec;
	end else 	if(x < 16'h84) begin
		bias = 16'hfff1;
	end else 	if(x < 16'h8c) begin
		bias = 16'h54;
	end else 	if(x < 16'ha4) begin
		bias = 16'h4e;
	end else 	if(x < 16'hc0) begin
		bias = 16'h49;
	end else 	if(x < 16'he4) begin
		bias = 16'h44;
	end else 	if(x < 16'h134) begin
		bias = 16'h3f;
	end else 	if(x < 16'h178) begin
		bias = 16'h3b;
	end else 	if(x < 16'h1c0) begin
		bias = 16'h3f;
	end else 	if(x < 16'h1f4) begin
		bias = 16'h43;
	end else 	if(x < 16'h224) begin
		bias = 16'h47;
	end else 	if(x < 16'h250) begin
		bias = 16'h4c;
	end else 	if(x < 16'h278) begin
		bias = 16'h50;
	end else 	if(x < 16'h2a0) begin
		bias = 16'h54;
	end else 	if(x < 16'h2cc) begin
		bias = 16'h58;
	end else 	if(x < 16'h2fc) begin
		bias = 16'h5c;
	end else 	if(x < 16'h330) begin
		bias = 16'h61;
	end else 	if(x < 16'h364) begin
		bias = 16'h65;
	end else 	if(x < 16'h3a4) begin
		bias = 16'h69;
	end else 	if(x < 16'h3e8) begin
		bias = 16'h6d;
	end else 	if(x < 16'h440) begin
		bias = 16'h72;
	end else 	if(x < 16'h4a4) begin
		bias = 16'h76;
	end else 	if(x < 16'h530) begin
		bias = 16'h7a;
	end else 	if(x < 16'h620) begin
		bias = 16'h7e;
	end else begin
		bias = 16'h82;
	end
end

endmodule
