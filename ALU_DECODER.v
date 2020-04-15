//Mustafa Destegül
//2109973

module ALU_DECODER(funct, ALU_Operation, ALU_Control, Flag_W, dontWrite);
	
	
	input [4:0] funct;
	input 		ALU_Operation;
	output reg [2:0] 	ALU_Control;
	output reg [1:0] 	Flag_W;
	output reg 			dontWrite;

	
	always @ (funct or ALU_Operation)  // if any changes in function or ALU_Operation 
	begin
		if(!ALU_Operation) begin
			ALU_Control = 3'b000;
			dontWrite = 0;
			Flag_W = 2'b00;
		end else begin
			
			if(funct[4:1] == 4'b0100) begin //ADD OPERATION
				ALU_Control = 3'b000;
				dontWrite = 0;
				Flag_W = funct[0] ? 2'b11 : 2'b00;
			
			end else if(funct[4:1] == 4'b0010) begin//SUB OPERATION
				ALU_Control = 3'b001;
				dontWrite = 0;
				Flag_W = funct[0] ? 2'b11 : 2'b00;
			
			end else if(funct[4:1] == 4'b0000) begin //AND OPERATION
				ALU_Control = 3'b100;
				dontWrite = 0;
				Flag_W = funct[0] ? 2'b10 : 2'b00;
			
			end else if(funct[4:1] == 4'b1100) begin //ORR OPERATION
				ALU_Control = 3'b101;
				dontWrite = 0;
				Flag_W = funct[0] ? 2'b10 : 2'b00;
			
			end else if(funct[4:1] == 4'b1010) begin //CMP OPERATION
				ALU_Control = 3'b001;
				dontWrite = 1;
				Flag_W = 2'b11;
			end
		end
	end	
endmodule
