`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:25 08/14/2024 
// Design Name: 
// Module Name:    bit64adder 
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
module bit64adder(
	input [63:0] a,
	input [63:0] b,
	output [64:0] f,
	output [64:0] cin
    );
assign cin[0] = 0;
genvar i;
generate for(i=0;i<64;i=i+1) begin: full_adder_block
	Full_adder fa_inst(
		.a(a[i]),
		.b(b[i]),
		.d(cin[i]),
		.c(cin[i+1]),
		.s(f[i])
		);
end endgenerate
assign f[64] = cin[64];
endmodule
