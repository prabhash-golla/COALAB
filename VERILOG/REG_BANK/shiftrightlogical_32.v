`timescale 1ns / 1ps
module shiftrightlogical_32(
  input  [31:0] a,
  input  [4:0] shift,
  output  [31:0] out
);
  
wire [31:0] mul0, mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8, mul9, mul10, mul11, mul12, mul13, mul14, mul15, 
            mul16, mul17, mul18, mul19, mul20, mul21, mul22, mul23, mul24, mul25, mul26, mul27, mul28, mul29, mul30, mul31;

assign mul31 = { 31'b0 , a[31] };
assign mul30 = { 30'b0 , a[31:30] };
assign mul29 = { 29'b0 , a[31:29] };
assign mul28 = { 28'b0 , a[31:28] };
assign mul27 = { 27'b0 , a[31:27] };
assign mul26 = { 26'b0 , a[31:26] };
assign mul25 = { 25'b0 , a[31:25] };
assign mul24 = { 24'b0 , a[31:24] };
assign mul23 = { 23'b0 , a[31:23] };
assign mul22 = { 22'b0 , a[31:22] };
assign mul21 = { 21'b0 , a[31:21] };
assign mul20 = { 20'b0 , a[31:20] };
assign mul19 = { 19'b0 , a[31:19] };
assign mul18 = { 18'b0 , a[31:18] };
assign mul17 = { 17'b0 , a[31:17] };
assign mul16 = { 16'b0 , a[31:16] };
assign mul15 = { 15'b0 , a[31:15] };
assign mul14 = { 14'b0 , a[31:14] };
assign mul13 = { 13'b0 , a[31:13] };
assign mul12 = { 12'b0 , a[31:12] };
assign mul11 = { 11'b0 , a[31:11] };
assign mul10 = { 10'b0 , a[31:10] };
assign mul9 = { 9'b0 , a[31:9] };
assign mul8 = { 8'b0 , a[31:8] };
assign mul7 = { 7'b0 , a[31:7] };
assign mul6 = { 6'b0 , a[31:6] };
assign mul5 = { 5'b0 , a[31:5] };
assign mul4 = { 4'b0 , a[31:4] };
assign mul3 = { 3'b0 , a[31:3] };
assign mul2 = { 2'b0 , a[31:2] };
assign mul1 = { 1'b0 , a[31:1] };
assign mul0 = { 0'b0 , a[31:0] };
mux32to1 m31( .d(mul31), .sel(shift), .y(out[31]));
mux32to1 m30( .d(mul30), .sel(shift), .y(out[30]));
mux32to1 m29( .d(mul29), .sel(shift), .y(out[29]));
mux32to1 m28( .d(mul28), .sel(shift), .y(out[28]));
mux32to1 m27( .d(mul27), .sel(shift), .y(out[27]));
mux32to1 m26( .d(mul26), .sel(shift), .y(out[26]));
mux32to1 m25( .d(mul25), .sel(shift), .y(out[25]));
mux32to1 m24( .d(mul24), .sel(shift), .y(out[24]));
mux32to1 m23( .d(mul23), .sel(shift), .y(out[23]));
mux32to1 m22( .d(mul22), .sel(shift), .y(out[22]));
mux32to1 m21( .d(mul21), .sel(shift), .y(out[21]));
mux32to1 m20( .d(mul20), .sel(shift), .y(out[20]));
mux32to1 m19( .d(mul19), .sel(shift), .y(out[19]));
mux32to1 m18( .d(mul18), .sel(shift), .y(out[18]));
mux32to1 m17( .d(mul17), .sel(shift), .y(out[17]));
mux32to1 m16( .d(mul16), .sel(shift), .y(out[16]));
mux32to1 m15( .d(mul15), .sel(shift), .y(out[15]));
mux32to1 m14( .d(mul14), .sel(shift), .y(out[14]));
mux32to1 m13( .d(mul13), .sel(shift), .y(out[13]));
mux32to1 m12( .d(mul12), .sel(shift), .y(out[12]));
mux32to1 m11( .d(mul11), .sel(shift), .y(out[11]));
mux32to1 m10( .d(mul10), .sel(shift), .y(out[10]));
mux32to1 m9( .d(mul9), .sel(shift), .y(out[9]));
mux32to1 m8( .d(mul8), .sel(shift), .y(out[8]));
mux32to1 m7( .d(mul7), .sel(shift), .y(out[7]));
mux32to1 m6( .d(mul6), .sel(shift), .y(out[6]));
mux32to1 m5( .d(mul5), .sel(shift), .y(out[5]));
mux32to1 m4( .d(mul4), .sel(shift), .y(out[4]));
mux32to1 m3( .d(mul3), .sel(shift), .y(out[3]));
mux32to1 m2( .d(mul2), .sel(shift), .y(out[2]));
mux32to1 m1( .d(mul1), .sel(shift), .y(out[1]));
mux32to1 m0( .d(mul0), .sel(shift), .y(out[0]));

endmodule