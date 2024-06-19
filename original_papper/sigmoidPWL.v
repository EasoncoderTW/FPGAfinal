module sigmoidPWL(
	input [15:0] x,
	output wire [15:0] y
);

reg [15:0] bias;
reg [15:0] x_delta;
reg zero;
wire [15:0] x_ = (x - x_delta);
assign y = ((zero)? 0: ({{16{x_[15]}},x_} >> 2'b11)) + bias;

/**************** Compare and LUT *****************/
always @(*) begin
	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7ab8)) begin // -2.640625 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h8548)) begin // 2.640625 
		zero = 0;
		x_delta = 16'hfab8;
	end else begin
		zero = 1;
		x_delta = 16'h548;
	end

	if({~x[15],x[14:0]} < (16'h76d0)) begin // -4.593750
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h7890)) begin // -3.718750
		bias = 16'h7; // 0.013672 
	end else 	if({~x[15],x[14:0]} < (16'h7988)) begin // -3.234375
		bias = 16'he; // 0.027344 
	end else 	if({~x[15],x[14:0]} < (16'h7a28)) begin // -2.921875
		bias = 16'h15; // 0.041016 
	end else 	if({~x[15],x[14:0]} < (16'h7ab0)) begin // -2.656250
		bias = 16'h1c; // 0.054688 
	end else 	if({~x[15],x[14:0]} < (16'h7af0)) begin // -2.531250
		bias = 16'h24; // 0.070312 
	end else 	if({~x[15],x[14:0]} < (16'h7ba0)) begin // -2.187500
		bias = 16'h1c; // 0.054688 
	end else 	if({~x[15],x[14:0]} < (16'h7d88)) begin // -1.234375
		bias = 16'h14; // 0.039062 
	end else 	if({~x[15],x[14:0]} < (16'h7df8)) begin // -1.015625
		bias = 16'h1b; // 0.052734 
	end else 	if({~x[15],x[14:0]} < (16'h7e58)) begin // -0.828125
		bias = 16'h22; // 0.066406 
	end else 	if({~x[15],x[14:0]} < (16'h7eb0)) begin // -0.656250
		bias = 16'h2a; // 0.082031 
	end else 	if({~x[15],x[14:0]} < (16'h7ef8)) begin // -0.515625
		bias = 16'h32; // 0.097656 
	end else 	if({~x[15],x[14:0]} < (16'h7f38)) begin // -0.390625
		bias = 16'h39; // 0.111328 
	end else 	if({~x[15],x[14:0]} < (16'h7f78)) begin // -0.265625
		bias = 16'h41; // 0.126953 
	end else 	if({~x[15],x[14:0]} < (16'h7fb8)) begin // -0.140625
		bias = 16'h48; // 0.140625 
	end else 	if({~x[15],x[14:0]} < (16'h7ff8)) begin // -0.015625
		bias = 16'h50; // 0.156250 
	end else 	if({~x[15],x[14:0]} < (16'h8038)) begin // 0.109375
		bias = 16'h58; // 0.171875 
	end else 	if({~x[15],x[14:0]} < (16'h8078)) begin // 0.234375
		bias = 16'h60; // 0.187500 
	end else 	if({~x[15],x[14:0]} < (16'h80b8)) begin // 0.359375
		bias = 16'h68; // 0.203125 
	end else 	if({~x[15],x[14:0]} < (16'h8100)) begin // 0.500000
		bias = 16'h70; // 0.218750 
	end else 	if({~x[15],x[14:0]} < (16'h8148)) begin // 0.640625
		bias = 16'h78; // 0.234375 
	end else 	if({~x[15],x[14:0]} < (16'h8190)) begin // 0.781250
		bias = 16'h7f; // 0.248047 
	end else 	if({~x[15],x[14:0]} < (16'h81e8)) begin // 0.953125
		bias = 16'h86; // 0.261719 
	end else 	if({~x[15],x[14:0]} < (16'h8260)) begin // 1.187500
		bias = 16'h8e; // 0.277344 
	end else 	if({~x[15],x[14:0]} < (16'h8318)) begin // 1.546875
		bias = 16'h95; // 0.291016 
	end else 	if({~x[15],x[14:0]} < (16'h8470)) begin // 2.218750
		bias = 16'h9c; // 0.304688 
	end else 	if({~x[15],x[14:0]} < (16'h8518)) begin // 2.546875
		bias = 16'h94; // 0.289062 
	end else 	if({~x[15],x[14:0]} < (16'h8548)) begin // 2.640625
		bias = 16'h8c; // 0.273438 
	end else 	if({~x[15],x[14:0]} < (16'h85d0)) begin // 2.906250
		bias = 16'h1e0; // 0.937500 
	end else 	if({~x[15],x[14:0]} < (16'h8688)) begin // 3.265625
		bias = 16'h1e8; // 0.953125 
	end else 	if({~x[15],x[14:0]} < (16'h8780)) begin // 3.750000
		bias = 16'h1ef; // 0.966797 
	end else 	if({~x[15],x[14:0]} < (16'h8950)) begin // 4.656250
		bias = 16'h1f6; // 0.980469 
	end else begin
		bias = 16'h1fd; // 0.980469 
	end
end

endmodule
