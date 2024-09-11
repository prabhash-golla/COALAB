`timescale 1ns / 1ps
module FA(
    input a, b, d,
    output c, s
);
    wire t1, t2, t3;

    half_structura ha1(
        .a(a),
        .b(b),
        .c(t1),  
        .s(t2)   
    );
    half_structura  ha2(
        .a(t2),  
        .b(d),
        .c(t3),  
        .s(s)    
    );
  or o1 (c,t1,t3);

endmodule