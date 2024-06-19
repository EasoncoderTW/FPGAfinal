module tanhPWL(
	input [15:0] x,
	output wire [15:0] y
);

reg [3:0] slope;
reg [15:0] bias;
reg [15:0] x_delta;
reg zero;
wire [15:0] x_ = (x - x_delta);
assign y = ((zero)? 0: ({{16{x_[15]}},x_} >> slope)) + bias;

/**************** Compare and LUT *****************/
always @(*) begin
	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7c98)) begin // -1.703125 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7dd8)) begin // -1.078125 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfc98;
	end else 	if({~x[15],x[14:0]} < (16'h7ee8)) begin // -0.546875 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'hfdd8;
	end else 	if({~x[15],x[14:0]} < (16'h8118)) begin // 0.546875 
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if({~x[15],x[14:0]} < (16'h8228)) begin // 1.078125 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'h118;
	end else 	if({~x[15],x[14:0]} < (16'h8368)) begin // 1.703125 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'h228;
	end else begin
		slope = 16'h0; // 0.000000
		zero = 1;
		x_delta = 16'h368;
	end

	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h79d8)) begin // -3.078125
		bias = 16'hfdfd; // -1.005859 
	end else 	if({~x[15],x[14:0]} < (16'h7b80)) begin // -2.250000
		bias = 16'hfe06; // -0.988281 
	end else 	if({~x[15],x[14:0]} < (16'h7c18)) begin // -1.953125
		bias = 16'hfe0f; // -0.970703 
	end else 	if({~x[15],x[14:0]} < (16'h7c80)) begin // -1.750000
		bias = 16'hfe18; // -0.953125 
	end else 	if({~x[15],x[14:0]} < (16'h7cc0)) begin // -1.625000
		bias = 16'hfe22; // -0.933594 
	end else 	if({~x[15],x[14:0]} < (16'h7d38)) begin // -1.390625
		bias = 16'hfe19; // -0.951172 
	end else 	if({~x[15],x[14:0]} < (16'h7db0)) begin // -1.156250
		bias = 16'hfe11; // -0.966797 
	end else 	if({~x[15],x[14:0]} < (16'h7dd8)) begin // -1.078125
		bias = 16'hfe1a; // -0.949219 
	end else 	if({~x[15],x[14:0]} < (16'h7de8)) begin // -1.046875
		bias = 16'hfe6e; // -0.785156 
	end else 	if({~x[15],x[14:0]} < (16'h7ea0)) begin // -0.687500
		bias = 16'hfe65; // -0.802734 
	end else 	if({~x[15],x[14:0]} < (16'h7ed8)) begin // -0.578125
		bias = 16'hfe6f; // -0.783203 
	end else 	if({~x[15],x[14:0]} < (16'h7ee8)) begin // -0.546875
		bias = 16'hfe79; // -0.763672 
	end else 	if({~x[15],x[14:0]} < (16'h7ef0)) begin // -0.531250
		bias = 16'hff05; // -0.490234 
	end else 	if({~x[15],x[14:0]} < (16'h7f18)) begin // -0.453125
		bias = 16'hfefc; // -0.507812 
	end else 	if({~x[15],x[14:0]} < (16'h7f50)) begin // -0.343750
		bias = 16'hfef4; // -0.523438 
	end else 	if({~x[15],x[14:0]} < (16'h8068)) begin // 0.203125
		bias = 16'hfeec; // -0.539062 
	end else 	if({~x[15],x[14:0]} < (16'h80c8)) begin // 0.390625
		bias = 16'hfee4; // -0.554688 
	end else 	if({~x[15],x[14:0]} < (16'h8100)) begin // 0.500000
		bias = 16'hfedb; // -0.572266 
	end else 	if({~x[15],x[14:0]} < (16'h8118)) begin // 0.546875
		bias = 16'hfed2; // -0.589844 
	end else 	if({~x[15],x[14:0]} < (16'h8140)) begin // 0.625000
		bias = 16'h102; // 0.503906 
	end else 	if({~x[15],x[14:0]} < (16'h8178)) begin // 0.734375
		bias = 16'h10b; // 0.521484 
	end else 	if({~x[15],x[14:0]} < (16'h8228)) begin // 1.078125
		bias = 16'h113; // 0.537109 
	end else 	if({~x[15],x[14:0]} < (16'h8340)) begin // 1.625000
		bias = 16'h199; // 0.798828 
	end else 	if({~x[15],x[14:0]} < (16'h8368)) begin // 1.703125
		bias = 16'h190; // 0.781250 
	end else 	if({~x[15],x[14:0]} < (16'h83b8)) begin // 1.859375
		bias = 16'h1e2; // 0.941406 
	end else 	if({~x[15],x[14:0]} < (16'h8428)) begin // 2.078125
		bias = 16'h1eb; // 0.958984 
	end else 	if({~x[15],x[14:0]} < (16'h84e0)) begin // 2.437500
		bias = 16'h1f3; // 0.974609 
	end else begin
		bias = 16'h1fb; // 0.974609 
	end
end

endmodule
