module sigmoidPWL(
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
	end else 	if(x < 16'hfbe0) begin
		slope = 16'h0;
		zero = 1;
		x_delta = x-16'hf800;
	end else 	if(x < 16'hfd0a) begin
		slope = 16'h5;
		zero = 0;
		x_delta = x-16'hfbe0;
	end else 	if(x < 16'hfddb) begin
		slope = 16'h4;
		zero = 0;
		x_delta = x-16'hfd0a;
	end else 	if(x < 16'hfee7) begin
		slope = 16'h3;
		zero = 0;
		x_delta = x-16'hfddb;
	end else 	if(x < 16'h119) begin
		slope = 16'h2;
		zero = 0;
		x_delta = x-16'hfee7;
	end else 	if(x < 16'h225) begin
		slope = 16'h3;
		zero = 0;
		x_delta = x-16'h119;
	end else 	if(x < 16'h2f6) begin
		slope = 16'h4;
		zero = 0;
		x_delta = x-16'h225;
	end else 	if(x < 16'h420) begin
		slope = 16'h5;
		zero = 0;
		x_delta = x-16'h2f6;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = x-16'h420;
	end

	if(x < 16'hfb68) begin
		bias = 16'h0;
	end else 	if(x < 16'hfd0a) begin
		bias = 16'h4;
	end else 	if(x < 16'hfddb) begin
		bias = 16'he;
	end else 	if(x < 16'hfe1e) begin
		bias = 16'h1c;
	end else 	if(x < 16'hfe66) begin
		bias = 16'h17;
	end else 	if(x < 16'hfed7) begin
		bias = 16'h1b;
	end else 	if(x < 16'hfee7) begin
		bias = 16'h1f;
	end else 	if(x < 16'hff04) begin
		bias = 16'h41;
	end else 	if(x < 16'h64) begin
		bias = 16'h3c;
	end else 	if(x < 16'h109) begin
		bias = 16'h37;
	end else 	if(x < 16'h119) begin
		bias = 16'h32;
	end else 	if(x < 16'h163) begin
		bias = 16'hc1;
	end else 	if(x < 16'h225) begin
		bias = 16'hc5;
	end else 	if(x < 16'h2f6) begin
		bias = 16'he6;
	end else 	if(x < 16'h420) begin
		bias = 16'hf5;
	end else 	if(x < 16'h65e) begin
		bias = 16'hfd;
	end else begin
		bias = 16'h101;
	end
end

endmodule
