
module ZeroExtend(input_,output_);
		
	input [11:0] input_;
	
	output reg [31:0] output_;
	
	always @ (input_)
	begin
		output_ = {20'b0, input_};			//zero extention  to 32 bit
	end
	
	
endmodule
