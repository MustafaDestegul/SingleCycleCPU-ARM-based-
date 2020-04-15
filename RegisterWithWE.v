
module RegisterWithWE #(parameter W= 4) (clk, reset, we, load, out);

	input clk, reset, we;
	input [W-1:0] load;
	output reg [W-1:0] out;

	always @ (posedge clk)
	begin
		if(reset == 1) begin
			out <= 0;
		end else begin
			if(we == 1) begin
				out <= load;
			end
		end
	
	end
endmodule
