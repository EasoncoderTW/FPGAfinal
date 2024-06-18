module sigmoidPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [4:0] slope, slope_stage_reg;
reg signed [4:0] bias, bias_stage_reg;
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
	end else 	if((x - 16'hf7c0)[15]) begin // -4.125000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if((x - 16'hfa18)[15]) begin // -2.953125 
		slope = 16'h5; // 0.031250
		zero = 0;
		x_delta = 16'hf7c0;
	end else 	if((x - 16'hfbb8)[15]) begin // -2.140625 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'hfa18;
	end else 	if((x - 16'hfdd0)[15]) begin // -1.093750 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'hfbb8;
	end else 	if((x - 16'h230)[15]) begin // 1.093750 
		slope = 16'h2; // 0.250000
		zero = 0;
		x_delta = 16'hfdd0;
	end else 	if((x - 16'h448)[15]) begin // 2.140625 
		slope = 16'h3; // 0.125000
		zero = 0;
		x_delta = 16'h230;
	end else 	if((x - 16'h5e8)[15]) begin // 2.953125 
		slope = 16'h4; // 0.062500
		zero = 0;
		x_delta = 16'h448;
	end else 	if((x - 16'h840)[15]) begin // 4.125000 
		slope = 16'h5; // 0.031250
=======
	if(x < $signed(16'hf000)) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hf7c0)) begin
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfa18)) begin
		slope = 16'h5;
		zero = 0;
		x_delta = 16'hf7c0;
	end else 	if(x < $signed(16'hfbb8)) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'hfa18;
	end else 	if(x < $signed(16'hfdd0)) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'hfbb8;
	end else 	if(x < $signed(16'h230)) begin
		slope = 16'h2;
		zero = 0;
		x_delta = 16'hfdd0;
	end else 	if(x < $signed(16'h448)) begin
		slope = 16'h3;
		zero = 0;
		x_delta = 16'h230;
	end else 	if(x < $signed(16'h5e8)) begin
		slope = 16'h4;
		zero = 0;
		x_delta = 16'h448;
	end else 	if(x < $signed(16'h840)) begin
		slope = 16'h5;
>>>>>>> 729126d4e96fa67b43c625e41b50e7202177de6a
		zero = 0;
		x_delta = 16'h5e8;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h840;
	end

<<<<<<< HEAD
	if((x - 16'hf6d0)[15]) begin // -4.593750
		bias = 16'h0; // 0.000000 
	end else 	if((x - 16'hfa18)[15]) begin // -2.953125
		bias = 16'h8; // 0.015625 
	end else 	if((x - 16'hfbb8)[15]) begin // -2.140625
		bias = 16'h1c; // 0.054688 
	end else 	if((x - 16'hfc08)[15]) begin // -1.984375
		bias = 16'h39; // 0.111328 
	end else 	if((x - 16'hfd20)[15]) begin // -1.437500
		bias = 16'h30; // 0.093750 
	end else 	if((x - 16'hfdd0)[15]) begin // -1.093750
		bias = 16'h38; // 0.109375 
	end else 	if((x - 16'hfdf0)[15]) begin // -1.031250
		bias = 16'h84; // 0.257812 
	end else 	if((x - 16'hff20)[15]) begin // -0.437500
		bias = 16'h7a; // 0.238281 
	end else 	if((x - 16'h1e8)[15]) begin // 0.953125
		bias = 16'h71; // 0.220703 
	end else 	if((x - 16'h230)[15]) begin // 1.093750
		bias = 16'h67; // 0.201172 
	end else 	if((x - 16'h2f0)[15]) begin // 1.468750
		bias = 16'h183; // 0.755859 
	end else 	if((x - 16'h448)[15]) begin // 2.140625
		bias = 16'h18b; // 0.771484 
	end else 	if((x - 16'h5e8)[15]) begin // 2.953125
		bias = 16'h1cd; // 0.900391 
	end else 	if((x - 16'h840)[15]) begin // 4.125000
		bias = 16'h1ea; // 0.957031 
=======
	if(x < $signed(16'hf6d0)) begin
		bias = 16'h0;
	end else 	if(x < $signed(16'hfa18)) begin
		bias = 16'h8;
	end else 	if(x < $signed(16'hfbb8)) begin
		bias = 16'h1c;
	end else 	if(x < $signed(16'hfc08)) begin
		bias = 16'h39;
	end else 	if(x < $signed(16'hfd20)) begin
		bias = 16'h30;
	end else 	if(x < $signed(16'hfdd0)) begin
		bias = 16'h38;
	end else 	if(x < $signed(16'hfdf0)) begin
		bias = 16'h84;
	end else 	if(x < $signed(16'hff20)) begin
		bias = 16'h7a;
	end else 	if(x < $signed(16'h1e8)) begin
		bias = 16'h71;
	end else 	if(x < $signed(16'h230)) begin
		bias = 16'h67;
	end else 	if(x < $signed(16'h2f0)) begin
		bias = 16'h183;
	end else 	if(x < $signed(16'h448)) begin
		bias = 16'h18b;
	end else 	if(x < $signed(16'h5e8)) begin
		bias = 16'h1cd;
	end else 	if(x < $signed(16'h840)) begin
		bias = 16'h1ea;
>>>>>>> 729126d4e96fa67b43c625e41b50e7202177de6a
	end else begin
		bias = 16'h1fb; // 0.957031 
	end
end

endmodule
