module LOOKAHEADCARRYUNIT(
    input cin,
    input [3:0] P,
    input [3:0] G,
    output [3:0] carry,
    output p,
    output g
);

assign carry[0] = G[0] | (P[0] & cin);
assign carry[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
assign carry[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
assign carry[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);

assign p = P[3] & P[2] & P[1] & P[0];
assign g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule