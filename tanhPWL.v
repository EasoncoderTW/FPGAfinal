module tanhPWL(
	input clk,
	input rst_n,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [4:0] slope, slope_stage_reg;
reg signed [15:0] bias, bias_stage_reg;
reg signed [15:0] x_delta, x_stage_reg;
reg zero, zero_stage_reg;
always @(posedge clk) begin
	if(~rst_n) begin
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
assign y = ((zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> slope_stage_reg)) + bias_stage_reg;

/**************** Compare and LUT *****************/
always @(*) begin
	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7b28)) begin // -2.421875 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7c48)) begin // -1.859375 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'hfb28;
	end else 	if({~x[15],x[14:0]} < (16'h7d08)) begin // -1.484375 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfc48;
	end else 	if({~x[15],x[14:0]} < (16'h7dd8)) begin // -1.078125 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfd08;
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
	end else 	if({~x[15],x[14:0]} < (16'h82f8)) begin // 1.484375 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'h228;
	end else 	if({~x[15],x[14:0]} < (16'h83b8)) begin // 1.859375 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'h2f8;
	end else 	if({~x[15],x[14:0]} < (16'h84d8)) begin // 2.421875 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'h3b8;
	end else begin
		slope = 16'h0; // 0.000000
		zero = 1;
		x_delta = 16'h4d8;
	end

	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h79d8)) begin // -3.078125
		bias = 16'hfdfd; // -1.005859 
	end else 	if({~x[15],x[14:0]} < (16'h7c48)) begin // -1.859375
		bias = 16'hfe06; // -0.988281 
	end else 	if({~x[15],x[14:0]} < (16'h7c98)) begin // -1.703125
		bias = 16'hfe1c; // -0.945312 
	end else 	if({~x[15],x[14:0]} < (16'h7cf8)) begin // -1.515625
		bias = 16'hfe14; // -0.960938 
	end else 	if({~x[15],x[14:0]} < (16'h7d08)) begin // -1.484375
		bias = 16'hfe1d; // -0.943359 
	end else 	if({~x[15],x[14:0]} < (16'h7d20)) begin // -1.437500
		bias = 16'hfe36; // -0.894531 
	end else 	if({~x[15],x[14:0]} < (16'h7dc0)) begin // -1.125000
		bias = 16'hfe2e; // -0.910156 
	end else 	if({~x[15],x[14:0]} < (16'h7dd8)) begin // -1.078125
		bias = 16'hfe38; // -0.890625 
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
	end else 	if({~x[15],x[14:0]} < (16'h82f8)) begin // 1.484375
		bias = 16'h199; // 0.798828 
	end else 	if({~x[15],x[14:0]} < (16'h83b8)) begin // 1.859375
		bias = 16'h1d1; // 0.908203 
	end else 	if({~x[15],x[14:0]} < (16'h84d8)) begin // 2.421875
		bias = 16'h1eb; // 0.958984 
	end else begin
		bias = 16'h1fb; // 0.958984 
	end
end

endmodule
