//Mustafa Destegül
//2109973


module Conditonal_logic_Decoder(clk, Condition, ALU_flags, FlagW, PCS, RegW, MemW, dontWrite, PCSrc, Register_Write, Memory_Write);
	

	input [3:0] Condition,ALU_flags;
	input [1:0] FlagW;
	input clk, PCS, RegW, MemW,dontWrite;
	output wire PCSrc, Register_Write,Memory_Write;

	
	wire [1:0] Flags_NZ, Flags_CV, FW;
	reg cond_execution;

	always @ (Condition or Flags_NZ[0])  //check whether condition is satisfied or not
	begin
		if(Condition[3:0] == 4'b1110) begin
			cond_execution = 1;
		end else if((Condition[3:0] == 4'b0000) & Flags_NZ[0] == 1) begin
			cond_execution = 1;
		end else begin
			cond_execution = 0;
		end
	end

	
	and a1(FW[1], FlagW[1], cond_execution);
	and a2(FW[0], FlagW[0], cond_execution);	
	and a3(PCSrc, PCS, cond_execution);
	and a4(Memory_Write, MemW, cond_execution);
	and a5(Register_Write, ~dontWrite, RegW, cond_execution);
	
	RegisterWithWE #(2) nZ(clk, 0, FW[1], ALU_flags[3:2], Flags_NZ[1:0]);
	RegisterWithWE #(2) CV(clk, 0, FW[0], ALU_flags[1:0], Flags_CV[1:0]);	
	
	
endmodule

