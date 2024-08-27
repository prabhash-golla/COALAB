`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:03 08/14/2024 
// Design Name: 
// Module Name:    CLA16BITWITHLCU
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module CLA16BITWITHLCU(
   	input [15:0] a,
	input [15:0] b,
	input cin,
	output [3:0] carry,
	output p,
	output g,
	output [15:0] sum,
	output cout
);

wire [3:0] P,G;

CLA4BITWITHAUGMENTED g1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(sum[3,0]),.P(P[0]),.G(G[0]));
CLA4BITWITHAUGMENTED g2(.a(a[7:4]),.b(b[7:4]),.cin(carry[0]),.s(sum[7:4]),.P(P[1]),.G(G[1]));
CLA4BITWITHAUGMENTED g3(.a(a[11:8]),.b(b[11:8]),.cin(carry[1]),.s(sum[11:8]),.P(P[2]),.G(G[2]));
CLA4BITWITHAUGMENTED g4(.a(a[15:12]),.b(b[15:12]),.cin(carry[2]),.s(sum[15:12]),.P(P[3]),.G(G[3]));

LOOKAHEADCARRYUNIT lhcu(.cin(cin),.P(P),.G(G),.carry(carry),.p(p),.g(g));

assign cout = carry[3];

endmodule

