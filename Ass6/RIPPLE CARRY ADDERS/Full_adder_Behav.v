`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:03 08/14/2024 
// Design Name: 
// Module Name:    Full_adder_structra
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

module Full_adder_Behav (a,b,c,s);
input a;
input b;
input cin;
output cout;
output s;

assign s = a ^ b ^ cin;
assign cout = (a & b) | (cin & (a^b));


endmodule