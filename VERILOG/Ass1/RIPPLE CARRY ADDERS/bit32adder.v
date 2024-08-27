`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:19 08/14/2024 
// Design Name: 
// Module Name:    bit32adder 
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
module bit32adder(
	input [31:0] a,
	input [31:0] b,
	output [32:0] f,
	output [32:0] cin
    );
assign cin[0] = 0;
genvar i;
generate for(i=0;i<32;i=i+1) begin: full_adder_block
	Full_adder fa_inst(
		.a(a[i]),
		.b(b[i]),
		.d(cin[i]),
		.c(cin[i+1]),
		.s(f[i])
		);
end endgenerate
assign f[32] = cin[32];

endmodule
