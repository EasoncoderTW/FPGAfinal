module tanhPWL(
	input [15:0] x,
	output wire [15:0] y
);

reg [2:0] slope;
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
	end else 	if({~x[15],x[14:0]} < (16'h7e40)) begin // -0.875000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if({~x[15],x[14:0]} < (16'h81c0)) begin // 0.875000 
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'hfe40;
	end else begin
		slope = 16'h0; // 0.000000
		zero = 1;
		x_delta = 16'h1c0;
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
	end else 	if({~x[15],x[14:0]} < (16'h7d68)) begin // -1.296875
		bias = 16'hfe42; // -0.871094 
	end else 	if({~x[15],x[14:0]} < (16'h7d88)) begin // -1.234375
		bias = 16'hfe4a; // -0.855469 
	end else 	if({~x[15],x[14:0]} < (16'h7da8)) begin // -1.171875
		bias = 16'hfe53; // -0.837891 
	end else 	if({~x[15],x[14:0]} < (16'h7dc8)) begin // -1.109375
		bias = 16'hfe5d; // -0.818359 
	end else 	if({~x[15],x[14:0]} < (16'h7de0)) begin // -1.062500
		bias = 16'hfe67; // -0.798828 
	end else 	if({~x[15],x[14:0]} < (16'h7df8)) begin // -1.015625
		bias = 16'hfe70; // -0.781250 
	end else 	if({~x[15],x[14:0]} < (16'h7e10)) begin // -0.968750
		bias = 16'hfe7a; // -0.761719 
	end else 	if({~x[15],x[14:0]} < (16'h7e28)) begin // -0.921875
		bias = 16'hfe84; // -0.742188 
	end else 	if({~x[15],x[14:0]} < (16'h7e40)) begin // -0.875000
		bias = 16'hfe8f; // -0.720703 
	end else 	if({~x[15],x[14:0]} < (16'h7e48)) begin // -0.859375
		bias = 16'hfe9b; // -0.697266 
	end else 	if({~x[15],x[14:0]} < (16'h7e58)) begin // -0.828125
		bias = 16'hfe92; // -0.714844 
	end else 	if({~x[15],x[14:0]} < (16'h7e70)) begin // -0.781250
		bias = 16'hfe8a; // -0.730469 
	end else 	if({~x[15],x[14:0]} < (16'h7e88)) begin // -0.734375
		bias = 16'hfe7f; // -0.751953 
	end else 	if({~x[15],x[14:0]} < (16'h7ea0)) begin // -0.687500
		bias = 16'hfe76; // -0.769531 
	end else 	if({~x[15],x[14:0]} < (16'h7eb8)) begin // -0.640625
		bias = 16'hfe6d; // -0.787109 
	end else 	if({~x[15],x[14:0]} < (16'h7ed8)) begin // -0.578125
		bias = 16'hfe64; // -0.804688 
	end else 	if({~x[15],x[14:0]} < (16'h7ef8)) begin // -0.515625
		bias = 16'hfe5b; // -0.822266 
	end else 	if({~x[15],x[14:0]} < (16'h7f20)) begin // -0.437500
		bias = 16'hfe53; // -0.837891 
	end else 	if({~x[15],x[14:0]} < (16'h7f58)) begin // -0.328125
		bias = 16'hfe4b; // -0.853516 
	end else 	if({~x[15],x[14:0]} < (16'h8068)) begin // 0.203125
		bias = 16'hfe44; // -0.867188 
	end else 	if({~x[15],x[14:0]} < (16'h80c0)) begin // 0.375000
		bias = 16'hfe3d; // -0.880859 
	end else 	if({~x[15],x[14:0]} < (16'h80f0)) begin // 0.468750
		bias = 16'hfe35; // -0.896484 
	end else 	if({~x[15],x[14:0]} < (16'h8118)) begin // 0.546875
		bias = 16'hfe2e; // -0.910156 
	end else 	if({~x[15],x[14:0]} < (16'h8138)) begin // 0.609375
		bias = 16'hfe25; // -0.927734 
	end else 	if({~x[15],x[14:0]} < (16'h8150)) begin // 0.656250
		bias = 16'hfe1c; // -0.945312 
	end else 	if({~x[15],x[14:0]} < (16'h8168)) begin // 0.703125
		bias = 16'hfe15; // -0.958984 
	end else 	if({~x[15],x[14:0]} < (16'h8180)) begin // 0.750000
		bias = 16'hfe0c; // -0.976562 
	end else 	if({~x[15],x[14:0]} < (16'h8198)) begin // 0.796875
		bias = 16'hfe03; // -0.994141 
	end else 	if({~x[15],x[14:0]} < (16'h81b0)) begin // 0.843750
		bias = 16'hfdf9; // -1.013672 
	end else 	if({~x[15],x[14:0]} < (16'h81c0)) begin // 0.875000
		bias = 16'hfdee; // -1.035156 
	end else 	if({~x[15],x[14:0]} < (16'h81d0)) begin // 0.906250
		bias = 16'h16a; // 0.707031 
	end else 	if({~x[15],x[14:0]} < (16'h81e0)) begin // 0.937500
		bias = 16'h172; // 0.722656 
	end else 	if({~x[15],x[14:0]} < (16'h81f8)) begin // 0.984375
		bias = 16'h17a; // 0.738281 
	end else 	if({~x[15],x[14:0]} < (16'h8210)) begin // 1.031250
		bias = 16'h185; // 0.759766 
	end else 	if({~x[15],x[14:0]} < (16'h8228)) begin // 1.078125
		bias = 16'h18f; // 0.779297 
	end else 	if({~x[15],x[14:0]} < (16'h8240)) begin // 1.125000
		bias = 16'h198; // 0.796875 
	end else 	if({~x[15],x[14:0]} < (16'h8258)) begin // 1.171875
		bias = 16'h1a0; // 0.812500 
	end else 	if({~x[15],x[14:0]} < (16'h8270)) begin // 1.218750
		bias = 16'h1a8; // 0.828125 
	end else 	if({~x[15],x[14:0]} < (16'h8290)) begin // 1.281250
		bias = 16'h1b0; // 0.843750 
	end else 	if({~x[15],x[14:0]} < (16'h82b0)) begin // 1.343750
		bias = 16'h1b9; // 0.861328 
	end else 	if({~x[15],x[14:0]} < (16'h82d8)) begin // 1.421875
		bias = 16'h1c1; // 0.876953 
	end else 	if({~x[15],x[14:0]} < (16'h8300)) begin // 1.500000
		bias = 16'h1ca; // 0.894531 
	end else 	if({~x[15],x[14:0]} < (16'h8328)) begin // 1.578125
		bias = 16'h1d1; // 0.908203 
	end else 	if({~x[15],x[14:0]} < (16'h8360)) begin // 1.687500
		bias = 16'h1d8; // 0.921875 
	end else 	if({~x[15],x[14:0]} < (16'h83a0)) begin // 1.812500
		bias = 16'h1e0; // 0.937500 
	end else 	if({~x[15],x[14:0]} < (16'h83f0)) begin // 1.968750
		bias = 16'h1e7; // 0.951172 
	end else 	if({~x[15],x[14:0]} < (16'h8460)) begin // 2.187500
		bias = 16'h1ee; // 0.964844 
	end else 	if({~x[15],x[14:0]} < (16'h8528)) begin // 2.578125
		bias = 16'h1f5; // 0.978516 
	end else begin
		bias = 16'h1fc; // 0.978516 
	end
end

endmodule
