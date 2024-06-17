module siluPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg [4:0] slope, slope_stage_reg;
reg [7:0] bias, bias_stage_reg;
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
	end else 	if(x < 16'hfb3a) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf800;
	end else 	if(x < 16'hfd31) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfb3a;
	end else 	if(x < 16'hfdef) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfd31;
	end else 	if(x < 16'hfe90) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfdef;
	end else 	if(x < 16'hfeda) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hfe90;
	end else 	if(x < 16'hff12) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfeda;
	end else 	if(x < 16'hff54) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hff12;
	end else 	if(x < 16'hffbf) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hff54;
	end else 	if(x < 16'h86) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hffbf;
	end else begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h86;
	end

	if(x < 16'hf988) begin
		bias = 16'h0;
	end else 	if(x < 16'hfaab) begin
		bias = 16'hfffc;
	end else 	if(x < 16'hfb3e) begin
		bias = 16'hfff8;
	end else 	if(x < 16'hfb68) begin
		bias = 16'hfff4;
	end else 	if(x < 16'hfb90) begin
		bias = 16'hfff0;
	end else 	if(x < 16'hfbb6) begin
		bias = 16'hffec;
	end else 	if(x < 16'hfbdb) begin
		bias = 16'hffe8;
	end else 	if(x < 16'hfbfe) begin
		bias = 16'hffe4;
	end else 	if(x < 16'hfc21) begin
		bias = 16'hffe0;
	end else 	if(x < 16'hfc42) begin
		bias = 16'hffdc;
	end else 	if(x < 16'hfc61) begin
		bias = 16'hffd8;
	end else 	if(x < 16'hfc80) begin
		bias = 16'hffd4;
	end else 	if(x < 16'hfc9e) begin
		bias = 16'hffd0;
	end else 	if(x < 16'hfcba) begin
		bias = 16'hffcc;
	end else 	if(x < 16'hfcd6) begin
		bias = 16'hffc8;
	end else 	if(x < 16'hfcf2) begin
		bias = 16'hffc4;
	end else 	if(x < 16'hfd0c) begin
		bias = 16'hffc0;
	end else 	if(x < 16'hfd26) begin
		bias = 16'hffbc;
	end else 	if(x < 16'hfd31) begin
		bias = 16'hffb8;
	end else 	if(x < 16'hfd35) begin
		bias = 16'hffd9;
	end else 	if(x < 16'hfd47) begin
		bias = 16'hffd5;
	end else 	if(x < 16'hfd59) begin
		bias = 16'hffd1;
	end else 	if(x < 16'hfd6b) begin
		bias = 16'hffcd;
	end else 	if(x < 16'hfd7d) begin
		bias = 16'hffc9;
	end else 	if(x < 16'hfd8e) begin
		bias = 16'hffc5;
	end else 	if(x < 16'hfda0) begin
		bias = 16'hffc1;
	end else 	if(x < 16'hfdb2) begin
		bias = 16'hffbd;
	end else 	if(x < 16'hfdc4) begin
		bias = 16'hffb9;
	end else 	if(x < 16'hfdd6) begin
		bias = 16'hffb5;
	end else 	if(x < 16'hfde8) begin
		bias = 16'hffb1;
	end else 	if(x < 16'hfdef) begin
		bias = 16'hffad;
	end else 	if(x < 16'hfdf0) begin
		bias = 16'hffc7;
	end else 	if(x < 16'hfe0a) begin
		bias = 16'hffc3;
	end else 	if(x < 16'hfe25) begin
		bias = 16'hffbf;
	end else 	if(x < 16'hfe42) begin
		bias = 16'hffbb;
	end else 	if(x < 16'hfe61) begin
		bias = 16'hffb7;
	end else 	if(x < 16'hfe85) begin
		bias = 16'hffb3;
	end else 	if(x < 16'hfe90) begin
		bias = 16'hffaf;
	end else 	if(x < 16'hfe91) begin
		bias = 16'hffbc;
	end else 	if(x < 16'hff12) begin
		bias = 16'hffb8;
	end else 	if(x < 16'hff1b) begin
		bias = 16'hffbf;
	end else 	if(x < 16'hff54) begin
		bias = 16'hffbb;
	end else 	if(x < 16'hff5c) begin
		bias = 16'hffc8;
	end else 	if(x < 16'hffa9) begin
		bias = 16'hffc4;
	end else 	if(x < 16'hffbf) begin
		bias = 16'hffc9;
	end else 	if(x < 16'hffc1) begin
		bias = 16'hffe6;
	end else 	if(x < 16'h49) begin
		bias = 16'hffe2;
	end else 	if(x < 16'h67) begin
		bias = 16'hffe7;
	end else 	if(x < 16'h7e) begin
		bias = 16'hffec;
	end else 	if(x < 16'h86) begin
		bias = 16'hfff1;
	end else 	if(x < 16'h8d) begin
		bias = 16'h55;
	end else 	if(x < 16'ha4) begin
		bias = 16'h50;
	end else 	if(x < 16'hc0) begin
		bias = 16'h4b;
	end else 	if(x < 16'he7) begin
		bias = 16'h46;
	end else 	if(x < 16'h1bf) begin
		bias = 16'h41;
	end else 	if(x < 16'h1f1) begin
		bias = 16'h45;
	end else 	if(x < 16'h21c) begin
		bias = 16'h49;
	end else 	if(x < 16'h245) begin
		bias = 16'h4d;
	end else 	if(x < 16'h26e) begin
		bias = 16'h51;
	end else 	if(x < 16'h296) begin
		bias = 16'h55;
	end else 	if(x < 16'h2bf) begin
		bias = 16'h59;
	end else 	if(x < 16'h2ea) begin
		bias = 16'h5d;
	end else 	if(x < 16'h317) begin
		bias = 16'h61;
	end else 	if(x < 16'h348) begin
		bias = 16'h65;
	end else 	if(x < 16'h37e) begin
		bias = 16'h69;
	end else 	if(x < 16'h3ba) begin
		bias = 16'h6d;
	end else 	if(x < 16'h400) begin
		bias = 16'h71;
	end else 	if(x < 16'h454) begin
		bias = 16'h75;
	end else 	if(x < 16'h4c0) begin
		bias = 16'h79;
	end else 	if(x < 16'h55c) begin
		bias = 16'h7d;
	end else 	if(x < 16'h688) begin
		bias = 16'h81;
	end else begin
		bias = 16'h85;
	end
end

endmodule
