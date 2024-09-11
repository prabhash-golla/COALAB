`timescale 1ns / 1ps
module LOOKAHEADCARRYUNIT(
    input cin,
    input [1:0] P,
    input [1:0] G,
    output [1:0] carry,
    output p,
    output g
);

assign carry[0] = G[0] | (P[0] & cin);
assign carry[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);

assign p = P[1] & P[0];
assign g = G[1] | (P[1] & G[0]);

endmodule