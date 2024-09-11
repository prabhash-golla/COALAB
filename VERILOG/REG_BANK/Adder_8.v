`timescale 1ns / 1ps

module Adder_8(
		input [7:0] a,
		input [7:0] b,
		input cin,
		output [7:0] c,
		output cout
    );
	
	CLA8BITWITHLCU uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(c), 
		.cout(cout)
	);

endmodule
