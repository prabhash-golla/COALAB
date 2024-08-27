`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:47 08/14/2024 
// Design Name: 
// Module Name:    nbitadder 
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
module bit8adder(
	input [7:0] a,
	input [7:0] b,
	output [8:0] f,
	output [8:0] cin
    );
assign cin[0] = 0;
genvar i;
generate for(i=0;i<8;i=i+1) begin: full_adder_block
	Full_adder fa_inst(
		.a(a[i]),
		.b(b[i]),
		.d(cin[i]),
		.c(cin[i+1]),
		.s(f[i])
		);
end endgenerate
assign f[8] = cin[8];
endmodule
