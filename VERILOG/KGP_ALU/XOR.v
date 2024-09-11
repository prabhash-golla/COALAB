module XOR(
		input [7:0] a,
		input [7:0] b,
		output [7:0] c
    );
xor a0(c[0],a[0],b[0]);
xor a1(c[1],a[1],b[1]);
xor a2(c[2],a[2],b[2]);
xor a3(c[3],a[3],b[3]);
xor a4(c[4],a[4],b[4]);
xor a5(c[5],a[5],b[5]);
xor a6(c[6],a[6],b[6]);
xor a7(c[7],a[7],b[7]);
endmodule