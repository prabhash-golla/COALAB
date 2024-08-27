`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:26 08/14/2024 
// Design Name: 
// Module Name:    CLA16bit 
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
module CLA16bit(
	input [15:0] a,
	input [15:0] b,
	input cin,
	output [15:0] c,
	output [15:0] s,
	output cout,
	wire [2:0] c_out
    );
	 
CLA4bit cl1 (.a(a[3:0]),.b(b[3:0]),.cin(cin),.c(c[3:0]),.s(s[3:0]),.cout(c_out[0]));
CLA4bit cl2 (.a(a[7:4]),.b(b[7:4]),.cin(c_out[0]),.c(c[7:4]),.s(s[7:4]),.cout(c_out[1]));
CLA4bit cl3 (.a(a[11:8]),.b(b[11:8]),.cin(c_out[1]),.c(c[11:8]),.s(s[11:8]),.cout(c_out[2]));
CLA4bit cl4 (.a(a[15:12]),.b(b[15:12]),.cin(c_out[2]),.c(c[15:12]),.s(s[15:12]),.cout(cout));

endmodule
