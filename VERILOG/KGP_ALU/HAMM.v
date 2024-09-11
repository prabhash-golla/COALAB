`timescale 1ns / 1ps
module HAMM(
	input [7:0] a,
	output [7:0] c
    );
	 wire [1:0] k1,k2;
	 wire [2:0] o1;
	 assign c[7:4] = 4'b0000;
FA f1(
	  .a(a[7]),
	  .b(a[6]),
	  .d(a[5]), 
	  .c(k1[1]),   
	  .s(k1[0])
 );
FA f2(
	  .a(a[4]),
	  .b(a[3]),
	  .d(a[2]), 
	  .c(k2[1]),   
	  .s(k2[0])
 );
 two_bit_adder f3(
		.a(k1),
		.b(k2),
		.carry_in(a[1]),
		.sum(o1[1:0]),
		.carry_out(o1[2]));
three_bit_adder f4(
		.a(o1),
		.b(3'b000),
		.carry_in(a[0]),
		.sum(c[2:0]),
		.carry_out(c[3]));

endmodule
