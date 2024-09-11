`timescale 1ns / 1ps
module shiftrightlogical(
  input  [7:0] a,
  input  [2:0] shift,
  output  [7:0] out
);
  
  wire [7:0] mul0, mul1, mul2, mul3, mul4, mul5, mul6, mul7;
  
  assign mul7 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, a[7] }; 
  assign mul6 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, a[7], a[6] };
  assign mul5 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, a[7], a[6], a[5] };
  assign mul4 = {1'b0, 1'b0, 1'b0, 1'b0, a[7], a[6], a[5], a[4] };
  assign mul3 = {1'b0, 1'b0, 1'b0, a[7], a[6], a[5], a[4], a[3] };
  assign mul2 = {1'b0, 1'b0, a[7], a[6], a[5], a[4], a[3], a[2] };
  assign mul1 = {1'b0, a[7], a[6], a[5], a[4], a[3], a[2], a[1] };
  assign mul0 = {a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0] };

  mux8to1 m7 (.d(mul7), .sel(shift), .y(out[7]));
  mux8to1 m6 (.d(mul6), .sel(shift), .y(out[6]));
  mux8to1 m5 (.d(mul5), .sel(shift), .y(out[5]));
  mux8to1 m4 (.d(mul4), .sel(shift), .y(out[4]));
  mux8to1 m3 (.d(mul3), .sel(shift), .y(out[3]));
  mux8to1 m2 (.d(mul2), .sel(shift), .y(out[2]));
  mux8to1 m1 (.d(mul1), .sel(shift), .y(out[1]));
  mux8to1 m0 (.d(mul0), .sel(shift), .y(out[0]));

endmodule
