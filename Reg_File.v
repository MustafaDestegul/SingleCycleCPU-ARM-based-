//Mustafa Destegül
//2109973

module Reg_File #(parameter W=32) (clk, RegWrite, A1, A2, A3, WD3, R15_in, RD1, RD2, Reg0_out, Reg1_out, Reg2_out,Reg3_out,Reg4_out);
	
	input clk, RegWrite;
	input [3:0] A1, A2, A3;
	input [W-1:0] WD3, R15_in;
	output reg [W-1:0] RD1,RD2;
	output wire [W-1:0] Reg0_out, Reg1_out, Reg2_out,Reg3_out,Reg4_out;
	
	wire [15:0] write_enable;
	reg [15:0] decoder_out;   
	wire [W-1:0] Reg5_out, Reg6_out, Reg7_out,Reg8_out, Reg9_out, Reg10_out, Reg11_out, Reg12_out, Reg13_out, Reg14_out, Reg15_out;
	
	
	RegisterWithWE #(W) R0(clk, 0, write_enable[0], WD3, Reg0_out);
	RegisterWithWE #(W) R1(clk, 0, write_enable[1], WD3, Reg1_out);
	RegisterWithWE #(W) R2(clk, 0, write_enable[2], WD3, Reg2_out);
	RegisterWithWE #(W) R3(clk, 0, write_enable[3], WD3, Reg3_out);
	RegisterWithWE #(W) R4(clk, 0, write_enable[4], WD3, Reg4_out);
	RegisterWithWE #(W) R5(clk, 0, write_enable[5], WD3, Reg5_out);
	RegisterWithWE #(W) R6(clk, 0, write_enable[6], WD3, Reg6_out);
	RegisterWithWE #(W) R7(clk, 0, write_enable[7], WD3, Reg7_out);
	RegisterWithWE #(W) R8(clk, 0, write_enable[8], WD3, Reg8_out);
	RegisterWithWE #(W) R9(clk, 0, write_enable[9], WD3, Reg9_out);
	RegisterWithWE #(W) R10(clk, 0, write_enable[10], WD3, Reg10_out);
	RegisterWithWE #(W) R11(clk, 0, write_enable[11], WD3, Reg11_out);
	RegisterWithWE #(W) R12(clk, 0, write_enable[12], WD3, Reg12_out);
	RegisterWithWE #(W) R13(clk, 0, write_enable[13], WD3, Reg13_out);
	RegisterWithWE #(W) R14(clk, 0, write_enable[14], WD3, Reg14_out);
	RegisterWithWE #(W) R15(clk, 0, 1, R15_in, Reg15_out);
	
	
	
	
	
	always@(A3)
	begin
	
		case(A3)
			4'b0000 : decoder_out<= 16'b0000_0000_0000_0001;	
			4'b0001 : decoder_out<= 16'b0000_0000_0000_0010;
			4'b0010 : decoder_out<= 16'b0000_0000_0000_0100;
			4'b0011 : decoder_out<= 16'b0000_0000_0000_1000;
			4'b0100 : decoder_out<= 16'b0000_0000_0001_0000;
			4'b0101 : decoder_out<= 16'b0000_0000_0010_0000;
			4'b0110 : decoder_out<= 16'b0000_0000_0100_0000;
			4'b0111 : decoder_out<= 16'b0000_0000_1000_0000;
			4'b1000 : decoder_out<= 16'b0000_0001_0000_0000;
			4'b1001 : decoder_out<= 16'b0000_0010_0000_0000;
			4'b1010 : decoder_out<= 16'b0000_0100_0000_0000;
			4'b1011 : decoder_out<= 16'b0000_1000_0000_0000;
			4'b1100 : decoder_out<= 16'b0001_0000_0000_0000;
			4'b1101 : decoder_out<= 16'b0010_0000_0000_0000;
			4'b1110 : decoder_out<= 16'b0100_0000_0000_0000;
			4'b1111 : decoder_out<= 16'b1000_0000_0000_0000;		
		endcase
	end
	
	
	
	
	
assign write_enable[0]= RegWrite && decoder_out[0]; 
assign write_enable[1]= RegWrite && decoder_out[1]; 
assign write_enable[2]= RegWrite && decoder_out[2]; 
assign write_enable[3]= RegWrite && decoder_out[3]; 
assign write_enable[4]= RegWrite && decoder_out[4]; 
assign write_enable[5]= RegWrite && decoder_out[5]; 
assign write_enable[6]= RegWrite && decoder_out[6]; 
assign write_enable[7]= RegWrite && decoder_out[7]; 
assign write_enable[8]= RegWrite && decoder_out[8]; 
assign write_enable[9]= RegWrite && decoder_out[9]; 
assign write_enable[10]= RegWrite && decoder_out[10]; 
assign write_enable[11]= RegWrite && decoder_out[11]; 
assign write_enable[12]= RegWrite && decoder_out[12]; 
assign write_enable[13]= RegWrite && decoder_out[13]; 
assign write_enable[14]= RegWrite && decoder_out[14];
assign write_enable[15]= RegWrite && decoder_out[15];  
		


																			  
																			  
always @ (*) 
	begin
		case({A1[3],A1[2],A1[1],A1[0]})					
			4'b0000: RD1 = Reg0_out;
			4'b0001: RD1 = Reg1_out;
			4'b0010: RD1 = Reg2_out;
			4'b0011: RD1 = Reg3_out;
			4'b0100: RD1 = Reg4_out;
			4'b0101: RD1 = Reg5_out;
			4'b0110: RD1 = Reg6_out;
			4'b0111: RD1 = Reg7_out;
			4'b1000: RD1 = Reg8_out;
			4'b1001: RD1 = Reg9_out;
			4'b1010: RD1 = Reg10_out;
			4'b1011: RD1 = Reg11_out;
			4'b1100: RD1 = Reg12_out;
			4'b1101: RD1 = Reg13_out;
			4'b1110: RD1 = Reg14_out;
			4'b1111: RD1 = Reg15_out;
			default: RD1 = 0;
		endcase
	end

always @ (*) 
	begin
		case({A2[3],A2[2],A2[1],A2[0]})					
			4'b0000: RD2 = Reg0_out;
			4'b0001: RD2 = Reg1_out;
			4'b0010: RD2 = Reg2_out;
			4'b0011: RD2 = Reg3_out;
			4'b0100: RD2 = Reg4_out;
			4'b0101: RD2 = Reg5_out;
			4'b0110: RD2 = Reg6_out;
			4'b0111: RD2 = Reg7_out;
			4'b1000: RD2 = Reg8_out;
			4'b1001: RD2 = Reg9_out;
			4'b1010: RD2 = Reg10_out;
			4'b1011: RD2 = Reg11_out;
			4'b1100: RD2 = Reg12_out;
			4'b1101: RD2 = Reg13_out;
			4'b1110: RD2 = Reg14_out;
			4'b1111: RD2 = Reg15_out;
			default: RD2 = 0;
		endcase
	end	
																			  
	
endmodule
