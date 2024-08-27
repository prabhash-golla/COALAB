`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:01 08/13/2024 
// Design Name: 
// Module Name:    half_structura 
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
module half_structura (a,b,c,s);
input a;
input b;
output c;
output s;
and g1 (c,a,b);
xor g2 (s,a,b);

endmodule
