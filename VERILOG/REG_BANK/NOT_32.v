`timescale 1ns / 1ps

module NOT_32(
    input [31:0] a,
	output [31:0] c
    );
    NOT_8 not_1 ( .a(a[31:24]) , .c(c[31:24]));
    NOT_8 not_2 ( .a(a[23:16]) , .c(c[23:16]));
    NOT_8 not_3 ( .a(a[15:8])  , .c(c[15:8]));
    NOT_8 not_4 ( .a(a[7:0])   , .c(c[7:0]));
endmodule
