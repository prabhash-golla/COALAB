`timescale 1ns / 1ps
module half_structura (a,b,c,s);
input a;
input b;
output c;
output s;
and g1 (c,a,b);
xor g2 (s,a,b);

endmodule