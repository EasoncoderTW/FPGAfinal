module sigmoidPWL(
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
assign y = ((zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> 2'b11)) + bias_stage_reg;

	wire compare_slope_0 = ({~x[15],x[14:0]} < (16'h7000)); // -8.000000 
	wire compare_slope_1 = ({~x[15],x[14:0]} < (16'h7ab8)); // -2.640625 
	wire compare_slope_2 = ({~x[15],x[14:0]} < (16'h8548)); // 2.640625 

	wire compare_bias_0 = ({~x[15],x[14:0]} < (16'h76d0)); // -4.593750 
	wire compare_bias_1 = ({~x[15],x[14:0]} < (16'h78c0)); // -3.625000 
	wire compare_bias_2 = ({~x[15],x[14:0]} < (16'h79b8)); // -3.140625 
	wire compare_bias_3 = ({~x[15],x[14:0]} < (16'h7a68)); // -2.796875 
	wire compare_bias_4 = ({~x[15],x[14:0]} < (16'h7b28)); // -2.421875 
	wire compare_bias_5 = ({~x[15],x[14:0]} < (16'h7c60)); // -1.812500 
	wire compare_bias_6 = ({~x[15],x[14:0]} < (16'h7cf8)); // -1.515625 
	wire compare_bias_7 = ({~x[15],x[14:0]} < (16'h7dc0)); // -1.125000 
	wire compare_bias_8 = ({~x[15],x[14:0]} < (16'h7e40)); // -0.875000 
	wire compare_bias_9 = ({~x[15],x[14:0]} < (16'h7ea0)); // -0.687500 
	wire compare_bias_10 = ({~x[15],x[14:0]} < (16'h7ef0)); // -0.531250 
	wire compare_bias_11 = ({~x[15],x[14:0]} < (16'h7f40)); // -0.375000 
	wire compare_bias_12 = ({~x[15],x[14:0]} < (16'h7f88)); // -0.234375 
	wire compare_bias_13 = ({~x[15],x[14:0]} < (16'h7fd0)); // -0.093750 
	wire compare_bias_14 = ({~x[15],x[14:0]} < (16'h8018)); // 0.046875 
	wire compare_bias_15 = ({~x[15],x[14:0]} < (16'h8060)); // 0.187500 
	wire compare_bias_16 = ({~x[15],x[14:0]} < (16'h80a8)); // 0.328125 
	wire compare_bias_17 = ({~x[15],x[14:0]} < (16'h80f8)); // 0.484375 
	wire compare_bias_18 = ({~x[15],x[14:0]} < (16'h80148)); // 0.640625 
	wire compare_bias_19 = ({~x[15],x[14:0]} < (16'h81a0)); // 0.812500 
	wire compare_bias_20 = ({~x[15],x[14:0]} < (16'h8210)); // 1.031250 
	wire compare_bias_21 = ({~x[15],x[14:0]} < (16'h82b8)); // 1.359375 
	wire compare_bias_22 = ({~x[15],x[14:0]} < (16'h84a0)); // 2.312500 
	wire compare_bias_23 = ({~x[15],x[14:0]} < (16'h8548)); // 2.640625 
	wire compare_bias_24 = ({~x[15],x[14:0]} < (16'h85e0)); // 2.937500 
	wire compare_bias_25 = ({~x[15],x[14:0]} < (16'h86a8)); // 3.328125 
	wire compare_bias_26 = ({~x[15],x[14:0]} < (16'h87e0)); // 3.937500 
	wire compare_bias_27 = ({~x[15],x[14:0]} < (16'h8b38)); // 5.609375 

/**************** Compare and LUT *****************/
always @(*) begin
	if(compare_slope_0) begin // -8.000000 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_1) begin // -2.640625 
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(compare_slope_2) begin // 2.640625 
		zero = 0;
		x_delta = 16'hfab8;
	end else begin
		zero = 1;
		x_delta = 16'h548;
	end

	if(compare_bias_0) begin // -4.593750
		bias = 16'h0; // 0.000000 
	end else 	if(compare_bias_1) begin // -3.625000
		bias = 16'h8; // 0.015625 
	end else 	if(compare_bias_2) begin // -3.140625
		bias = 16'h10; // 0.031250 
	end else 	if(compare_bias_3) begin // -2.796875
		bias = 16'h18; // 0.046875 
	end else 	if(compare_bias_4) begin // -2.421875
		bias = 16'h21; // 0.064453 
	end else 	if(compare_bias_5) begin // -1.812500
		bias = 16'h18; // 0.046875 
	end else 	if(compare_bias_6) begin // -1.515625
		bias = 16'hf; // 0.029297 
	end else 	if(compare_bias_7) begin // -1.125000
		bias = 16'h17; // 0.044922 
	end else 	if(compare_bias_8) begin // -0.875000
		bias = 16'h20; // 0.062500 
	end else 	if(compare_bias_9) begin // -0.687500
		bias = 16'h29; // 0.080078 
	end else 	if(compare_bias_10) begin // -0.531250
		bias = 16'h31; // 0.095703 
	end else 	if(compare_bias_11) begin // -0.375000
		bias = 16'h3a; // 0.113281 
	end else 	if(compare_bias_12) begin // -0.234375
		bias = 16'h43; // 0.130859 
	end else 	if(compare_bias_13) begin // -0.093750
		bias = 16'h4b; // 0.146484 
	end else 	if(compare_bias_14) begin // 0.046875
		bias = 16'h54; // 0.164062 
	end else 	if(compare_bias_15) begin // 0.187500
		bias = 16'h5d; // 0.181641 
	end else 	if(compare_bias_16) begin // 0.328125
		bias = 16'h66; // 0.199219 
	end else 	if(compare_bias_17) begin // 0.484375
		bias = 16'h6f; // 0.216797 
	end else 	if(compare_bias_18) begin // 0.640625
		bias = 16'h78; // 0.234375 
	end else 	if(compare_bias_19) begin // 0.812500
		bias = 16'h80; // 0.250000 
	end else 	if(compare_bias_20) begin // 1.031250
		bias = 16'h89; // 0.267578 
	end else 	if(compare_bias_21) begin // 1.359375
		bias = 16'h92; // 0.285156 
	end else 	if(compare_bias_22) begin // 2.312500
		bias = 16'h9a; // 0.300781 
	end else 	if(compare_bias_23) begin // 2.640625
		bias = 16'h91; // 0.283203 
	end else 	if(compare_bias_24) begin // 2.937500
		bias = 16'h1e1; // 0.939453 
	end else 	if(compare_bias_25) begin // 3.328125
		bias = 16'h1e9; // 0.955078 
	end else 	if(compare_bias_26) begin // 3.937500
		bias = 16'h1f1; // 0.970703 
	end else 	if(compare_bias_27) begin // 5.609375
		bias = 16'h1f9; // 0.986328 
	end else begin
		bias = 16'h201; // 0.986328 
	end
end

endmodule
