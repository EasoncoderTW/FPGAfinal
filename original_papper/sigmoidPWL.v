module sigmoidPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

// reg signed [2:0] slope, slope_stage_reg;
reg signed [5:0] bias, bias_stage_reg;
reg signed [15:0] x_delta, x_stage_reg;
reg zero, zero_stage_reg;
always @(posedge clk) begin
	if(~rst) begin
		// slope_stage_reg <= 0;
		bias_stage_reg <= 0;
		x_stage_reg <= 0;
		zero_stage_reg <= 0;
	end else begin
		// slope_stage_reg <= slope;
		bias_stage_reg <= bias;
		x_stage_reg <= (x - x_delta);
		zero_stage_reg <= zero;
	end
end
assign y = (zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> 2'b11) + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
	if(x < $signed(16'hf000)) begin // -8.000000 
		// slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfab8)) begin // -2.640625 
		// slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'h548)) begin // 2.640625 
		// slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfab8;
	end else begin
		// slope = 16'h0;
		zero = 0;
		x_delta = 16'h548;
	end

	if(x < $signed(16'hf6d0)) begin // -4.593750
		bias = 16'h0; // 0.000000 
	end else 	if(x < $signed(16'hf8c0)) begin // -3.625000
		bias = 16'h8; // 0.015625 
	end else 	if(x < $signed(16'hf9b8)) begin // -3.140625
		bias = 16'h10; // 0.031250 
	end else 	if(x < $signed(16'hfa68)) begin // -2.796875
		bias = 16'h18; // 0.046875 
	end else 	if(x < $signed(16'hfb28)) begin // -2.421875
		bias = 16'h21; // 0.064453 
	end else 	if(x < $signed(16'hfc60)) begin // -1.812500
		bias = 16'h18; // 0.046875 
	end else 	if(x < $signed(16'hfcf8)) begin // -1.515625
		bias = 16'hf; // 0.029297 
	end else 	if(x < $signed(16'hfdc0)) begin // -1.125000
		bias = 16'h17; // 0.044922 
	end else 	if(x < $signed(16'hfe40)) begin // -0.875000
		bias = 16'h20; // 0.062500 
	end else 	if(x < $signed(16'hfea0)) begin // -0.687500
		bias = 16'h29; // 0.080078 
	end else 	if(x < $signed(16'hfef0)) begin // -0.531250
		bias = 16'h31; // 0.095703 
	end else 	if(x < $signed(16'hff40)) begin // -0.375000
		bias = 16'h3a; // 0.113281 
	end else 	if(x < $signed(16'hff88)) begin // -0.234375
		bias = 16'h43; // 0.130859 
	end else 	if(x < $signed(16'hffd0)) begin // -0.093750
		bias = 16'h4b; // 0.146484 
	end else 	if(x < $signed(16'h18)) begin // 0.046875
		bias = 16'h54; // 0.164062 
	end else 	if(x < $signed(16'h60)) begin // 0.187500
		bias = 16'h5d; // 0.181641 
	end else 	if(x < $signed(16'ha8)) begin // 0.328125
		bias = 16'h66; // 0.199219 
	end else 	if(x < $signed(16'hf8)) begin // 0.484375
		bias = 16'h6f; // 0.216797 
	end else 	if(x < $signed(16'h148)) begin // 0.640625
		bias = 16'h78; // 0.234375 
	end else 	if(x < $signed(16'h1a0)) begin // 0.812500
		bias = 16'h80; // 0.250000 
	end else 	if(x < $signed(16'h210)) begin // 1.031250
		bias = 16'h89; // 0.267578 
	end else 	if(x < $signed(16'h2b8)) begin // 1.359375
		bias = 16'h92; // 0.285156 
	end else 	if(x < $signed(16'h4a0)) begin // 2.312500
		bias = 16'h9a; // 0.300781 
	end else 	if(x < $signed(16'h548)) begin // 2.640625
		bias = 16'h91; // 0.283203 
	end else 	if(x < $signed(16'h5e0)) begin // 2.937500
		bias = 16'h1e1; // 0.939453 
	end else 	if(x < $signed(16'h6a8)) begin // 3.328125
		bias = 16'h1e9; // 0.955078 
	end else 	if(x < $signed(16'h7e0)) begin // 3.937500
		bias = 16'h1f1; // 0.970703 
	end else 	if(x < $signed(16'hb38)) begin // 5.609375
		bias = 16'h1f9; // 0.986328 
	end else begin
		bias = 16'h201; // 0.986328 
	end
end

endmodule
