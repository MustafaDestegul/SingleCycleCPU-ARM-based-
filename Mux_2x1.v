

module Mux_2x1 #(parameter W=32) (in0, in1, s0, out);

	input s0;
	input [W-1:0] in0, in1;		
	output reg [W-1:0] out;

	always @ (*)
	begin
		if(s0 == 1) begin
			out = in1;
		end else begin
			out = in0;
		end
	end

endmodule
