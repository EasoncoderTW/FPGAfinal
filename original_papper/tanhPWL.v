module tanhPWL(
	input [15:0] x,
	output wire [15:0] y
);

reg [15:0] bias;
reg [15:0] x_delta;
reg zero;
wire [15:0] x_ = (x - x_delta);
assign y = ((zero)? 0: ({{16{x_[15]}},x_} >> 1'b1)) + bias;

/**************** Compare and LUT *****************/
always @(*) begin
	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h7d60)) begin // -1.312500 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h82a0)) begin // 1.312500 
		zero = 0;
		x_delta = 16'hfd60;
	end else begin
		zero = 1;
		x_delta = 16'h2a0;
	end

	if({~x[15],x[14:0]} < (16'h7000)) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h7a38)) begin // -2.890625
		bias = 16'hfdfe; // -1.003906 
	end else 	if({~x[15],x[14:0]} < (16'h7b80)) begin // -2.250000
		bias = 16'hfe06; // -0.988281 
	end else 	if({~x[15],x[14:0]} < (16'h7c10)) begin // -1.968750
		bias = 16'hfe0e; // -0.972656 
	end else 	if({~x[15],x[14:0]} < (16'h7c70)) begin // -1.781250
		bias = 16'hfe17; // -0.955078 
	end else 	if({~x[15],x[14:0]} < (16'h7cb8)) begin // -1.640625
		bias = 16'hfe1f; // -0.939453 
	end else 	if({~x[15],x[14:0]} < (16'h7cf0)) begin // -1.531250
		bias = 16'hfe28; // -0.921875 
	end else 	if({~x[15],x[14:0]} < (16'h7d20)) begin // -1.437500
		bias = 16'hfe31; // -0.904297 
	end else 	if({~x[15],x[14:0]} < (16'h7d48)) begin // -1.359375
		bias = 16'hfe3a; // -0.886719 
	end else 	if({~x[15],x[14:0]} < (16'h7d88)) begin // -1.234375
		bias = 16'hfe42; // -0.871094 
	end else 	if({~x[15],x[14:0]} < (16'h7db0)) begin // -1.156250
		bias = 16'hfe3a; // -0.886719 
	end else 	if({~x[15],x[14:0]} < (16'h7de8)) begin // -1.046875
		bias = 16'hfe32; // -0.902344 
	end else 	if({~x[15],x[14:0]} < (16'h7ea8)) begin // -0.671875
		bias = 16'hfe2a; // -0.917969 
	end else 	if({~x[15],x[14:0]} < (16'h7ed8)) begin // -0.578125
		bias = 16'hfe33; // -0.900391 
	end else 	if({~x[15],x[14:0]} < (16'h7ef8)) begin // -0.515625
		bias = 16'hfe3c; // -0.882812 
	end else 	if({~x[15],x[14:0]} < (16'h7f18)) begin // -0.453125
		bias = 16'hfe44; // -0.867188 
	end else 	if({~x[15],x[14:0]} < (16'h7f38)) begin // -0.390625
		bias = 16'hfe4e; // -0.847656 
	end else 	if({~x[15],x[14:0]} < (16'h7f50)) begin // -0.343750
		bias = 16'hfe59; // -0.826172 
	end else 	if({~x[15],x[14:0]} < (16'h7f68)) begin // -0.296875
		bias = 16'hfe62; // -0.808594 
	end else 	if({~x[15],x[14:0]} < (16'h7f80)) begin // -0.250000
		bias = 16'hfe6b; // -0.791016 
	end else 	if({~x[15],x[14:0]} < (16'h7f98)) begin // -0.203125
		bias = 16'hfe76; // -0.769531 
	end else 	if({~x[15],x[14:0]} < (16'h7fb0)) begin // -0.156250
		bias = 16'hfe80; // -0.750000 
	end else 	if({~x[15],x[14:0]} < (16'h7fc8)) begin // -0.109375
		bias = 16'hfe8c; // -0.726562 
	end else 	if({~x[15],x[14:0]} < (16'h7fe0)) begin // -0.062500
		bias = 16'hfe97; // -0.705078 
	end else 	if({~x[15],x[14:0]} < (16'h7ff8)) begin // -0.015625
		bias = 16'hfea3; // -0.681641 
	end else 	if({~x[15],x[14:0]} < (16'h8010)) begin // 0.031250
		bias = 16'hfeaf; // -0.658203 
	end else 	if({~x[15],x[14:0]} < (16'h8028)) begin // 0.078125
		bias = 16'hfebb; // -0.634766 
	end else 	if({~x[15],x[14:0]} < (16'h8040)) begin // 0.125000
		bias = 16'hfec7; // -0.611328 
	end else 	if({~x[15],x[14:0]} < (16'h8058)) begin // 0.171875
		bias = 16'hfed3; // -0.587891 
	end else 	if({~x[15],x[14:0]} < (16'h8070)) begin // 0.218750
		bias = 16'hfede; // -0.566406 
	end else 	if({~x[15],x[14:0]} < (16'h8088)) begin // 0.265625
		bias = 16'hfee9; // -0.544922 
	end else 	if({~x[15],x[14:0]} < (16'h80a0)) begin // 0.312500
		bias = 16'hfef4; // -0.523438 
	end else 	if({~x[15],x[14:0]} < (16'h80b8)) begin // 0.359375
		bias = 16'hfefe; // -0.503906 
	end else 	if({~x[15],x[14:0]} < (16'h80d0)) begin // 0.406250
		bias = 16'hff08; // -0.484375 
	end else 	if({~x[15],x[14:0]} < (16'h80e8)) begin // 0.453125
		bias = 16'hff10; // -0.468750 
	end else 	if({~x[15],x[14:0]} < (16'h8108)) begin // 0.515625
		bias = 16'hff18; // -0.453125 
	end else 	if({~x[15],x[14:0]} < (16'h8130)) begin // 0.593750
		bias = 16'hff22; // -0.433594 
	end else 	if({~x[15],x[14:0]} < (16'h8160)) begin // 0.687500
		bias = 16'hff2c; // -0.414062 
	end else 	if({~x[15],x[14:0]} < (16'h8240)) begin // 1.125000
		bias = 16'hff34; // -0.398438 
	end else 	if({~x[15],x[14:0]} < (16'h8270)) begin // 1.218750
		bias = 16'hff2c; // -0.414062 
	end else 	if({~x[15],x[14:0]} < (16'h8290)) begin // 1.281250
		bias = 16'hff24; // -0.429688 
	end else 	if({~x[15],x[14:0]} < (16'h82a0)) begin // 1.312500
		bias = 16'hff1d; // -0.443359 
	end else 	if({~x[15],x[14:0]} < (16'h82c0)) begin // 1.375000
		bias = 16'h1bd; // 0.869141 
	end else 	if({~x[15],x[14:0]} < (16'h82e8)) begin // 1.453125
		bias = 16'h1c5; // 0.884766 
	end else 	if({~x[15],x[14:0]} < (16'h8310)) begin // 1.531250
		bias = 16'h1cd; // 0.900391 
	end else 	if({~x[15],x[14:0]} < (16'h8340)) begin // 1.625000
		bias = 16'h1d4; // 0.914062 
	end else 	if({~x[15],x[14:0]} < (16'h8380)) begin // 1.750000
		bias = 16'h1dc; // 0.929688 
	end else 	if({~x[15],x[14:0]} < (16'h83c8)) begin // 1.890625
		bias = 16'h1e4; // 0.945312 
	end else 	if({~x[15],x[14:0]} < (16'h8428)) begin // 2.078125
		bias = 16'h1eb; // 0.958984 
	end else 	if({~x[15],x[14:0]} < (16'h84c0)) begin // 2.375000
		bias = 16'h1f2; // 0.972656 
	end else 	if({~x[15],x[14:0]} < (16'h8650)) begin // 3.156250
		bias = 16'h1f9; // 0.986328 
	end else begin
		bias = 16'h200; // 0.986328 
	end
end

endmodule
