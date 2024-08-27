`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// GROUP NO :- 50
// GOLLA MEGHANANDH MANVITH PRABHASH - 22CS30027
// SADDA SUCHITH REDDY - 22CS10063
//
//////////////////////////////////////////////////////////////////////////////////
module LFSR(
		input cly,
		input rst,
		input [0:3] seed,
		input sel,
		output wire [0:3] w
    );
	 
	 wire [0:3] x;
	 wire p;
	 wire clk;
	 
	CLKDiv c (.cly(cly),.clk(clk));
	 
	MUX m1(.s0(seed[3]),.s1(p),.select(sel),.out(x[0]));
	
	DFF d1(.rst(rst),.clk(clk),.d(x[0]),.q(w[0]));
	
	MUX m2(.s0(seed[2]),.s1(w[0]),.select(sel),.out(x[1]));
	
	DFF d2(.rst(rst),.clk(clk),.d(x[1]),.q(w[1]));
	
	MUX m3(.s0(seed[1]),.s1(w[1]),.select(sel),.out(x[2]));
	
	DFF d3(.rst(rst),.clk(clk),.d(x[2]),.q(w[2]));
	
	MUX m4(.s0(seed[0]),.s1(w[2]),.select(sel),.out(x[3]));
	
	DFF d4(.rst(rst),.clk(clk),.d(x[3]),.q(w[3]));
	
	xor x1(p,w[2],w[3]);
	
	endmodule
