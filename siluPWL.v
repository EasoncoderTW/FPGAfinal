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
assign y = (zero_stage_reg)? 0: ({16{x_stage_reg[15]},x_stage_reg} >> slope_stage_reg)[15:0] + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if((x - 16'hf000)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfe50)[15]) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hff80)[15]) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfe50;
	end else 	if((x - 16'h108)[15]) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hff80;
	end else begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h108;
	end

	if((x - 16'hf310)[15]) begin
		bias = 16'h0;
	end else 	if((x - 16'hf558)[15]) begin
		bias = 16'hfff8;
	end else 	if((x - 16'hf690)[15]) begin
		bias = 16'hfff0;
	end else 	if((x - 16'hf760)[15]) begin
		bias = 16'hffe8;
	end else 	if((x - 16'hf808)[15]) begin
		bias = 16'hffe0;
	end else 	if((x - 16'hf898)[15]) begin
		bias = 16'hffd8;
	end else 	if((x - 16'hf918)[15]) begin
		bias = 16'hffcf;
	end else 	if((x - 16'hf988)[15]) begin
		bias = 16'hffc7;
	end else 	if((x - 16'hf9f0)[15]) begin
		bias = 16'hffbe;
	end else 	if((x - 16'hfa58)[15]) begin
		bias = 16'hffb5;
	end else 	if((x - 16'hfab0)[15]) begin
		bias = 16'hffac;
	end else 	if((x - 16'hfb08)[15]) begin
		bias = 16'hffa4;
	end else 	if((x - 16'hfb60)[15]) begin
		bias = 16'hff9b;
	end else 	if((x - 16'hfbb8)[15]) begin
		bias = 16'hff92;
	end else 	if((x - 16'hfc10)[15]) begin
		bias = 16'hff8a;
	end else 	if((x - 16'hfc80)[15]) begin
		bias = 16'hff81;
	end else 	if((x - 16'hfd20)[15]) begin
		bias = 16'hff78;
	end else 	if((x - 16'hfdf0)[15]) begin
		bias = 16'hff70;
	end else 	if((x - 16'hfed0)[15]) begin
		bias = 16'hff79;
	end else 	if((x - 16'hff48)[15]) begin
		bias = 16'hff71;
	end else 	if((x - 16'hff80)[15]) begin
		bias = 16'hff7a;
	end else 	if((x - 16'hff90)[15]) begin
		bias = 16'hffcc;
	end else 	if((x - 16'h88)[15]) begin
		bias = 16'hffc3;
	end else 	if((x - 16'hc8)[15]) begin
		bias = 16'hffcd;
	end else 	if((x - 16'hf8)[15]) begin
		bias = 16'hffd7;
	end else 	if((x - 16'h108)[15]) begin
		bias = 16'hffe2;
	end else 	if((x - 16'h118)[15]) begin
		bias = 16'ha8;
	end else 	if((x - 16'h148)[15]) begin
		bias = 16'h9d;
	end else 	if((x - 16'h180)[15]) begin
		bias = 16'h93;
	end else 	if((x - 16'h1c8)[15]) begin
		bias = 16'h89;
	end else 	if((x - 16'h268)[15]) begin
		bias = 16'h7f;
	end else 	if((x - 16'h2f0)[15]) begin
		bias = 16'h76;
	end else 	if((x - 16'h380)[15]) begin
		bias = 16'h7e;
	end else 	if((x - 16'h3e8)[15]) begin
		bias = 16'h86;
	end else 	if((x - 16'h448)[15]) begin
		bias = 16'h8f;
	end else 	if((x - 16'h4a0)[15]) begin
		bias = 16'h98;
	end else 	if((x - 16'h4f0)[15]) begin
		bias = 16'ha0;
	end else 	if((x - 16'h540)[15]) begin
		bias = 16'ha8;
	end else 	if((x - 16'h598)[15]) begin
		bias = 16'hb0;
	end else 	if((x - 16'h5f8)[15]) begin
		bias = 16'hb9;
	end else 	if((x - 16'h660)[15]) begin
		bias = 16'hc2;
	end else 	if((x - 16'h6c8)[15]) begin
		bias = 16'hca;
	end else 	if((x - 16'h748)[15]) begin
		bias = 16'hd3;
	end else 	if((x - 16'h7d0)[15]) begin
		bias = 16'hdb;
	end else 	if((x - 16'h880)[15]) begin
		bias = 16'he4;
	end else 	if((x - 16'h948)[15]) begin
		bias = 16'hec;
	end else 	if((x - 16'ha60)[15]) begin
		bias = 16'hf4;
	end else 	if((x - 16'hc40)[15]) begin
		bias = 16'hfc;
	end else begin
		bias = 16'h104;
	end
end

endmodule
