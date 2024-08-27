`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:03 08/14/2024 
// Design Name: 
// Module Name:    CLA4BITWITHAUGMENTED 
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
module CLA4BITWITHAUGMENTED(
   input [3:0] a,
	input [3:0] b,
	input cin,
	output [3:0] c,
	output P,
	output G,
	output [3:0] s,
	output cout,
	wire [3:0] p,
	wire [3:0] g
);

assign c[0] = cin;

assign p = a ^ b;
assign g = a & b;
assign s = p ^ c;


assign c[1] = g[0] | (c[0] & p[0]);
assign c[2] = g[1] | (g[0] & p[1]) | (p[1]&p[0]&c[0]);
assign c[3] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) | (p[2] & p[1] & p[0] & c[0]);
assign cout = g[3] | (g[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

assign P = p[0] & p[1] & p[2] & p[3];
assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule

