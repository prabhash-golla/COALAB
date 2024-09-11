`timescale 1ns / 1ps
module mux8to1(
   input wire [7:0] d,    // 8 inputs
    input wire [2:0] sel,  // 3-bit select line
    output wire y          // Output
);
    wire mux_out1, mux_out2, mux_out3, mux_out4;  
    wire mux_out5, mux_out6;  
  mux2to1 m1 (.a(d[0]), .b(d[1]), .sel(sel[0]), .out(mux_out1));
  mux2to1 m2 (.a(d[2]), .b(d[3]), .sel(sel[0]), .out(mux_out2));
  mux2to1 m3 (.a(d[4]), .b(d[5]), .sel(sel[0]), .out(mux_out3));
  mux2to1 m4 (.a(d[6]), .b(d[7]), .sel(sel[0]), .out(mux_out4));

  mux2to1 m5 (.a(mux_out1), .b(mux_out2), .sel(sel[1]), .out(mux_out5));
  mux2to1 m6 (.a(mux_out3), .b(mux_out4), .sel(sel[1]), .out(mux_out6));

  mux2to1 m7 (.a(mux_out5), .b(mux_out6), .sel(sel[2]), .out(y));

endmodule
