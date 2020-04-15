module adder4 (adder_4_in, adder_4_out);

input [31:0] adder_4_in;
output reg [31:0] adder_4_out;



always@(adder_4_in)
begin
	adder_4_out<=adder_4_in + 32'd4;

end
endmodule

