module siluPWL(
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
assign y = ((zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} )) + bias_stage_reg;

	wire compare_slope_0 = ({~x[15],x[14:0]} < (16'h7000)); // -8.000000 
	wire compare_slope_1 = ({~x[15],x[14:0]} < (16'h8000)); // 0.000000 

	wire compare_bias_0 = ({~x[15],x[14:0]} < (16'h7310)); // -6.468750 
	wire compare_bias_1 = ({~x[15],x[14:0]} < (16'h7528)); // -5.421875 
	wire compare_bias_2 = ({~x[15],x[14:0]} < (16'h7648)); // -4.859375 
	wire compare_bias_3 = ({~x[15],x[14:0]} < (16'h7718)); // -4.453125 
	wire compare_bias_4 = ({~x[15],x[14:0]} < (16'h77b8)); // -4.140625 
	wire compare_bias_5 = ({~x[15],x[14:0]} < (16'h7840)); // -3.875000 
	wire compare_bias_6 = ({~x[15],x[14:0]} < (16'h78b0)); // -3.656250 
	wire compare_bias_7 = ({~x[15],x[14:0]} < (16'h7918)); // -3.453125 
	wire compare_bias_8 = ({~x[15],x[14:0]} < (16'h7978)); // -3.265625 
	wire compare_bias_9 = ({~x[15],x[14:0]} < (16'h79d8)); // -3.078125 
	wire compare_bias_10 = ({~x[15],x[14:0]} < (16'h7a28)); // -2.921875 
	wire compare_bias_11 = ({~x[15],x[14:0]} < (16'h7a78)); // -2.765625 
	wire compare_bias_12 = ({~x[15],x[14:0]} < (16'h7ac8)); // -2.609375 
	wire compare_bias_13 = ({~x[15],x[14:0]} < (16'h7b18)); // -2.453125 
	wire compare_bias_14 = ({~x[15],x[14:0]} < (16'h7b68)); // -2.296875 
	wire compare_bias_15 = ({~x[15],x[14:0]} < (16'h7bb8)); // -2.140625 
	wire compare_bias_16 = ({~x[15],x[14:0]} < (16'h7c08)); // -1.984375 
	wire compare_bias_17 = ({~x[15],x[14:0]} < (16'h7c60)); // -1.812500 
	wire compare_bias_18 = ({~x[15],x[14:0]} < (16'h7cc8)); // -1.609375 
	wire compare_bias_19 = ({~x[15],x[14:0]} < (16'h7e30)); // -0.906250 
	wire compare_bias_20 = ({~x[15],x[14:0]} < (16'h7e78)); // -0.765625 
	wire compare_bias_21 = ({~x[15],x[14:0]} < (16'h7eb0)); // -0.656250 
	wire compare_bias_22 = ({~x[15],x[14:0]} < (16'h7ed8)); // -0.578125 
	wire compare_bias_23 = ({~x[15],x[14:0]} < (16'h7f00)); // -0.500000 
	wire compare_bias_24 = ({~x[15],x[14:0]} < (16'h7f20)); // -0.437500 
	wire compare_bias_25 = ({~x[15],x[14:0]} < (16'h7f40)); // -0.375000 
	wire compare_bias_26 = ({~x[15],x[14:0]} < (16'h7f60)); // -0.312500 
	wire compare_bias_27 = ({~x[15],x[14:0]} < (16'h7f78)); // -0.265625 
	wire compare_bias_28 = ({~x[15],x[14:0]} < (16'h7f90)); // -0.218750 
	wire compare_bias_29 = ({~x[15],x[14:0]} < (16'h7fa8)); // -0.171875 
	wire compare_bias_30 = ({~x[15],x[14:0]} < (16'h7fc0)); // -0.125000 
	wire compare_bias_31 = ({~x[15],x[14:0]} < (16'h7fd8)); // -0.078125 
	wire compare_bias_32 = ({~x[15],x[14:0]} < (16'h7ff0)); // -0.031250 
	wire compare_bias_33 = ({~x[15],x[14:0]} < (16'h8018)); // 0.046875 
	wire compare_bias_34 = ({~x[15],x[14:0]} < (16'h8028)); // 0.078125 
	wire compare_bias_35 = ({~x[15],x[14:0]} < (16'h8038)); // 0.109375 
	wire compare_bias_36 = ({~x[15],x[14:0]} < (16'h8050)); // 0.156250 
	wire compare_bias_37 = ({~x[15],x[14:0]} < (16'h8068)); // 0.203125 
	wire compare_bias_38 = ({~x[15],x[14:0]} < (16'h8080)); // 0.250000 
	wire compare_bias_39 = ({~x[15],x[14:0]} < (16'h8098)); // 0.296875 
	wire compare_bias_40 = ({~x[15],x[14:0]} < (16'h80b0)); // 0.343750 
	wire compare_bias_41 = ({~x[15],x[14:0]} < (16'h80c8)); // 0.390625 
	wire compare_bias_42 = ({~x[15],x[14:0]} < (16'h80e8)); // 0.453125 
	wire compare_bias_43 = ({~x[15],x[14:0]} < (16'h8108)); // 0.515625 
	wire compare_bias_44 = ({~x[15],x[14:0]} < (16'h8128)); // 0.578125 
	wire compare_bias_45 = ({~x[15],x[14:0]} < (16'h8148)); // 0.640625 
	wire compare_bias_46 = ({~x[15],x[14:0]} < (16'h8170)); // 0.718750 
	wire compare_bias_47 = ({~x[15],x[14:0]} < (16'h81a8)); // 0.828125 
	wire compare_bias_48 = ({~x[15],x[14:0]} < (16'h81f0)); // 0.968750 
	wire compare_bias_49 = ({~x[15],x[14:0]} < (16'h8370)); // 1.718750 
	wire compare_bias_50 = ({~x[15],x[14:0]} < (16'h83d8)); // 1.921875 
	wire compare_bias_51 = ({~x[15],x[14:0]} < (16'h8430)); // 2.093750 
	wire compare_bias_52 = ({~x[15],x[14:0]} < (16'h8480)); // 2.250000 
	wire compare_bias_53 = ({~x[15],x[14:0]} < (16'h84d8)); // 2.421875 
	wire compare_bias_54 = ({~x[15],x[14:0]} < (16'h8530)); // 2.593750 
	wire compare_bias_55 = ({~x[15],x[14:0]} < (16'h8588)); // 2.765625 
	wire compare_bias_56 = ({~x[15],x[14:0]} < (16'h85e0)); // 2.937500 
	wire compare_bias_57 = ({~x[15],x[14:0]} < (16'h8640)); // 3.125000 
	wire compare_bias_58 = ({~x[15],x[14:0]} < (16'h86b0)); // 3.343750 
	wire compare_bias_59 = ({~x[15],x[14:0]} < (16'h8728)); // 3.578125 
	wire compare_bias_60 = ({~x[15],x[14:0]} < (16'h87a8)); // 3.828125 
	wire compare_bias_61 = ({~x[15],x[14:0]} < (16'h8840)); // 4.125000 
	wire compare_bias_62 = ({~x[15],x[14:0]} < (16'h88f8)); // 4.484375 
	wire compare_bias_63 = ({~x[15],x[14:0]} < (16'h89e8)); // 4.953125 
	wire compare_bias_64 = ({~x[15],x[14:0]} < (16'h8b60)); // 5.687500 
	wire compare_bias_65 = ({~x[15],x[14:0]} < (16'h8f48)); // 7.640625 

/**************** Compare and LUT *****************/
always @(*) begin
	if(compare_slope_0) begin // -8.000000 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_1) begin // 0.000000 
		zero = 1;
		x_delta = 16'hf000;
	end else begin
		zero = 0;
		x_delta = 16'h0;
	end

	if(compare_bias_0) begin // -6.468750
		bias = 16'h0; // 0.000000 
	end else 	if(compare_bias_1) begin // -5.421875
		bias = 16'hfff9; // -0.013672 
	end else 	if(compare_bias_2) begin // -4.859375
		bias = 16'hfff2; // -0.027344 
	end else 	if(compare_bias_3) begin // -4.453125
		bias = 16'hffeb; // -0.041016 
	end else 	if(compare_bias_4) begin // -4.140625
		bias = 16'hffe4; // -0.054688 
	end else 	if(compare_bias_5) begin // -3.875000
		bias = 16'hffdd; // -0.068359 
	end else 	if(compare_bias_6) begin // -3.656250
		bias = 16'hffd6; // -0.082031 
	end else 	if(compare_bias_7) begin // -3.453125
		bias = 16'hffcf; // -0.095703 
	end else 	if(compare_bias_8) begin // -3.265625
		bias = 16'hffc8; // -0.109375 
	end else 	if(compare_bias_9) begin // -3.078125
		bias = 16'hffc0; // -0.125000 
	end else 	if(compare_bias_10) begin // -2.921875
		bias = 16'hffb9; // -0.138672 
	end else 	if(compare_bias_11) begin // -2.765625
		bias = 16'hffb2; // -0.152344 
	end else 	if(compare_bias_12) begin // -2.609375
		bias = 16'hffaa; // -0.167969 
	end else 	if(compare_bias_13) begin // -2.453125
		bias = 16'hffa2; // -0.183594 
	end else 	if(compare_bias_14) begin // -2.296875
		bias = 16'hff9a; // -0.199219 
	end else 	if(compare_bias_15) begin // -2.140625
		bias = 16'hff92; // -0.214844 
	end else 	if(compare_bias_16) begin // -1.984375
		bias = 16'hff8b; // -0.228516 
	end else 	if(compare_bias_17) begin // -1.812500
		bias = 16'hff83; // -0.244141 
	end else 	if(compare_bias_18) begin // -1.609375
		bias = 16'hff7c; // -0.257812 
	end else 	if(compare_bias_19) begin // -0.906250
		bias = 16'hff75; // -0.271484 
	end else 	if(compare_bias_20) begin // -0.765625
		bias = 16'hff7e; // -0.253906 
	end else 	if(compare_bias_21) begin // -0.656250
		bias = 16'hff87; // -0.236328 
	end else 	if(compare_bias_22) begin // -0.578125
		bias = 16'hff90; // -0.218750 
	end else 	if(compare_bias_23) begin // -0.500000
		bias = 16'hff99; // -0.201172 
	end else 	if(compare_bias_24) begin // -0.437500
		bias = 16'hffa2; // -0.183594 
	end else 	if(compare_bias_25) begin // -0.375000
		bias = 16'hffab; // -0.166016 
	end else 	if(compare_bias_26) begin // -0.312500
		bias = 16'hffb5; // -0.146484 
	end else 	if(compare_bias_27) begin // -0.265625
		bias = 16'hffbf; // -0.126953 
	end else 	if(compare_bias_28) begin // -0.218750
		bias = 16'hffc8; // -0.109375 
	end else 	if(compare_bias_29) begin // -0.171875
		bias = 16'hffd1; // -0.091797 
	end else 	if(compare_bias_30) begin // -0.125000
		bias = 16'hffdb; // -0.072266 
	end else 	if(compare_bias_31) begin // -0.078125
		bias = 16'hffe5; // -0.052734 
	end else 	if(compare_bias_32) begin // -0.031250
		bias = 16'hfff0; // -0.031250 
	end else 	if(compare_bias_33) begin // 0.046875
		bias = 16'hfffb; // -0.009766 
	end else 	if(compare_bias_34) begin // 0.078125
		bias = 16'hfff2; // -0.027344 
	end else 	if(compare_bias_35) begin // 0.109375
		bias = 16'hffeb; // -0.041016 
	end else 	if(compare_bias_36) begin // 0.156250
		bias = 16'hffe3; // -0.056641 
	end else 	if(compare_bias_37) begin // 0.203125
		bias = 16'hffd9; // -0.076172 
	end else 	if(compare_bias_38) begin // 0.250000
		bias = 16'hffcf; // -0.095703 
	end else 	if(compare_bias_39) begin // 0.296875
		bias = 16'hffc6; // -0.113281 
	end else 	if(compare_bias_40) begin // 0.343750
		bias = 16'hffbd; // -0.130859 
	end else 	if(compare_bias_41) begin // 0.390625
		bias = 16'hffb5; // -0.146484 
	end else 	if(compare_bias_42) begin // 0.453125
		bias = 16'hffad; // -0.162109 
	end else 	if(compare_bias_43) begin // 0.515625
		bias = 16'hffa4; // -0.179688 
	end else 	if(compare_bias_44) begin // 0.578125
		bias = 16'hff9b; // -0.197266 
	end else 	if(compare_bias_45) begin // 0.640625
		bias = 16'hff94; // -0.210938 
	end else 	if(compare_bias_46) begin // 0.718750
		bias = 16'hff8d; // -0.224609 
	end else 	if(compare_bias_47) begin // 0.828125
		bias = 16'hff85; // -0.240234 
	end else 	if(compare_bias_48) begin // 0.968750
		bias = 16'hff7d; // -0.255859 
	end else 	if(compare_bias_49) begin // 1.718750
		bias = 16'hff75; // -0.271484 
	end else 	if(compare_bias_50) begin // 1.921875
		bias = 16'hff7d; // -0.255859 
	end else 	if(compare_bias_51) begin // 2.093750
		bias = 16'hff85; // -0.240234 
	end else 	if(compare_bias_52) begin // 2.250000
		bias = 16'hff8d; // -0.224609 
	end else 	if(compare_bias_53) begin // 2.421875
		bias = 16'hff95; // -0.208984 
	end else 	if(compare_bias_54) begin // 2.593750
		bias = 16'hff9e; // -0.191406 
	end else 	if(compare_bias_55) begin // 2.765625
		bias = 16'hffa7; // -0.173828 
	end else 	if(compare_bias_56) begin // 2.937500
		bias = 16'hffaf; // -0.158203 
	end else 	if(compare_bias_57) begin // 3.125000
		bias = 16'hffb7; // -0.142578 
	end else 	if(compare_bias_58) begin // 3.343750
		bias = 16'hffc0; // -0.125000 
	end else 	if(compare_bias_59) begin // 3.578125
		bias = 16'hffc9; // -0.107422 
	end else 	if(compare_bias_60) begin // 3.828125
		bias = 16'hffd1; // -0.091797 
	end else 	if(compare_bias_61) begin // 4.125000
		bias = 16'hffd9; // -0.076172 
	end else 	if(compare_bias_62) begin // 4.484375
		bias = 16'hffe1; // -0.060547 
	end else 	if(compare_bias_63) begin // 4.953125
		bias = 16'hffe9; // -0.044922 
	end else 	if(compare_bias_64) begin // 5.687500
		bias = 16'hfff1; // -0.029297 
	end else 	if(compare_bias_65) begin // 7.640625
		bias = 16'hfff9; // -0.013672 
	end else begin
		bias = 16'h0; // -0.013672 
	end
end

endmodule
