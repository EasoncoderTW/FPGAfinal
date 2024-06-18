module tanhPWL(
	input clk,
	input rst,
	input [15:0] x,
	output wire [15:0] y
);

reg signed [2:0] slope, slope_stage_reg;
reg signed [6:0] bias, bias_stage_reg;
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
	if(x < $signed(16'hf000)) begin // -8.000000 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'hfd60)) begin // -1.312500 
		slope = 16'h0;
		zero = 1;
		x_delta = 16'hf000;
	end else 	if(x < $signed(16'h2a0)) begin // 1.312500 
		slope = 16'h1; // 0.500000
		zero = 0;
		x_delta = 16'hfd60;
	end else begin
		slope = 16'h0;
		zero = 0;
		x_delta = 16'h2a0;
	end

	if(x < $signed(16'hf000)) begin // -8.000000
		bias = 16'h0; // 0.000000 
	end else 	if(x < $signed(16'hfae8)) begin // -2.546875
		bias = 16'hfe01; // -0.998047 
	end else 	if(x < $signed(16'hfb98)) begin // -2.203125
		bias = 16'hfe07; // -0.986328 
	end else 	if(x < $signed(16'hfc00)) begin // -2.000000
		bias = 16'hfe0d; // -0.974609 
	end else 	if(x < $signed(16'hfc48)) begin // -1.859375
		bias = 16'hfe13; // -0.962891 
	end else 	if(x < $signed(16'hfc88)) begin // -1.734375
		bias = 16'hfe19; // -0.951172 
	end else 	if(x < $signed(16'hfcc0)) begin // -1.625000
		bias = 16'hfe20; // -0.937500 
	end else 	if(x < $signed(16'hfce8)) begin // -1.546875
		bias = 16'hfe27; // -0.923828 
	end else 	if(x < $signed(16'hfd10)) begin // -1.468750
		bias = 16'hfe2e; // -0.910156 
	end else 	if(x < $signed(16'hfd38)) begin // -1.390625
		bias = 16'hfe35; // -0.896484 
	end else 	if(x < $signed(16'hfd58)) begin // -1.328125
		bias = 16'hfe3d; // -0.880859 
	end else 	if(x < $signed(16'hfd78)) begin // -1.265625
		bias = 16'hfe45; // -0.865234 
	end else 	if(x < $signed(16'hfd90)) begin // -1.218750
		bias = 16'hfe41; // -0.873047 
	end else 	if(x < $signed(16'hfda8)) begin // -1.171875
		bias = 16'hfe3c; // -0.882812 
	end else 	if(x < $signed(16'hfdc0)) begin // -1.125000
		bias = 16'hfe37; // -0.892578 
	end else 	if(x < $signed(16'hfdd8)) begin // -1.078125
		bias = 16'hfe34; // -0.898438 
	end else 	if(x < $signed(16'hfdf8)) begin // -1.015625
		bias = 16'hfe30; // -0.906250 
	end else 	if(x < $signed(16'hfe30)) begin // -0.906250
		bias = 16'hfe2d; // -0.912109 
	end else 	if(x < $signed(16'hfea8)) begin // -0.671875
		bias = 16'hfe2a; // -0.917969 
	end else 	if(x < $signed(16'hfed8)) begin // -0.578125
		bias = 16'hfe33; // -0.900391 
	end else 	if(x < $signed(16'hff00)) begin // -0.500000
		bias = 16'hfe3d; // -0.880859 
	end else 	if(x < $signed(16'hff20)) begin // -0.437500
		bias = 16'hfe47; // -0.861328 
	end else 	if(x < $signed(16'hff40)) begin // -0.375000
		bias = 16'hfe51; // -0.841797 
	end else 	if(x < $signed(16'hff60)) begin // -0.312500
		bias = 16'hfe5d; // -0.818359 
	end else 	if(x < $signed(16'hff78)) begin // -0.265625
		bias = 16'hfe69; // -0.794922 
	end else 	if(x < $signed(16'hff90)) begin // -0.218750
		bias = 16'hfe73; // -0.775391 
	end else 	if(x < $signed(16'hffa8)) begin // -0.171875
		bias = 16'hfe7e; // -0.753906 
	end else 	if(x < $signed(16'hffc0)) begin // -0.125000
		bias = 16'hfe89; // -0.732422 
	end else 	if(x < $signed(16'hffd8)) begin // -0.078125
		bias = 16'hfe95; // -0.708984 
	end else 	if(x < $signed(16'hfff0)) begin // -0.031250
		bias = 16'hfea1; // -0.685547 
	end else 	if(x < $signed(16'h8)) begin // 0.015625
		bias = 16'hfead; // -0.662109 
	end else 	if(x < $signed(16'h20)) begin // 0.062500
		bias = 16'hfeb8; // -0.640625 
	end else 	if(x < $signed(16'h38)) begin // 0.109375
		bias = 16'hfec4; // -0.617188 
	end else 	if(x < $signed(16'h50)) begin // 0.156250
		bias = 16'hfed0; // -0.593750 
	end else 	if(x < $signed(16'h68)) begin // 0.203125
		bias = 16'hfedc; // -0.570312 
	end else 	if(x < $signed(16'h80)) begin // 0.250000
		bias = 16'hfee7; // -0.548828 
	end else 	if(x < $signed(16'h98)) begin // 0.296875
		bias = 16'hfef2; // -0.527344 
	end else 	if(x < $signed(16'hb0)) begin // 0.343750
		bias = 16'hfefc; // -0.507812 
	end else 	if(x < $signed(16'hc8)) begin // 0.390625
		bias = 16'hff05; // -0.490234 
	end else 	if(x < $signed(16'he8)) begin // 0.453125
		bias = 16'hff0e; // -0.472656 
	end else 	if(x < $signed(16'h108)) begin // 0.515625
		bias = 16'hff19; // -0.451172 
	end else 	if(x < $signed(16'h130)) begin // 0.593750
		bias = 16'hff22; // -0.433594 
	end else 	if(x < $signed(16'h160)) begin // 0.687500
		bias = 16'hff2c; // -0.414062 
	end else 	if(x < $signed(16'h240)) begin // 1.125000
		bias = 16'hff34; // -0.398438 
	end else 	if(x < $signed(16'h258)) begin // 1.171875
		bias = 16'hff30; // -0.406250 
	end else 	if(x < $signed(16'h270)) begin // 1.218750
		bias = 16'hff2c; // -0.414062 
	end else 	if(x < $signed(16'h288)) begin // 1.265625
		bias = 16'hff27; // -0.423828 
	end else 	if(x < $signed(16'h298)) begin // 1.296875
		bias = 16'hff22; // -0.433594 
	end else 	if(x < $signed(16'h2a0)) begin // 1.312500
		bias = 16'hff1e; // -0.441406 
	end else 	if(x < $signed(16'h2b8)) begin // 1.359375
		bias = 16'h1bb; // 0.865234 
	end else 	if(x < $signed(16'h2d8)) begin // 1.421875
		bias = 16'h1c1; // 0.876953 
	end else 	if(x < $signed(16'h2f8)) begin // 1.484375
		bias = 16'h1c8; // 0.890625 
	end else 	if(x < $signed(16'h318)) begin // 1.546875
		bias = 16'h1ce; // 0.902344 
	end else 	if(x < $signed(16'h340)) begin // 1.625000
		bias = 16'h1d4; // 0.914062 
	end else 	if(x < $signed(16'h368)) begin // 1.703125
		bias = 16'h1da; // 0.925781 
	end else 	if(x < $signed(16'h398)) begin // 1.796875
		bias = 16'h1df; // 0.935547 
	end else 	if(x < $signed(16'h3d8)) begin // 1.921875
		bias = 16'h1e5; // 0.947266 
	end else 	if(x < $signed(16'h418)) begin // 2.046875
		bias = 16'h1ea; // 0.957031 
	end else 	if(x < $signed(16'h478)) begin // 2.234375
		bias = 16'h1ef; // 0.966797 
	end else 	if(x < $signed(16'h500)) begin // 2.500000
		bias = 16'h1f4; // 0.976562 
	end else 	if(x < $signed(16'h650)) begin // 3.156250
		bias = 16'h1f9; // 0.986328 
	end else begin
		bias = 16'h1fe; // 0.986328 
	end
end

endmodule
