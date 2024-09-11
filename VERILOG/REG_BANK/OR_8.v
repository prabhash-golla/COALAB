`timescale 1ns / 1ps

module OR_8(
		input [7:0] a,
		input [7:0] b,
		output [7:0] c
    );
or a0(c[0],a[0],b[0]);
or a1(c[1],a[1],b[1]);
or a2(c[2],a[2],b[2]);
or a3(c[3],a[3],b[3]);
or a4(c[4],a[4],b[4]);
or a5(c[5],a[5],b[5]);
or a6(c[6],a[6],b[6]);
or a7(c[7],a[7],b[7]);
endmodule
