`timescale 1ns / 1ps
module Subtract_32(
		input [31:0] a,
		input [31:0] b,
		input cin,
		output [31:0] c,
		output cout
    );
	wire [31:0] d = ~b + 1'b1;
    wire carry[2:0];
    Subtract_8 subtract_4 (.a(a[7:0])   , .b(d[7:0])   , .c(c[7:0])   , .cin(cin)      , .cout(carry[0]) );
    Subtract_8 subtract_3 (.a(a[15:8])  , .b(d[15:8])  , .c(c[15:8])  , .cin(carry[0]) , .cout(carry[1]) );
    Subtract_8 subtract_2 (.a(a[23:16]) , .b(d[23:16]) , .c(c[23:16]) , .cin(carry[1]) , .cout(carry[2]) );
    Subtract_8 subtract_1 (.a(a[31:24]) , .b(d[31:24]) , .c(c[31:24]) , .cin(carry[2]) , .cout(cout)     );

endmodule
