`timescale 1ns / 1ps
module three_bit_adder (
    input [2:0] a,  
    input [2:0] b, 
  	input carry_in,
    output [2:0] sum, 
    output carry_out
);
    wire c1, c2;
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
        .c(c2),    
        .s(sum[1])
    );

    FA fa3 (
        .a(a[2]),
        .b(b[2]),
        .d(c2),    
        .c(carry_out),
        .s(sum[2])   
    );

endmodule
