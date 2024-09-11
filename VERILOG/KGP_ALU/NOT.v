`timescale 1ns / 1ps

module NOT(
input [7:0] a,
		output [7:0] c
    );
not a0(c[0],a[0]);
not a1(c[1],a[1]);
not a2(c[2],a[2]);
not a3(c[3],a[3]);
not a4(c[4],a[4]);
not a5(c[5],a[5]);
not a6(c[6],a[6]);
not a7(c[7],a[7]);
endmodule
