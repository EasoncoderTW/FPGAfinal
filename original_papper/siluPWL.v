module siluPWL(
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
	end else 	if({~x[15],x[14:0]} < (16'h8000)) begin // 0.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else begin
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'h0;
	end

	if({~x[15],x[14:0]} < (16'h7310)) begin // -6.468750
		bias = 16'h0; // 0.000000 
	end else 	if({~x[15],x[14:0]} < (16'h7528)) begin // -5.421875
		bias = 16'hfff9; // -0.013672 
	end else 	if({~x[15],x[14:0]} < (16'h7648)) begin // -4.859375
		bias = 16'hfff2; // -0.027344 
	end else 	if({~x[15],x[14:0]} < (16'h7718)) begin // -4.453125
		bias = 16'hffeb; // -0.041016 
	end else 	if({~x[15],x[14:0]} < (16'h77b8)) begin // -4.140625
		bias = 16'hffe4; // -0.054688 
	end else 	if({~x[15],x[14:0]} < (16'h7840)) begin // -3.875000
		bias = 16'hffdd; // -0.068359 
	end else 	if({~x[15],x[14:0]} < (16'h78b0)) begin // -3.656250
		bias = 16'hffd6; // -0.082031 
	end else 	if({~x[15],x[14:0]} < (16'h7918)) begin // -3.453125
		bias = 16'hffcf; // -0.095703 
	end else 	if({~x[15],x[14:0]} < (16'h7978)) begin // -3.265625
		bias = 16'hffc8; // -0.109375 
	end else 	if({~x[15],x[14:0]} < (16'h79d8)) begin // -3.078125
		bias = 16'hffc0; // -0.125000 
	end else 	if({~x[15],x[14:0]} < (16'h7a28)) begin // -2.921875
		bias = 16'hffb9; // -0.138672 
	end else 	if({~x[15],x[14:0]} < (16'h7a78)) begin // -2.765625
		bias = 16'hffb2; // -0.152344 
	end else 	if({~x[15],x[14:0]} < (16'h7ac8)) begin // -2.609375
		bias = 16'hffaa; // -0.167969 
	end else 	if({~x[15],x[14:0]} < (16'h7b18)) begin // -2.453125
		bias = 16'hffa2; // -0.183594 
	end else 	if({~x[15],x[14:0]} < (16'h7b68)) begin // -2.296875
		bias = 16'hff9a; // -0.199219 
	end else 	if({~x[15],x[14:0]} < (16'h7bb8)) begin // -2.140625
		bias = 16'hff92; // -0.214844 
	end else 	if({~x[15],x[14:0]} < (16'h7c08)) begin // -1.984375
		bias = 16'hff8b; // -0.228516 
	end else 	if({~x[15],x[14:0]} < (16'h7c60)) begin // -1.812500
		bias = 16'hff83; // -0.244141 
	end else 	if({~x[15],x[14:0]} < (16'h7cc8)) begin // -1.609375
		bias = 16'hff7c; // -0.257812 
	end else 	if({~x[15],x[14:0]} < (16'h7e30)) begin // -0.906250
		bias = 16'hff75; // -0.271484 
	end else 	if({~x[15],x[14:0]} < (16'h7e78)) begin // -0.765625
		bias = 16'hff7e; // -0.253906 
	end else 	if({~x[15],x[14:0]} < (16'h7eb0)) begin // -0.656250
		bias = 16'hff87; // -0.236328 
	end else 	if({~x[15],x[14:0]} < (16'h7ed8)) begin // -0.578125
		bias = 16'hff90; // -0.218750 
	end else 	if({~x[15],x[14:0]} < (16'h7f00)) begin // -0.500000
		bias = 16'hff99; // -0.201172 
	end else 	if({~x[15],x[14:0]} < (16'h7f20)) begin // -0.437500
		bias = 16'hffa2; // -0.183594 
	end else 	if({~x[15],x[14:0]} < (16'h7f40)) begin // -0.375000
		bias = 16'hffab; // -0.166016 
	end else 	if({~x[15],x[14:0]} < (16'h7f60)) begin // -0.312500
		bias = 16'hffb5; // -0.146484 
	end else 	if({~x[15],x[14:0]} < (16'h7f78)) begin // -0.265625
		bias = 16'hffbf; // -0.126953 
	end else 	if({~x[15],x[14:0]} < (16'h7f90)) begin // -0.218750
		bias = 16'hffc8; // -0.109375 
	end else 	if({~x[15],x[14:0]} < (16'h7fa8)) begin // -0.171875
		bias = 16'hffd1; // -0.091797 
	end else 	if({~x[15],x[14:0]} < (16'h7fc0)) begin // -0.125000
		bias = 16'hffdb; // -0.072266 
	end else 	if({~x[15],x[14:0]} < (16'h7fd8)) begin // -0.078125
		bias = 16'hffe5; // -0.052734 
	end else 	if({~x[15],x[14:0]} < (16'h7ff0)) begin // -0.031250
		bias = 16'hfff0; // -0.031250 
	end else 	if({~x[15],x[14:0]} < (16'h8018)) begin // 0.046875
		bias = 16'hfffb; // -0.009766 
	end else 	if({~x[15],x[14:0]} < (16'h8028)) begin // 0.078125
		bias = 16'hfff2; // -0.027344 
	end else 	if({~x[15],x[14:0]} < (16'h8038)) begin // 0.109375
		bias = 16'hffeb; // -0.041016 
	end else 	if({~x[15],x[14:0]} < (16'h8050)) begin // 0.156250
		bias = 16'hffe3; // -0.056641 
	end else 	if({~x[15],x[14:0]} < (16'h8068)) begin // 0.203125
		bias = 16'hffd9; // -0.076172 
	end else 	if({~x[15],x[14:0]} < (16'h8080)) begin // 0.250000
		bias = 16'hffcf; // -0.095703 
	end else 	if({~x[15],x[14:0]} < (16'h8098)) begin // 0.296875
		bias = 16'hffc6; // -0.113281 
	end else 	if({~x[15],x[14:0]} < (16'h80b0)) begin // 0.343750
		bias = 16'hffbd; // -0.130859 
	end else 	if({~x[15],x[14:0]} < (16'h80c8)) begin // 0.390625
		bias = 16'hffb5; // -0.146484 
	end else 	if({~x[15],x[14:0]} < (16'h80e8)) begin // 0.453125
		bias = 16'hffad; // -0.162109 
	end else 	if({~x[15],x[14:0]} < (16'h8108)) begin // 0.515625
		bias = 16'hffa4; // -0.179688 
	end else 	if({~x[15],x[14:0]} < (16'h8128)) begin // 0.578125
		bias = 16'hff9b; // -0.197266 
	end else 	if({~x[15],x[14:0]} < (16'h8148)) begin // 0.640625
		bias = 16'hff94; // -0.210938 
	end else 	if({~x[15],x[14:0]} < (16'h8170)) begin // 0.718750
		bias = 16'hff8d; // -0.224609 
	end else 	if({~x[15],x[14:0]} < (16'h81a8)) begin // 0.828125
		bias = 16'hff85; // -0.240234 
	end else 	if({~x[15],x[14:0]} < (16'h81f0)) begin // 0.968750
		bias = 16'hff7d; // -0.255859 
	end else 	if({~x[15],x[14:0]} < (16'h8370)) begin // 1.718750
		bias = 16'hff75; // -0.271484 
	end else 	if({~x[15],x[14:0]} < (16'h83d8)) begin // 1.921875
		bias = 16'hff7d; // -0.255859 
	end else 	if({~x[15],x[14:0]} < (16'h8430)) begin // 2.093750
		bias = 16'hff85; // -0.240234 
	end else 	if({~x[15],x[14:0]} < (16'h8480)) begin // 2.250000
		bias = 16'hff8d; // -0.224609 
	end else 	if({~x[15],x[14:0]} < (16'h84d8)) begin // 2.421875
		bias = 16'hff95; // -0.208984 
	end else 	if({~x[15],x[14:0]} < (16'h8530)) begin // 2.593750
		bias = 16'hff9e; // -0.191406 
	end else 	if({~x[15],x[14:0]} < (16'h8588)) begin // 2.765625
		bias = 16'hffa7; // -0.173828 
	end else 	if({~x[15],x[14:0]} < (16'h85e0)) begin // 2.937500
		bias = 16'hffaf; // -0.158203 
	end else 	if({~x[15],x[14:0]} < (16'h8640)) begin // 3.125000
		bias = 16'hffb7; // -0.142578 
	end else 	if({~x[15],x[14:0]} < (16'h86b0)) begin // 3.343750
		bias = 16'hffc0; // -0.125000 
	end else 	if({~x[15],x[14:0]} < (16'h8728)) begin // 3.578125
		bias = 16'hffc9; // -0.107422 
	end else 	if({~x[15],x[14:0]} < (16'h87a8)) begin // 3.828125
		bias = 16'hffd1; // -0.091797 
	end else 	if({~x[15],x[14:0]} < (16'h8840)) begin // 4.125000
		bias = 16'hffd9; // -0.076172 
	end else 	if({~x[15],x[14:0]} < (16'h88f8)) begin // 4.484375
		bias = 16'hffe1; // -0.060547 
	end else 	if({~x[15],x[14:0]} < (16'h89e8)) begin // 4.953125
		bias = 16'hffe9; // -0.044922 
	end else 	if({~x[15],x[14:0]} < (16'h8b60)) begin // 5.687500
		bias = 16'hfff1; // -0.029297 
	end else 	if({~x[15],x[14:0]} < (16'h8f48)) begin // 7.640625
		bias = 16'hfff9; // -0.013672 
	end else begin
		bias = 16'h0; // -0.013672 
	end
end

endmodule
