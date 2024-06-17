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
	if(x < 16'hf000) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < 16'hfe50) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < 16'hff80) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfe50;
	end else 	if(x < 16'h108) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hff80;
	end else begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h108;
	end

	if(x < 16'hf310) begin
		bias = 16'h0;
	end else 	if(x < 16'hf558) begin
		bias = 16'hfff8;
	end else 	if(x < 16'hf690) begin
		bias = 16'hfff0;
	end else 	if(x < 16'hf760) begin
		bias = 16'hffe8;
	end else 	if(x < 16'hf808) begin
		bias = 16'hffe0;
	end else 	if(x < 16'hf898) begin
		bias = 16'hffd8;
	end else 	if(x < 16'hf918) begin
		bias = 16'hffcf;
	end else 	if(x < 16'hf988) begin
		bias = 16'hffc7;
	end else 	if(x < 16'hf9f0) begin
		bias = 16'hffbe;
	end else 	if(x < 16'hfa58) begin
		bias = 16'hffb5;
	end else 	if(x < 16'hfab0) begin
		bias = 16'hffac;
	end else 	if(x < 16'hfb08) begin
		bias = 16'hffa4;
	end else 	if(x < 16'hfb60) begin
		bias = 16'hff9b;
	end else 	if(x < 16'hfbb8) begin
		bias = 16'hff92;
	end else 	if(x < 16'hfc10) begin
		bias = 16'hff8a;
	end else 	if(x < 16'hfc80) begin
		bias = 16'hff81;
	end else 	if(x < 16'hfd20) begin
		bias = 16'hff78;
	end else 	if(x < 16'hfdf0) begin
		bias = 16'hff70;
	end else 	if(x < 16'hfed0) begin
		bias = 16'hff79;
	end else 	if(x < 16'hff48) begin
		bias = 16'hff71;
	end else 	if(x < 16'hff80) begin
		bias = 16'hff7a;
	end else 	if(x < 16'hff90) begin
		bias = 16'hffcc;
	end else 	if(x < 16'h88) begin
		bias = 16'hffc3;
	end else 	if(x < 16'hc8) begin
		bias = 16'hffcd;
	end else 	if(x < 16'hf8) begin
		bias = 16'hffd7;
	end else 	if(x < 16'h108) begin
		bias = 16'hffe2;
	end else 	if(x < 16'h118) begin
		bias = 16'ha8;
	end else 	if(x < 16'h148) begin
		bias = 16'h9d;
	end else 	if(x < 16'h180) begin
		bias = 16'h93;
	end else 	if(x < 16'h1c8) begin
		bias = 16'h89;
	end else 	if(x < 16'h268) begin
		bias = 16'h7f;
	end else 	if(x < 16'h2f0) begin
		bias = 16'h76;
	end else 	if(x < 16'h380) begin
		bias = 16'h7e;
	end else 	if(x < 16'h3e8) begin
		bias = 16'h86;
	end else 	if(x < 16'h448) begin
		bias = 16'h8f;
	end else 	if(x < 16'h4a0) begin
		bias = 16'h98;
	end else 	if(x < 16'h4f0) begin
		bias = 16'ha0;
	end else 	if(x < 16'h540) begin
		bias = 16'ha8;
	end else 	if(x < 16'h598) begin
		bias = 16'hb0;
	end else 	if(x < 16'h5f8) begin
		bias = 16'hb9;
	end else 	if(x < 16'h660) begin
		bias = 16'hc2;
	end else 	if(x < 16'h6c8) begin
		bias = 16'hca;
	end else 	if(x < 16'h748) begin
		bias = 16'hd3;
	end else 	if(x < 16'h7d0) begin
		bias = 16'hdb;
	end else 	if(x < 16'h880) begin
		bias = 16'he4;
	end else 	if(x < 16'h948) begin
		bias = 16'hec;
	end else 	if(x < 16'ha60) begin
		bias = 16'hf4;
	end else 	if(x < 16'hc40) begin
		bias = 16'hfc;
	end else begin
		bias = 16'h104;
	end
end

endmodule
