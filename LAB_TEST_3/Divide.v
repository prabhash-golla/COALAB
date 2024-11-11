`timescale 1ns / 1ps

// Module for Dividing N,D and Outputs are P,Q

///////////////////////////////////////////////////////////////////////////////////////////////////
// Golla Meghanandh Manvith Prabhash
// 22CS30027
// Group number 50
// Slot Number 1
///////////////////////////////////////////////////////////////////////////////////////////////////

// Module for CLA
module CLA4BITWITHAUGMENTED(
   input [3:0] a,
	input [3:0] b,
	input cin,
	output P,
	output G,
	output [3:0] s
    );
	 
	// Initialise temporari wires
	wire [3:0] c;
	wire [3:0] p;
	wire [3:0] g;
	
	// Caliculation of p, g ,s
	assign p = a ^ b;
	assign g = a & b;
	assign s = p ^ c;
	
	// Caliculation of c[3:0]
	assign c[0] = cin;
	assign c[1] = g[0] | (c[0] & p[0]);
	assign c[2] = g[1] | (g[0] & p[1]) | (p[1]&p[0]&c[0]);
	assign c[3] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) | (p[2] & p[1] & p[0] & c[0]);

	// Caliculation of P,G
	assign P = p[0] & p[1] & p[2] & p[3];
	assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule
//End of Module CLA4BITWITHAUGMENTED

//Module for Carry LLOOK AHEAD UNIT
module LOOKAHEADCARRYUNIT(
    input cin,
    input [1:0] P,
    input [1:0] G,
    output [1:0] carry,
    output p,
    output g
	);
	
	// Caliculation of Carry[0] and Carry[1] Such that there won't be any delay in Caliclation Afterwards
	assign carry[0] = G[0] | (P[0] & cin);
	assign carry[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
	
	// Caliculation of p, g
	assign p = P[1] & P[0];
	assign g = G[1] | (P[1] & G[0]);

endmodule
//End of Module LOOKAHEADCARRYUNIT

// A 8 BIT CLA
module CLA8BITWITHLCU(
	input [7:0] a,
	input [7:0] b,
	input cin,
	output [7:0] sum,
	output cout
	);
	
	// Initialise temporary wires
	wire [1:0] carry;
	wire [1:0] P;
	wire [1:0] G;
	wire p;
	wire g;
	
	// Calling CLA4BITWITHAUGMENTED 2 Times 
	CLA4BITWITHAUGMENTED g1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(sum[3:0]),.P(P[0]),.G(G[0]));
	CLA4BITWITHAUGMENTED g2(.a(a[7:4]),.b(b[7:4]),.cin(carry[0]),.s(sum[7:4]),.P(P[1]),.G(G[1]));
	
	// Calling LOOKAHEADCARRYUNIT
	LOOKAHEADCARRYUNIT lhcu(.cin(cin),.P(P),.G(G),.carry(carry),.p(p),.g(g));
	
	//Caliculation of cout
	assign cout = carry[1];

endmodule
//End of Module CLA8BITWITHLCU

// Module for subtracting two Numbers input a,b,cin output is c = a-b
module Subtract(
		input [7:0] a, 
		input [7:0] b,
		input cin,
		output [7:0] c,
		output cout
    );
	 
	// Finding 2's Complement of b and sotring in d
	wire [7:0] d = ~b+1'b1;
	
	// Callin 8_Bit ClA for a,d,cin
	CLA8BITWITHLCU uut (
		.a(a), 
		.b(d), 
		.cin(cin), 
		.sum(c), 
		.cout(cout)
	);
endmodule
//End of ModuleSubtract

// Module for Dividing 2 numbers
// Input N,D , clk,rst
// Output Q = N//D and R = N%D
module Divide(
		input [7:0] N,
		input [7:0] D,
		input rst,
		input clk,
		output reg [7:0] Q,
		output reg [7:0] R
    );
	 
	//Creating Temp Variable for Storing R-D Temporarily
	wire [7:0] TempR;
	wire cout;

	//Calling Subtract module for caliculation of R-D 
	Subtract s1(.a(R),.b(D),.cin(1'b0),.c(TempR),.cout(cout));

	//Always Block Working at posedge of the clock
	always @(posedge clk) begin
	
		if(rst) begin
			// Initialization part when rst=0;
			R<=N;
			Q<=8'b0;
		end
		
		else if(R>=D) begin
			// Load TempR to R and increment Q by 1
			R<=TempR;
			Q<=Q+1;
		end
		
	end 
endmodule
//End oif Divide Module
