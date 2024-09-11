`timescale 1ns / 1ps

module CLA4BITWITHAUGMENTED(
   input [3:0] a,
	input [3:0] b,
	input cin,
	output P,
	output G,
	output [3:0] s
    );
	 wire [3:0] c;
	 	wire [3:0] p;
	wire [3:0] g;

assign c[0] = cin;

assign p = a ^ b;
assign g = a & b;
assign s = p ^ c;

assign c[1] = g[0] | (c[0] & p[0]);
assign c[2] = g[1] | (g[0] & p[1]) | (p[1]&p[0]&c[0]);
assign c[3] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) | (p[2] & p[1] & p[0] & c[0]);


assign P = p[0] & p[1] & p[2] & p[3];
assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule

