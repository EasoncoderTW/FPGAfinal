module tanhPWL(
	input clk,
	input rst_n,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [15:0] bias, bias_stage_reg;
reg signed [15:0] x_delta, x_stage_reg;
reg zero, zero_stage_reg;
always @(posedge clk) begin
	if(~rst_n) begin
		bias_stage_reg <= 0;
		x_stage_reg <= 0;
		zero_stage_reg <= 0;
	end else begin
		bias_stage_reg <= bias;
		x_stage_reg <= (x - x_delta);
		zero_stage_reg <= zero;
	end
end
assign y = ((zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> 1'b1)) + bias_stage_reg;

	wire compare_slope_0 = ({~x[15],x[14:0]} < (16'h7000)); // -8.000000 
	wire compare_slope_1 = ({~x[15],x[14:0]} < (16'h7d60)); // -1.312500 
	wire compare_slope_2 = ({~x[15],x[14:0]} < (16'h82a0)); // 1.312500 

	wire compare_bias_0 = ({~x[15],x[14:0]} < (16'h7000)); // -8.000000 
	wire compare_bias_1 = ({~x[15],x[14:0]} < (16'h7a80)); // -2.750000 
	wire compare_bias_2 = ({~x[15],x[14:0]} < (16'h7b80)); // -2.250000 
	wire compare_bias_3 = ({~x[15],x[14:0]} < (16'h7c00)); // -2.000000 
	wire compare_bias_4 = ({~x[15],x[14:0]} < (16'h7c60)); // -1.812500 
	wire compare_bias_5 = ({~x[15],x[14:0]} < (16'h7ca8)); // -1.671875 
	wire compare_bias_6 = ({~x[15],x[14:0]} < (16'h7ce0)); // -1.562500 
	wire compare_bias_7 = ({~x[15],x[14:0]} < (16'h7d10)); // -1.468750 
	wire compare_bias_8 = ({~x[15],x[14:0]} < (16'h7d38)); // -1.390625 
	wire compare_bias_9 = ({~x[15],x[14:0]} < (16'h7d58)); // -1.328125 
	wire compare_bias_10 = ({~x[15],x[14:0]} < (16'h7d78)); // -1.265625 
	wire compare_bias_11 = ({~x[15],x[14:0]} < (16'h7d98)); // -1.203125 
	wire compare_bias_12 = ({~x[15],x[14:0]} < (16'h7dc0)); // -1.125000 
	wire compare_bias_13 = ({~x[15],x[14:0]} < (16'h7df8)); // -1.015625 
	wire compare_bias_14 = ({~x[15],x[14:0]} < (16'h7ea8)); // -0.671875 
	wire compare_bias_15 = ({~x[15],x[14:0]} < (16'h7ed0)); // -0.593750 
	wire compare_bias_16 = ({~x[15],x[14:0]} < (16'h7ef0)); // -0.531250 
	wire compare_bias_17 = ({~x[15],x[14:0]} < (16'h7f10)); // -0.468750 
	wire compare_bias_18 = ({~x[15],x[14:0]} < (16'h7f28)); // -0.421875 
	wire compare_bias_19 = ({~x[15],x[14:0]} < (16'h7f40)); // -0.375000 
	wire compare_bias_20 = ({~x[15],x[14:0]} < (16'h7f58)); // -0.328125 
	wire compare_bias_21 = ({~x[15],x[14:0]} < (16'h7f70)); // -0.281250 
	wire compare_bias_22 = ({~x[15],x[14:0]} < (16'h7f88)); // -0.234375 
	wire compare_bias_23 = ({~x[15],x[14:0]} < (16'h7f98)); // -0.203125 
	wire compare_bias_24 = ({~x[15],x[14:0]} < (16'h7fb0)); // -0.156250 
	wire compare_bias_25 = ({~x[15],x[14:0]} < (16'h7fc0)); // -0.125000 
	wire compare_bias_26 = ({~x[15],x[14:0]} < (16'h7fd0)); // -0.093750 
	wire compare_bias_27 = ({~x[15],x[14:0]} < (16'h7fe0)); // -0.062500 
	wire compare_bias_28 = ({~x[15],x[14:0]} < (16'h7ff0)); // -0.031250 
	wire compare_bias_29 = ({~x[15],x[14:0]} < (16'h8000)); // 0.000000 
	wire compare_bias_30 = ({~x[15],x[14:0]} < (16'h8010)); // 0.031250 
	wire compare_bias_31 = ({~x[15],x[14:0]} < (16'h8020)); // 0.062500 
	wire compare_bias_32 = ({~x[15],x[14:0]} < (16'h8030)); // 0.093750 
	wire compare_bias_33 = ({~x[15],x[14:0]} < (16'h8040)); // 0.125000 
	wire compare_bias_34 = ({~x[15],x[14:0]} < (16'h8050)); // 0.156250 
	wire compare_bias_35 = ({~x[15],x[14:0]} < (16'h8060)); // 0.187500 
	wire compare_bias_36 = ({~x[15],x[14:0]} < (16'h8070)); // 0.218750 
	wire compare_bias_37 = ({~x[15],x[14:0]} < (16'h8080)); // 0.250000 
	wire compare_bias_38 = ({~x[15],x[14:0]} < (16'h8098)); // 0.296875 
	wire compare_bias_39 = ({~x[15],x[14:0]} < (16'h80b0)); // 0.343750 
	wire compare_bias_40 = ({~x[15],x[14:0]} < (16'h80c8)); // 0.390625 
	wire compare_bias_41 = ({~x[15],x[14:0]} < (16'h80e0)); // 0.437500 
	wire compare_bias_42 = ({~x[15],x[14:0]} < (16'h80f8)); // 0.484375 
	wire compare_bias_43 = ({~x[15],x[14:0]} < (16'h8118)); // 0.546875 
	wire compare_bias_44 = ({~x[15],x[14:0]} < (16'h8138)); // 0.609375 
	wire compare_bias_45 = ({~x[15],x[14:0]} < (16'h8168)); // 0.703125 
	wire compare_bias_46 = ({~x[15],x[14:0]} < (16'h8238)); // 1.109375 
	wire compare_bias_47 = ({~x[15],x[14:0]} < (16'h8260)); // 1.187500 
	wire compare_bias_48 = ({~x[15],x[14:0]} < (16'h8280)); // 1.250000 
	wire compare_bias_49 = ({~x[15],x[14:0]} < (16'h82a0)); // 1.312500 
	wire compare_bias_50 = ({~x[15],x[14:0]} < (16'h82c0)); // 1.375000 
	wire compare_bias_51 = ({~x[15],x[14:0]} < (16'h82e0)); // 1.437500 
	wire compare_bias_52 = ({~x[15],x[14:0]} < (16'h8300)); // 1.500000 
	wire compare_bias_53 = ({~x[15],x[14:0]} < (16'h8328)); // 1.578125 
	wire compare_bias_54 = ({~x[15],x[14:0]} < (16'h8358)); // 1.671875 
	wire compare_bias_55 = ({~x[15],x[14:0]} < (16'h8390)); // 1.781250 
	wire compare_bias_56 = ({~x[15],x[14:0]} < (16'h83d8)); // 1.921875 
	wire compare_bias_57 = ({~x[15],x[14:0]} < (16'h8438)); // 2.109375 
	wire compare_bias_58 = ({~x[15],x[14:0]} < (16'h84c0)); // 2.375000 
	wire compare_bias_59 = ({~x[15],x[14:0]} < (16'h85e0)); // 2.937500 

/**************** Compare and LUT *****************/
always @(*) begin
	if(compare_slope_0) begin // -8.000000 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_1) begin // -1.312500 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_2) begin // 1.312500 
		zero = 0;
		x_delta = 16'hfd60;
	end else begin
		zero = 1;
		x_delta = 16'h2a0;
	end

	if(compare_bias_0) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if(compare_bias_1) begin // -2.750000
		bias = 16'hfdff; // -1.001953 
	end else 	if(compare_bias_2) begin // -2.250000
		bias = 16'hfe06; // -0.988281 
	end else 	if(compare_bias_3) begin // -2.000000
		bias = 16'hfe0d; // -0.974609 
	end else 	if(compare_bias_4) begin // -1.812500
		bias = 16'hfe15; // -0.958984 
	end else 	if(compare_bias_5) begin // -1.671875
		bias = 16'hfe1d; // -0.943359 
	end else 	if(compare_bias_6) begin // -1.562500
		bias = 16'hfe25; // -0.927734 
	end else 	if(compare_bias_7) begin // -1.468750
		bias = 16'hfe2d; // -0.912109 
	end else 	if(compare_bias_8) begin // -1.390625
		bias = 16'hfe36; // -0.894531 
	end else 	if(compare_bias_9) begin // -1.328125
		bias = 16'hfe3e; // -0.878906 
	end else 	if(compare_bias_10) begin // -1.265625
		bias = 16'hfe45; // -0.865234 
	end else 	if(compare_bias_11) begin // -1.203125
		bias = 16'hfe3e; // -0.878906 
	end else 	if(compare_bias_12) begin // -1.125000
		bias = 16'hfe38; // -0.890625 
	end else 	if(compare_bias_13) begin // -1.015625
		bias = 16'hfe30; // -0.906250 
	end else 	if(compare_bias_14) begin // -0.671875
		bias = 16'hfe2a; // -0.917969 
	end else 	if(compare_bias_15) begin // -0.593750
		bias = 16'hfe32; // -0.902344 
	end else 	if(compare_bias_16) begin // -0.531250
		bias = 16'hfe39; // -0.888672 
	end else 	if(compare_bias_17) begin // -0.468750
		bias = 16'hfe41; // -0.873047 
	end else 	if(compare_bias_18) begin // -0.421875
		bias = 16'hfe4a; // -0.855469 
	end else 	if(compare_bias_19) begin // -0.375000
		bias = 16'hfe52; // -0.839844 
	end else 	if(compare_bias_20) begin // -0.328125
		bias = 16'hfe5b; // -0.822266 
	end else 	if(compare_bias_21) begin // -0.281250
		bias = 16'hfe64; // -0.804688 
	end else 	if(compare_bias_22) begin // -0.234375
		bias = 16'hfe6e; // -0.785156 
	end else 	if(compare_bias_23) begin // -0.203125
		bias = 16'hfe78; // -0.765625 
	end else 	if(compare_bias_24) begin // -0.156250
		bias = 16'hfe80; // -0.750000 
	end else 	if(compare_bias_25) begin // -0.125000
		bias = 16'hfe8b; // -0.728516 
	end else 	if(compare_bias_26) begin // -0.093750
		bias = 16'hfe92; // -0.714844 
	end else 	if(compare_bias_27) begin // -0.062500
		bias = 16'hfe9a; // -0.699219 
	end else 	if(compare_bias_28) begin // -0.031250
		bias = 16'hfea2; // -0.683594 
	end else 	if(compare_bias_29) begin // 0.000000
		bias = 16'hfeaa; // -0.667969 
	end else 	if(compare_bias_30) begin // 0.031250
		bias = 16'hfeb2; // -0.652344 
	end else 	if(compare_bias_31) begin // 0.062500
		bias = 16'hfeba; // -0.636719 
	end else 	if(compare_bias_32) begin // 0.093750
		bias = 16'hfec2; // -0.621094 
	end else 	if(compare_bias_33) begin // 0.125000
		bias = 16'hfeca; // -0.605469 
	end else 	if(compare_bias_34) begin // 0.156250
		bias = 16'hfed2; // -0.589844 
	end else 	if(compare_bias_35) begin // 0.187500
		bias = 16'hfed9; // -0.576172 
	end else 	if(compare_bias_36) begin // 0.218750
		bias = 16'hfee1; // -0.560547 
	end else 	if(compare_bias_37) begin // 0.250000
		bias = 16'hfee8; // -0.546875 
	end else 	if(compare_bias_38) begin // 0.296875
		bias = 16'hfef0; // -0.531250 
	end else 	if(compare_bias_39) begin // 0.343750
		bias = 16'hfefa; // -0.511719 
	end else 	if(compare_bias_40) begin // 0.390625
		bias = 16'hff04; // -0.492188 
	end else 	if(compare_bias_41) begin // 0.437500
		bias = 16'hff0d; // -0.474609 
	end else 	if(compare_bias_42) begin // 0.484375
		bias = 16'hff15; // -0.458984 
	end else 	if(compare_bias_43) begin // 0.546875
		bias = 16'hff1c; // -0.445312 
	end else 	if(compare_bias_44) begin // 0.609375
		bias = 16'hff25; // -0.427734 
	end else 	if(compare_bias_45) begin // 0.703125
		bias = 16'hff2d; // -0.412109 
	end else 	if(compare_bias_46) begin // 1.109375
		bias = 16'hff35; // -0.396484 
	end else 	if(compare_bias_47) begin // 1.187500
		bias = 16'hff2e; // -0.410156 
	end else 	if(compare_bias_48) begin // 1.250000
		bias = 16'hff28; // -0.421875 
	end else 	if(compare_bias_49) begin // 1.312500
		bias = 16'hff21; // -0.435547 
	end else 	if(compare_bias_50) begin // 1.375000
		bias = 16'h1bc; // 0.867188 
	end else 	if(compare_bias_51) begin // 1.437500
		bias = 16'h1c4; // 0.882812 
	end else 	if(compare_bias_52) begin // 1.500000
		bias = 16'h1ca; // 0.894531 
	end else 	if(compare_bias_53) begin // 1.578125
		bias = 16'h1d1; // 0.908203 
	end else 	if(compare_bias_54) begin // 1.671875
		bias = 16'h1d7; // 0.919922 
	end else 	if(compare_bias_55) begin // 1.781250
		bias = 16'h1de; // 0.933594 
	end else 	if(compare_bias_56) begin // 1.921875
		bias = 16'h1e5; // 0.947266 
	end else 	if(compare_bias_57) begin // 2.109375
		bias = 16'h1ec; // 0.960938 
	end else 	if(compare_bias_58) begin // 2.375000
		bias = 16'h1f2; // 0.972656 
	end else 	if(compare_bias_59) begin // 2.937500
		bias = 16'h1f8; // 0.984375 
	end else begin
		bias = 16'h1fe; // 0.984375 
	end
end

endmodule
