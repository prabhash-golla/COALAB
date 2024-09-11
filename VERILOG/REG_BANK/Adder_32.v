`timescale 1ns / 1ps

module Adder_32(
		input [31:0] a,
		input [31:0] b,
		input cin,
		output [31:0] c,
		output cout
    );
	
    wire carry[2:0];
    Adder_8 adder_4 (.a(a[7:0])   , .b(b[7:0])   , .c(c[7:0])   , .cin(cin)      , .cout(carry[0]) );
    Adder_8 adder_3 (.a(a[15:8])  , .b(b[15:8])  , .c(c[15:8])  , .cin(carry[0]) , .cout(carry[1]) );
    Adder_8 adder_2 (.a(a[23:16]) , .b(b[23:16]) , .c(c[23:16]) , .cin(carry[1]) , .cout(carry[2]) );
    Adder_8 adder_1 (.a(a[31:24]) , .b(b[31:24]) , .c(c[31:24]) , .cin(carry[2]) , .cout(cout)     );

endmodule
