`timescale 1ns / 1ps
module Subtract_8(
		input [7:0] a,
		input [7:0] b,
		input cin,
		output [7:0] c,
		output cout
    );
	wire [7:0] d = ~b+1'b1;
	CLA8BITWITHLCU uut (
		.a(a), 
		.b(d), 
		.cin(cin), 
		.sum(c), 
		.cout(cout)
	);
	


endmodule
