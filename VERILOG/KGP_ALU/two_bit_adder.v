`timescale 1ns / 1ps
module two_bit_adder (
    input [1:0] a, 
    input [1:0] b, 
  	input carry_in,
    output [1:0] sum, 
    output carry_out 
);
    wire c1; 
    FA fa1 (
        .a(a[0]),
        .b(b[0]),
      	.d(carry_in), 
        .c(c1),   
        .s(sum[0])
    );
    FA fa2 (
        .a(a[1]),
        .b(b[1]),
        .d(c1),   
        .c(carry_out),
        .s(sum[1]) 
    );

endmodule
