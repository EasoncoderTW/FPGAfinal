module tanhPWL(
	input [15:0] x;
	output wire [15:0] y;
);

reg [4:0] slope;
reg [5:0] bias;
reg [15:0] x_delta;
reg zero;
assign y = (zero)? 0: (x_delta>>slope)+bias;
/**************** Compare and LUT *****************/
always @(*) begin
	if(x < 16'hf800) begin
		slope = 16'h0;
		zero = 1;
		x_delta = x-16'hf800;
	end else 	if(x < 16'hfd95) begin
		slope = 16'h0;
		zero = 1;
		x_delta = x-16'hf800;
	end else 	if(x < 16'hfe26) begin
		slope = 16'h4;
		zero = 0;
		x_delta = x-16'hfd95;
	end else 	if(x < 16'hfe85) begin
		slope = 16'h3;
		zero = 0;
		x_delta = x-16'hfe26;
	end else 	if(x < 16'hfeed) begin
		slope = 16'h2;
		zero = 0;
		x_delta = x-16'hfe85;
	end else 	if(x < 16'hff73) begin
		slope = 16'h1;
		zero = 0;
		x_delta = x-16'hfeed;
	end else 	if(x < 16'h8d) begin
		slope = 16'h0;
		zero = 0;
		x_delta = x-16'hff73;
	end else 	if(x < 16'h113) begin
		slope = 16'h1;
		zero = 0;
		x_delta = x-16'h8d;
	end else 	if(x < 16'h17b) begin
		slope = 16'h2;
		zero = 0;
		x_delta = x-16'h113;
	end else 	if(x < 16'h1da) begin
		slope = 16'h3;
		zero = 0;
		x_delta = x-16'h17b;
	end else 	if(x < 16'h26b) begin
		slope = 16'h4;
		zero = 0;
		x_delta = x-16'h1da;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = x-16'h26b;
	end

	if(x < 16'hf800) begin
		bias = 16'h0;
	end else 	if(x < 16'hfd1b) begin
		bias = 16'hfeff;
	end else 	if(x < 16'hfe26) begin
		bias = 16'hff04;
	end else 	if(x < 16'hfe27) begin
		bias = 16'hff0f;
	end else 	if(x < 16'hfe85) begin
		bias = 16'hff0b;
	end else 	if(x < 16'hfe94) begin
		bias = 16'hff1b;
	end else 	if(x < 16'hfedb) begin
		bias = 16'hff17;
	end else 	if(x < 16'hfeed) begin
		bias = 16'hff1c;
	end else 	if(x < 16'hfeee) begin
		bias = 16'hff38;
	end else 	if(x < 16'hff55) begin
		bias = 16'hff34;
	end else 	if(x < 16'hff6f) begin
		bias = 16'hff39;
	end else 	if(x < 16'hff73) begin
		bias = 16'hff3e;
	end else 	if(x < 16'hff75) begin
		bias = 16'hff82;
	end else 	if(x < 16'hff87) begin
		bias = 16'hff7e;
	end else 	if(x < 16'hff9f) begin
		bias = 16'hff7a;
	end else 	if(x < 16'hffd4) begin
		bias = 16'hff76;
	end else 	if(x < 16'h5b) begin
		bias = 16'hff72;
	end else 	if(x < 16'h76) begin
		bias = 16'hff6e;
	end else 	if(x < 16'h89) begin
		bias = 16'hff6a;
	end else 	if(x < 16'h8d) begin
		bias = 16'hff66;
	end else 	if(x < 16'ha1) begin
		bias = 16'h82;
	end else 	if(x < 16'hbb) begin
		bias = 16'h86;
	end else 	if(x < 16'h113) begin
		bias = 16'h8a;
	end else 	if(x < 16'h17b) begin
		bias = 16'hcc;
	end else 	if(x < 16'h1da) begin
		bias = 16'he8;
	end else 	if(x < 16'h26b) begin
		bias = 16'hf5;
	end else 	if(x < 16'h388) begin
		bias = 16'hfd;
	end else begin
		bias = 16'h101;
	end
end

endmodule
