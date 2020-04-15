//Mustafa Destegül
//2109973

module Data_Memory(clk, A, WD, MemWrite, out);
	
	input clk, MemWrite;
	input [31:0] A;
	input [31:0] WD;
	
	output reg [31:0] out;
	
	reg [7:0] data_memory [0:255];
	
	integer i;
	
	//initialize the memory for debugging purposes
	initial begin
		data_memory[0] = 8'b0;	data_memory[1] = 8'b0; data_memory[2] = 8'b0; data_memory[3] = 8'b0;
		data_memory[4] = 8'b1;  data_memory[5] = 8'b0; data_memory[6] = 8'b0; data_memory[7] = 8'b0;
		data_memory[8] = 8'b01; data_memory[9] = 8'b0; data_memory[10] = 8'b0; data_memory[11] = 8'b0;
		data_memory[12] = 8'b11; data_memory[13] = 8'b0; data_memory[14] = 8'b0; data_memory[15] = 8'b0;
 		for(i=0; i<256; i=i+1) begin
			data_memory[i] = i;
		end
	end
	
	always @(posedge clk)  // wrie at the rising edge of the clock
	begin
		if(MemWrite) begin
			{data_memory[A+3],data_memory[A+2],data_memory[A+1],data_memory[A]} <= WD;
		end
	end

	always @(A)					// read any time.
	begin
		out = {data_memory[A+3],data_memory[A+2],data_memory[A+1],data_memory[A]};
	end

endmodule
