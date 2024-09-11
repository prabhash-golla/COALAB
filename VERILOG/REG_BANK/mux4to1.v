`timescale 1ns / 1ps
module mux4to1 (
  input  wire [3:0] a,    // 4 inputs
  input  wire [1:0] sel,  // 2-bit select line
  output wire y           // Output
);

  wire mux_out1, mux_out2;

  // First stage of multiplexers
  mux2to1 m1 (.a(a[0]), .b(a[1]), .sel(sel[0]), .out(mux_out1));
  mux2to1 m2 (.a(a[2]), .b(a[3]), .sel(sel[0]), .out(mux_out2));

  // Second stage of multiplexer
  mux2to1 m3 (.a(mux_out1), .b(mux_out2), .sel(sel[1]), .out(y));

endmodule
