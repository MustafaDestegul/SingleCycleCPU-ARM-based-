//Mustafa Destegül
//2109973


module Inst_Mem(Address, RD);
	input [31:0] Address;
	output reg [31:0] RD;
	
	reg [7:0] Memory [0:255];
	
	
	integer i;	
	
	initial begin		// initializing memory for debug purposes														
		{Memory[3],Memory[2],Memory[1],Memory[0]} = 		32'b11100100000100010000000000000000;  	//LDR R0,[R1,#0]
		{Memory[7],Memory[6],Memory[5],Memory[4]} = 		32'b11100100000100100001000000000001;  	//LDR R1,[R2,#1]																						
		{Memory[11],Memory[10],Memory[9],Memory[8]}   = 32'b11100001010000000011000000000001;	   //CMP r3,r0,r1
		{Memory[15],Memory[14],Memory[13],Memory[12]} = 32'b00000000010000000000000000000001;		//SUBEQ R0,R0,R1
		{Memory[19],Memory[18],Memory[17],Memory[16]} = 32'b11100000100000000011000000000001;		//ADD r3,r0,r1
		{Memory[23],Memory[22],Memory[21],Memory[20]} = 32'b11100010011000010100000000000001;		//LSL R4,R1,#1 
		{Memory[27],Memory[26],Memory[25],Memory[24]} = 32'b11100010001000010100000000000001;		//LSR R4,R1,#1
		{Memory[31],Memory[30],Memory[29],Memory[28]} = 32'b11100000000001000011000000000001;		//AND R3,R4,R1
		{Memory[35],Memory[34],Memory[33],Memory[32]} = 32'b11100001100001000100000000000000;		//ORR R4,R4,R0
		{Memory[39],Memory[38],Memory[37],Memory[36]} = 32'b11100000010001000100000000000000;		//SUB R4,R4,R0
		{Memory[43],Memory[42],Memory[41],Memory[40]} = 32'b11100100000000100100000000000000;     //STR R4,[R2,#0]
		
		
		for(i=44; i<256; i= i+1) begin
			Memory[i] = 0;
		end
	end
	
	always @(Address)
	begin
		RD = {Memory[Address+3],Memory[Address+2],Memory[Address+1],Memory[Address]};
	end

endmodule
