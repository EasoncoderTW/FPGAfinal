module sigmoidPWL(
	input [15:0] x,
	output wire [15:0] y
);

reg [1:0] slope;
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
	end else begin
		slope = 16'h0; // 0.000000
		zero = 1;
		x_delta = 16'hf000;
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
	end else 	if({~x[15],x[14:0]} < (16'h7b20)) begin // -2.437500
		bias = 16'h24; // 0.070312 
	end else 	if({~x[15],x[14:0]} < (16'h7b78)) begin // -2.265625
		bias = 16'h2b; // 0.083984 
	end else 	if({~x[15],x[14:0]} < (16'h7bc8)) begin // -2.109375
		bias = 16'h32; // 0.097656 
	end else 	if({~x[15],x[14:0]} < (16'h7c10)) begin // -1.968750
		bias = 16'h39; // 0.111328 
	end else 	if({~x[15],x[14:0]} < (16'h7c58)) begin // -1.828125
		bias = 16'h41; // 0.126953 
	end else 	if({~x[15],x[14:0]} < (16'h7c98)) begin // -1.703125
		bias = 16'h49; // 0.142578 
	end else 	if({~x[15],x[14:0]} < (16'h7cd0)) begin // -1.593750
		bias = 16'h51; // 0.158203 
	end else 	if({~x[15],x[14:0]} < (16'h7d08)) begin // -1.484375
		bias = 16'h59; // 0.173828 
	end else 	if({~x[15],x[14:0]} < (16'h7d40)) begin // -1.375000
		bias = 16'h61; // 0.189453 
	end else 	if({~x[15],x[14:0]} < (16'h7d70)) begin // -1.281250
		bias = 16'h69; // 0.205078 
	end else 	if({~x[15],x[14:0]} < (16'h7d98)) begin // -1.203125
		bias = 16'h71; // 0.220703 
	end else 	if({~x[15],x[14:0]} < (16'h7dc0)) begin // -1.125000
		bias = 16'h78; // 0.234375 
	end else 	if({~x[15],x[14:0]} < (16'h7df0)) begin // -1.031250
		bias = 16'h80; // 0.250000 
	end else 	if({~x[15],x[14:0]} < (16'h7e18)) begin // -0.953125
		bias = 16'h89; // 0.267578 
	end else 	if({~x[15],x[14:0]} < (16'h7e40)) begin // -0.875000
		bias = 16'h91; // 0.283203 
	end else 	if({~x[15],x[14:0]} < (16'h7e68)) begin // -0.796875
		bias = 16'h99; // 0.298828 
	end else 	if({~x[15],x[14:0]} < (16'h7e90)) begin // -0.718750
		bias = 16'ha1; // 0.314453 
	end else 	if({~x[15],x[14:0]} < (16'h7eb8)) begin // -0.640625
		bias = 16'haa; // 0.332031 
	end else 	if({~x[15],x[14:0]} < (16'h7ee0)) begin // -0.562500
		bias = 16'hb3; // 0.349609 
	end else 	if({~x[15],x[14:0]} < (16'h7f00)) begin // -0.500000
		bias = 16'hbc; // 0.367188 
	end else 	if({~x[15],x[14:0]} < (16'h7f20)) begin // -0.437500
		bias = 16'hc3; // 0.380859 
	end else 	if({~x[15],x[14:0]} < (16'h7f40)) begin // -0.375000
		bias = 16'hcb; // 0.396484 
	end else 	if({~x[15],x[14:0]} < (16'h7f60)) begin // -0.312500
		bias = 16'hd3; // 0.412109 
	end else 	if({~x[15],x[14:0]} < (16'h7f80)) begin // -0.250000
		bias = 16'hda; // 0.425781 
	end else 	if({~x[15],x[14:0]} < (16'h7fa0)) begin // -0.187500
		bias = 16'he2; // 0.441406 
	end else 	if({~x[15],x[14:0]} < (16'h7fc0)) begin // -0.125000
		bias = 16'hea; // 0.457031 
	end else 	if({~x[15],x[14:0]} < (16'h7fe0)) begin // -0.062500
		bias = 16'hf2; // 0.472656 
	end else 	if({~x[15],x[14:0]} < (16'h8000)) begin // 0.000000
		bias = 16'hfa; // 0.488281 
	end else 	if({~x[15],x[14:0]} < (16'h8020)) begin // 0.062500
		bias = 16'h102; // 0.503906 
	end else 	if({~x[15],x[14:0]} < (16'h8040)) begin // 0.125000
		bias = 16'h10a; // 0.519531 
	end else 	if({~x[15],x[14:0]} < (16'h8060)) begin // 0.187500
		bias = 16'h112; // 0.535156 
	end else 	if({~x[15],x[14:0]} < (16'h8080)) begin // 0.250000
		bias = 16'h11a; // 0.550781 
	end else 	if({~x[15],x[14:0]} < (16'h80a0)) begin // 0.312500
		bias = 16'h122; // 0.566406 
	end else 	if({~x[15],x[14:0]} < (16'h80c0)) begin // 0.375000
		bias = 16'h12a; // 0.582031 
	end else 	if({~x[15],x[14:0]} < (16'h80e0)) begin // 0.437500
		bias = 16'h132; // 0.597656 
	end else 	if({~x[15],x[14:0]} < (16'h8100)) begin // 0.500000
		bias = 16'h139; // 0.611328 
	end else 	if({~x[15],x[14:0]} < (16'h8120)) begin // 0.562500
		bias = 16'h141; // 0.626953 
	end else 	if({~x[15],x[14:0]} < (16'h8140)) begin // 0.625000
		bias = 16'h148; // 0.640625 
	end else 	if({~x[15],x[14:0]} < (16'h8168)) begin // 0.703125
		bias = 16'h150; // 0.656250 
	end else 	if({~x[15],x[14:0]} < (16'h8190)) begin // 0.781250
		bias = 16'h159; // 0.673828 
	end else 	if({~x[15],x[14:0]} < (16'h81b8)) begin // 0.859375
		bias = 16'h161; // 0.689453 
	end else 	if({~x[15],x[14:0]} < (16'h81e0)) begin // 0.937500
		bias = 16'h16a; // 0.707031 
	end else 	if({~x[15],x[14:0]} < (16'h8208)) begin // 1.015625
		bias = 16'h172; // 0.722656 
	end else 	if({~x[15],x[14:0]} < (16'h8230)) begin // 1.093750
		bias = 16'h17a; // 0.738281 
	end else 	if({~x[15],x[14:0]} < (16'h8260)) begin // 1.187500
		bias = 16'h182; // 0.753906 
	end else 	if({~x[15],x[14:0]} < (16'h8288)) begin // 1.265625
		bias = 16'h18a; // 0.769531 
	end else 	if({~x[15],x[14:0]} < (16'h82b8)) begin // 1.359375
		bias = 16'h191; // 0.783203 
	end else 	if({~x[15],x[14:0]} < (16'h82e8)) begin // 1.453125
		bias = 16'h199; // 0.798828 
	end else 	if({~x[15],x[14:0]} < (16'h8318)) begin // 1.546875
		bias = 16'h1a1; // 0.814453 
	end else 	if({~x[15],x[14:0]} < (16'h8350)) begin // 1.656250
		bias = 16'h1a8; // 0.828125 
	end else 	if({~x[15],x[14:0]} < (16'h8388)) begin // 1.765625
		bias = 16'h1b0; // 0.843750 
	end else 	if({~x[15],x[14:0]} < (16'h83c8)) begin // 1.890625
		bias = 16'h1b7; // 0.857422 
	end else 	if({~x[15],x[14:0]} < (16'h8410)) begin // 2.031250
		bias = 16'h1bf; // 0.873047 
	end else 	if({~x[15],x[14:0]} < (16'h8460)) begin // 2.187500
		bias = 16'h1c7; // 0.888672 
	end else 	if({~x[15],x[14:0]} < (16'h84b0)) begin // 2.343750
		bias = 16'h1ce; // 0.902344 
	end else 	if({~x[15],x[14:0]} < (16'h8510)) begin // 2.531250
		bias = 16'h1d5; // 0.916016 
	end else 	if({~x[15],x[14:0]} < (16'h8580)) begin // 2.750000
		bias = 16'h1dc; // 0.929688 
	end else 	if({~x[15],x[14:0]} < (16'h8610)) begin // 3.031250
		bias = 16'h1e3; // 0.943359 
	end else 	if({~x[15],x[14:0]} < (16'h86c8)) begin // 3.390625
		bias = 16'h1ea; // 0.957031 
	end else 	if({~x[15],x[14:0]} < (16'h87e0)) begin // 3.937500
		bias = 16'h1f1; // 0.970703 
	end else 	if({~x[15],x[14:0]} < (16'h8a60)) begin // 5.187500
		bias = 16'h1f8; // 0.984375 
	end else begin
		bias = 16'h1ff; // 0.984375 
	end
end

endmodule
