module Main_Decoder(funct,Op,RD,PCS,RegisterW,MemoryW,ResultSrc,ALUSrc,RegSrc,ALUOp,sh_dir);
		
	input [5:0] funct;
	input [1:0] Op;
	input [3:0] RD;
	output reg [1:0] ResultSrc;
	output reg PCS, RegisterW, MemoryW, ALUSrc, RegSrc, ALUOp, sh_dir;
	
	always @ (funct or Op)
	begin
		if(Op[1:0] == 2'b00) begin
			//ADD, SUB, AND, ORR
			if(funct[5] == 0 & (funct[4:1] == 4'b0100 | funct[4:1] == 4'b0010 | funct[4:1] == 4'b0000 | funct[4:1] == 4'b1100)) begin
				ResultSrc = 2'b01;
				MemoryW = 0;
				ALUSrc = 0; 
				RegisterW = 1;
				RegSrc = 0;
				ALUOp = 1;
			//LSL
			end else if(funct[5] == 1 & funct[4:1] == 4'b0011) begin
				ResultSrc = 2'b10;
				MemoryW = 0; 
				RegisterW = 1;
				ALUOp = 0;
				sh_dir = 0;
			//LSR
			end else if(funct[5] == 1 & funct[4:1] == 4'b0001) begin
				ResultSrc = 2'b10;
				MemoryW = 0; 
				RegisterW = 1;
				ALUOp = 0;
				sh_dir = 1;
			//CMP
			end else if(funct[5] == 0 & funct[4:1] == 4'b1010) begin
				MemoryW = 0;
				ALUSrc = 0;
				RegisterW = 0;
				RegSrc = 0;
				ALUOp = 1;
		 	end
		end else if(Op[1:0] == 2'b01) begin
			//LDR
			if(funct[0] == 1 & funct[5] == 0) begin
				ResultSrc = 2'b00;
				MemoryW = 0;
				ALUSrc = 1; 
				RegisterW = 1;
				ALUOp = 0;
			//STR
			end else if(funct[0] == 0 & funct[5] == 0) begin
				MemoryW = 1;
				ALUSrc = 1; 
				RegisterW = 1;
				RegSrc = 1;
				ALUOp = 0;
			end
		end
	end
	
	

	always @ (RD)
	begin
		if(RD == 4'b1111 & RegisterW) begin
			PCS = 1;
		end else begin
			PCS = 0;
		end
	end
		
	
	
endmodule
