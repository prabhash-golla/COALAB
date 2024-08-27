`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:22 08/13/2024 
// Design Name: 
// Module Name:    Full_adder 
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
// Structural
//////////////////////////////////////////////////////////////////////////////////
module Full_adder(
    input a, b, d,
    output c, s
);
    wire t1, t2, t3;

    // First half-adder
    half_adder ha1(
        .a(a),
        .b(b),
        .c(t1),  // Carry output of the first half-adder
        .s(t2)   // Sum output of the first half-adder
    );

    // Second half-adder
    half_adder ha2(
        .a(t2),  // Sum from the first half-adder
        .b(d),
        .c(t3),  // Carry output of the second half-adder
        .s(s)    // Sum output of the full adder
    );

    // OR gate for carry output
    assign c = t1 | t3; // Final carry output of the full adder

endmodule

