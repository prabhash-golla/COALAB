`timescale 1ns / 1ps

module CLA8BITWITHLCU(
	input [7:0] a,
	input [7:0] b,
	input cin,
	output [7:0] sum,
	output cout
);
wire [1:0] carry;
wire [1:0] P;
wire [1:0] G;
wire p;
wire g;

CLA4BITWITHAUGMENTED g1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(sum[3:0]),.P(P[0]),.G(G[0]));
CLA4BITWITHAUGMENTED g2(.a(a[7:4]),.b(b[7:4]),.cin(carry[0]),.s(sum[7:4]),.P(P[1]),.G(G[1]));

LOOKAHEADCARRYUNIT lhcu(.cin(cin),.P(P),.G(G),.carry(carry),.p(p),.g(g));

assign cout = carry[1];

endmodule

