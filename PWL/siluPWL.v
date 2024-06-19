module siluPWL(
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
	end else 	if({~x[15],x[14:0]} < (16'h7e50)) begin // -0.843750 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7f80)) begin // -0.250000 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfe50;
	end else 	if({~x[15],x[14:0]} < (16'h8108)) begin // 0.515625 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'hff80;
	end else begin
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'h108;
	end

	if({~x[15],x[14:0]} < (16'h7310)) begin // -6.468750
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h7558)) begin // -5.328125
		bias = 16'hfff8; // -0.015625 
	end else 	if({~x[15],x[14:0]} < (16'h7690)) begin // -4.718750
		bias = 16'hfff0; // -0.031250 
	end else 	if({~x[15],x[14:0]} < (16'h7760)) begin // -4.312500
		bias = 16'hffe8; // -0.046875 
	end else 	if({~x[15],x[14:0]} < (16'h7808)) begin // -3.984375
		bias = 16'hffe0; // -0.062500 
	end else 	if({~x[15],x[14:0]} < (16'h7898)) begin // -3.703125
		bias = 16'hffd8; // -0.078125 
	end else 	if({~x[15],x[14:0]} < (16'h7918)) begin // -3.453125
		bias = 16'hffcf; // -0.095703 
	end else 	if({~x[15],x[14:0]} < (16'h7988)) begin // -3.234375
		bias = 16'hffc7; // -0.111328 
	end else 	if({~x[15],x[14:0]} < (16'h79f0)) begin // -3.031250
		bias = 16'hffbe; // -0.128906 
	end else 	if({~x[15],x[14:0]} < (16'h7a58)) begin // -2.828125
		bias = 16'hffb5; // -0.146484 
	end else 	if({~x[15],x[14:0]} < (16'h7ab0)) begin // -2.656250
		bias = 16'hffac; // -0.164062 
	end else 	if({~x[15],x[14:0]} < (16'h7b08)) begin // -2.484375
		bias = 16'hffa4; // -0.179688 
	end else 	if({~x[15],x[14:0]} < (16'h7b60)) begin // -2.312500
		bias = 16'hff9b; // -0.197266 
	end else 	if({~x[15],x[14:0]} < (16'h7bb8)) begin // -2.140625
		bias = 16'hff92; // -0.214844 
	end else 	if({~x[15],x[14:0]} < (16'h7c10)) begin // -1.968750
		bias = 16'hff8a; // -0.230469 
	end else 	if({~x[15],x[14:0]} < (16'h7c80)) begin // -1.750000
		bias = 16'hff81; // -0.248047 
	end else 	if({~x[15],x[14:0]} < (16'h7d20)) begin // -1.437500
		bias = 16'hff78; // -0.265625 
	end else 	if({~x[15],x[14:0]} < (16'h7df0)) begin // -1.031250
		bias = 16'hff70; // -0.281250 
	end else 	if({~x[15],x[14:0]} < (16'h7ed0)) begin // -0.593750
		bias = 16'hff79; // -0.263672 
	end else 	if({~x[15],x[14:0]} < (16'h7f48)) begin // -0.359375
		bias = 16'hff71; // -0.279297 
	end else 	if({~x[15],x[14:0]} < (16'h7f80)) begin // -0.250000
		bias = 16'hff7a; // -0.261719 
	end else 	if({~x[15],x[14:0]} < (16'h7f90)) begin // -0.218750
		bias = 16'hffcc; // -0.101562 
	end else 	if({~x[15],x[14:0]} < (16'h8088)) begin // 0.265625
		bias = 16'hffc3; // -0.119141 
	end else 	if({~x[15],x[14:0]} < (16'h80c8)) begin // 0.390625
		bias = 16'hffcd; // -0.099609 
	end else 	if({~x[15],x[14:0]} < (16'h80f8)) begin // 0.484375
		bias = 16'hffd7; // -0.080078 
	end else 	if({~x[15],x[14:0]} < (16'h8108)) begin // 0.515625
		bias = 16'hffe2; // -0.058594 
	end else 	if({~x[15],x[14:0]} < (16'h8118)) begin // 0.546875
		bias = 16'ha8; // 0.328125 
	end else 	if({~x[15],x[14:0]} < (16'h8148)) begin // 0.640625
		bias = 16'h9d; // 0.306641 
	end else 	if({~x[15],x[14:0]} < (16'h8180)) begin // 0.750000
		bias = 16'h93; // 0.287109 
	end else 	if({~x[15],x[14:0]} < (16'h81c8)) begin // 0.890625
		bias = 16'h89; // 0.267578 
	end else 	if({~x[15],x[14:0]} < (16'h8268)) begin // 1.203125
		bias = 16'h7f; // 0.248047 
	end else 	if({~x[15],x[14:0]} < (16'h82f0)) begin // 1.468750
		bias = 16'h76; // 0.230469 
	end else 	if({~x[15],x[14:0]} < (16'h8380)) begin // 1.750000
		bias = 16'h7e; // 0.246094 
	end else 	if({~x[15],x[14:0]} < (16'h83e8)) begin // 1.953125
		bias = 16'h86; // 0.261719 
	end else 	if({~x[15],x[14:0]} < (16'h8448)) begin // 2.140625
		bias = 16'h8f; // 0.279297 
	end else 	if({~x[15],x[14:0]} < (16'h84a0)) begin // 2.312500
		bias = 16'h98; // 0.296875 
	end else 	if({~x[15],x[14:0]} < (16'h84f0)) begin // 2.468750
		bias = 16'ha0; // 0.312500 
	end else 	if({~x[15],x[14:0]} < (16'h8540)) begin // 2.625000
		bias = 16'ha8; // 0.328125 
	end else 	if({~x[15],x[14:0]} < (16'h8598)) begin // 2.796875
		bias = 16'hb0; // 0.343750 
	end else 	if({~x[15],x[14:0]} < (16'h85f8)) begin // 2.984375
		bias = 16'hb9; // 0.361328 
	end else 	if({~x[15],x[14:0]} < (16'h8660)) begin // 3.187500
		bias = 16'hc2; // 0.378906 
	end else 	if({~x[15],x[14:0]} < (16'h86c8)) begin // 3.390625
		bias = 16'hca; // 0.394531 
	end else 	if({~x[15],x[14:0]} < (16'h8748)) begin // 3.640625
		bias = 16'hd3; // 0.412109 
	end else 	if({~x[15],x[14:0]} < (16'h87d0)) begin // 3.906250
		bias = 16'hdb; // 0.427734 
	end else 	if({~x[15],x[14:0]} < (16'h8880)) begin // 4.250000
		bias = 16'he4; // 0.445312 
	end else 	if({~x[15],x[14:0]} < (16'h8948)) begin // 4.640625
		bias = 16'hec; // 0.460938 
	end else 	if({~x[15],x[14:0]} < (16'h8a60)) begin // 5.187500
		bias = 16'hf4; // 0.476562 
	end else 	if({~x[15],x[14:0]} < (16'h8c40)) begin // 6.125000
		bias = 16'hfc; // 0.492188 
	end else begin
		bias = 16'h104; // 0.492188 
	end
end

endmodule
