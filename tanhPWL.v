module tanhPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [4:0] slope, slope_stage_reg;
reg signed [5:0] bias, bias_stage_reg;
reg signed [15:0] x_delta, x_stage_reg;
reg zero, zero_stage_reg;
always @(posedge clk) begin
	if(~rst) begin
		slope_stage_reg <= 0;
		bias_stage_reg <= 0;
		x_stage_reg <= 0;
		zero_stage_reg <= 0;
	end else begin
		slope_stage_reg <= slope;
		bias_stage_reg <= bias;
		x_stage_reg <= (x - x_delta);
		zero_stage_reg <= zero;
	end
end
assign y = (zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> slope_stage_reg) + bias_stage_reg;
/**************** Compare and LUT *****************/
always @(*) begin
<<<<<<< HEAD
	if((x - 16'hf000)[15]) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfb28)[15]) begin // -2.421875 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfc48)[15]) begin // -1.859375 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'hfb28;
	end else 	if((x - 16'hfd08)[15]) begin // -1.484375 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfc48;
	end else 	if((x - 16'hfdd8)[15]) begin // -1.078125 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfd08;
	end else 	if((x - 16'hfee8)[15]) begin // -0.546875 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'hfdd8;
	end else 	if((x - 16'h118)[15]) begin // 0.546875 
		slope = 16'h0; // 1.000000
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if((x - 16'h228)[15]) begin // 1.078125 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'h118;
	end else 	if((x - 16'h2f8)[15]) begin // 1.484375 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'h228;
	end else 	if((x - 16'h3b8)[15]) begin // 1.859375 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'h2f8;
	end else 	if((x - 16'h4d8)[15]) begin // 2.421875 
		slope = 16'h4; // 0.062500
=======
	if(x < $signed(16'hf000)) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfb28)) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfc48)) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfb28;
	end else 	if(x < $signed(16'hfd08)) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfc48;
	end else 	if(x < $signed(16'hfdd8)) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfd08;
	end else 	if(x < $signed(16'hfee8)) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'hfdd8;
	end else 	if(x < $signed(16'h118)) begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'hfee8;
	end else 	if(x < $signed(16'h228)) begin
		slope = 16'h1;
		zero = 0;
		x_delta = 16'h118;
	end else 	if(x < $signed(16'h2f8)) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'h228;
	end else 	if(x < $signed(16'h3b8)) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h2f8;
	end else 	if(x < $signed(16'h4d8)) begin
		slope = 16'h4;
>>>>>>> 729126d4e96fa67b43c625e41b50e7202177de6a
		zero = 0;
		x_delta = 16'h3b8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h4d8;
	end

<<<<<<< HEAD
	if((x - 16'hf000)[15]) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if((x - 16'hf9d8)[15]) begin // -3.078125
		bias = 16'hfdfd; // -1.005859 
	end else 	if((x - 16'hfc48)[15]) begin // -1.859375
		bias = 16'hfe06; // -0.988281 
	end else 	if((x - 16'hfc98)[15]) begin // -1.703125
		bias = 16'hfe1c; // -0.945312 
	end else 	if((x - 16'hfcf8)[15]) begin // -1.515625
		bias = 16'hfe14; // -0.960938 
	end else 	if((x - 16'hfd08)[15]) begin // -1.484375
		bias = 16'hfe1d; // -0.943359 
	end else 	if((x - 16'hfd20)[15]) begin // -1.437500
		bias = 16'hfe36; // -0.894531 
	end else 	if((x - 16'hfdc0)[15]) begin // -1.125000
		bias = 16'hfe2e; // -0.910156 
	end else 	if((x - 16'hfdd8)[15]) begin // -1.078125
		bias = 16'hfe38; // -0.890625 
	end else 	if((x - 16'hfde8)[15]) begin // -1.046875
		bias = 16'hfe6e; // -0.785156 
	end else 	if((x - 16'hfea0)[15]) begin // -0.687500
		bias = 16'hfe65; // -0.802734 
	end else 	if((x - 16'hfed8)[15]) begin // -0.578125
		bias = 16'hfe6f; // -0.783203 
	end else 	if((x - 16'hfee8)[15]) begin // -0.546875
		bias = 16'hfe79; // -0.763672 
	end else 	if((x - 16'hfef0)[15]) begin // -0.531250
		bias = 16'hff05; // -0.490234 
	end else 	if((x - 16'hff18)[15]) begin // -0.453125
		bias = 16'hfefc; // -0.507812 
	end else 	if((x - 16'hff50)[15]) begin // -0.343750
		bias = 16'hfef4; // -0.523438 
	end else 	if((x - 16'h68)[15]) begin // 0.203125
		bias = 16'hfeec; // -0.539062 
	end else 	if((x - 16'hc8)[15]) begin // 0.390625
		bias = 16'hfee4; // -0.554688 
	end else 	if((x - 16'h100)[15]) begin // 0.500000
		bias = 16'hfedb; // -0.572266 
	end else 	if((x - 16'h118)[15]) begin // 0.546875
		bias = 16'hfed2; // -0.589844 
	end else 	if((x - 16'h140)[15]) begin // 0.625000
		bias = 16'h102; // 0.503906 
	end else 	if((x - 16'h178)[15]) begin // 0.734375
		bias = 16'h10b; // 0.521484 
	end else 	if((x - 16'h228)[15]) begin // 1.078125
		bias = 16'h113; // 0.537109 
	end else 	if((x - 16'h2f8)[15]) begin // 1.484375
		bias = 16'h199; // 0.798828 
	end else 	if((x - 16'h3b8)[15]) begin // 1.859375
		bias = 16'h1d1; // 0.908203 
	end else 	if((x - 16'h4d8)[15]) begin // 2.421875
		bias = 16'h1eb; // 0.958984 
=======
	if(x < $signed(16'hf000)) begin
		bias = 16'h0;
	end else 	if(x < $signed(16'hf9d8)) begin
		bias = 16'hfdfd;
	end else 	if(x < $signed(16'hfc48)) begin
		bias = 16'hfe06;
	end else 	if(x < $signed(16'hfc98)) begin
		bias = 16'hfe1c;
	end else 	if(x < $signed(16'hfcf8)) begin
		bias = 16'hfe14;
	end else 	if(x < $signed(16'hfd08)) begin
		bias = 16'hfe1d;
	end else 	if(x < $signed(16'hfd20)) begin
		bias = 16'hfe36;
	end else 	if(x < $signed(16'hfdc0)) begin
		bias = 16'hfe2e;
	end else 	if(x < $signed(16'hfdd8)) begin
		bias = 16'hfe38;
	end else 	if(x < $signed(16'hfde8)) begin
		bias = 16'hfe6e;
	end else 	if(x < $signed(16'hfea0)) begin
		bias = 16'hfe65;
	end else 	if(x < $signed(16'hfed8)) begin
		bias = 16'hfe6f;
	end else 	if(x < $signed(16'hfee8)) begin
		bias = 16'hfe79;
	end else 	if(x < $signed(16'hfef0)) begin
		bias = 16'hff05;
	end else 	if(x < $signed(16'hff18)) begin
		bias = 16'hfefc;
	end else 	if(x < $signed(16'hff50)) begin
		bias = 16'hfef4;
	end else 	if(x < $signed(16'h68)) begin
		bias = 16'hfeec;
	end else 	if(x < $signed(16'hc8)) begin
		bias = 16'hfee4;
	end else 	if(x < $signed(16'h100)) begin
		bias = 16'hfedb;
	end else 	if(x < $signed(16'h118)) begin
		bias = 16'hfed2;
	end else 	if(x < $signed(16'h140)) begin
		bias = 16'h102;
	end else 	if(x < $signed(16'h178)) begin
		bias = 16'h10b;
	end else 	if(x < $signed(16'h228)) begin
		bias = 16'h113;
	end else 	if(x < $signed(16'h2f8)) begin
		bias = 16'h199;
	end else 	if(x < $signed(16'h3b8)) begin
		bias = 16'h1d1;
	end else 	if(x < $signed(16'h4d8)) begin
		bias = 16'h1eb;
>>>>>>> 729126d4e96fa67b43c625e41b50e7202177de6a
	end else begin
		bias = 16'h1fb; // 0.958984 
	end
end

endmodule
