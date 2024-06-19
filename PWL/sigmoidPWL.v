module sigmoidPWL(
	input [15:0] x,
	output wire [15:0] y
);

reg [4:0] slope;
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
	end else 	if({~x[15],x[14:0]} < (16'h77c0)) begin // -4.125000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7a18)) begin // -2.953125 
		slope = 16'h5; // 0.031250
		zero = 0;
		x_delta = 16'hf7c0;
	end else 	if({~x[15],x[14:0]} < (16'h7bb8)) begin // -2.140625 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'hfa18;
	end else 	if({~x[15],x[14:0]} < (16'h7dd0)) begin // -1.093750 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfbb8;
	end else 	if({~x[15],x[14:0]} < (16'h8230)) begin // 1.093750 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfdd0;
	end else 	if({~x[15],x[14:0]} < (16'h8448)) begin // 2.140625 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'h230;
	end else 	if({~x[15],x[14:0]} < (16'h85e8)) begin // 2.953125 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'h448;
	end else 	if({~x[15],x[14:0]} < (16'h8840)) begin // 4.125000 
		slope = 16'h5; // 0.031250
		zero = 0;
		x_delta = 16'h5e8;
	end else begin
		slope = 16'h0; // 0.000000
		zero = 1;
		x_delta = 16'h840;
	end

	if({~x[15],x[14:0]} < (16'h76d0)) begin // -4.593750
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h7a18)) begin // -2.953125
		bias = 16'h8; // 0.015625 
	end else 	if({~x[15],x[14:0]} < (16'h7bb8)) begin // -2.140625
		bias = 16'h1c; // 0.054688 
	end else 	if({~x[15],x[14:0]} < (16'h7c08)) begin // -1.984375
		bias = 16'h39; // 0.111328 
	end else 	if({~x[15],x[14:0]} < (16'h7d20)) begin // -1.437500
		bias = 16'h30; // 0.093750 
	end else 	if({~x[15],x[14:0]} < (16'h7dd0)) begin // -1.093750
		bias = 16'h38; // 0.109375 
	end else 	if({~x[15],x[14:0]} < (16'h7df0)) begin // -1.031250
		bias = 16'h84; // 0.257812 
	end else 	if({~x[15],x[14:0]} < (16'h7f20)) begin // -0.437500
		bias = 16'h7a; // 0.238281 
	end else 	if({~x[15],x[14:0]} < (16'h81e8)) begin // 0.953125
		bias = 16'h71; // 0.220703 
	end else 	if({~x[15],x[14:0]} < (16'h8230)) begin // 1.093750
		bias = 16'h67; // 0.201172 
	end else 	if({~x[15],x[14:0]} < (16'h82f0)) begin // 1.468750
		bias = 16'h183; // 0.755859 
	end else 	if({~x[15],x[14:0]} < (16'h8448)) begin // 2.140625
		bias = 16'h18b; // 0.771484 
	end else 	if({~x[15],x[14:0]} < (16'h85e8)) begin // 2.953125
		bias = 16'h1cd; // 0.900391 
	end else 	if({~x[15],x[14:0]} < (16'h8840)) begin // 4.125000
		bias = 16'h1ea; // 0.957031 
	end else begin
		bias = 16'h1fb; // 0.957031 
	end
end

endmodule
