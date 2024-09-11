module XOR_32(
		input [31:0] a,
		input [31:0] b,
		output [31:0] c
    );

    XOR_8 xor_1 (.a(a[31:24]) , .b(b[31:24]) , .c(c[31:24]));
    XOR_8 xor_2 (.a(a[23:16]) , .b(b[23:16]) , .c(c[23:16]));
    XOR_8 xor_3 (.a(a[15:8]) , .b(b[15:8]) , .c(c[15:8]));
    XOR_8 xor_4 (.a(a[7:0]) , .b(b[7:0]) , .c(c[7:0]));

endmodule