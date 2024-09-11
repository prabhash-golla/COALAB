`timescale 1ns / 1ps
module shiftleft_32(
	input  [31:0] a,
  input  [4:0] shift,
  output  [31:0] out
    );
	 
wire [31:0] mul0, mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8, mul9, mul10, mul11, mul12, mul13, mul14, mul15, 
            mul16, mul17, mul18, mul19, mul20, mul21, mul22, mul23, mul24, mul25, mul26, mul27, mul28, mul29, mul30, mul31;
assign mul0 = {31'b0, a[0]};
assign mul1 = {30'b0, a[0], a[1]};
assign mul2 = {29'b0, a[0], a[1], a[2]};
assign mul3 = {28'b0, a[0], a[1], a[2], a[3]};
assign mul4 = {27'b0, a[0], a[1], a[2], a[3], a[4]};
assign mul5 = {26'b0, a[0], a[1], a[2], a[3], a[4], a[5]};
assign mul6 = {25'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6]};
assign mul7 = {24'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]};
assign mul8 = {23'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]};
assign mul9 = {22'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]};
assign mul10 = {21'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]};
assign mul11 = {20'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]};
assign mul12 = {19'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]};
assign mul13 = {18'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]};
assign mul14 = {17'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]};
assign mul15 = {16'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]};
assign mul16 = {15'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16]};
assign mul17 = {14'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17]};
assign mul18 = {13'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18]};
assign mul19 = {12'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19]};
assign mul20 = {11'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]};
assign mul21 = {10'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21]};
assign mul22 = {9'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22]};
assign mul23 = {8'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23]};
assign mul24 = {7'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24]};
assign mul25 = {6'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25]};
assign mul26 = {5'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26]};
assign mul27 = {4'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27]};
assign mul28 = {3'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28]};
assign mul29 = {2'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29]};
assign mul30 = {1'b0, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30]};
assign mul31 = {a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30], a[31]};

mux32to1 m0(.d(mul0),.sel(shift),.y(out[0]));
mux32to1 m1(.d(mul1),.sel(shift),.y(out[1]));
mux32to1 m2(.d(mul2),.sel(shift),.y(out[2]));
mux32to1 m3(.d(mul3),.sel(shift),.y(out[3]));
mux32to1 m4(.d(mul4),.sel(shift),.y(out[4]));
mux32to1 m5(.d(mul5),.sel(shift),.y(out[5]));
mux32to1 m6(.d(mul6),.sel(shift),.y(out[6]));
mux32to1 m7(.d(mul7),.sel(shift),.y(out[7]));
mux32to1 m8(.d(mul8),.sel(shift),.y(out[8]));
mux32to1 m9(.d(mul9),.sel(shift),.y(out[9]));
mux32to1 m10(.d(mul10),.sel(shift),.y(out[10]));
mux32to1 m11(.d(mul11),.sel(shift),.y(out[11]));
mux32to1 m12(.d(mul12),.sel(shift),.y(out[12]));
mux32to1 m13(.d(mul13),.sel(shift),.y(out[13]));
mux32to1 m14(.d(mul14),.sel(shift),.y(out[14]));
mux32to1 m15(.d(mul15),.sel(shift),.y(out[15]));
mux32to1 m16(.d(mul16),.sel(shift),.y(out[16]));
mux32to1 m17(.d(mul17),.sel(shift),.y(out[17]));
mux32to1 m18(.d(mul18),.sel(shift),.y(out[18]));
mux32to1 m19(.d(mul19),.sel(shift),.y(out[19]));
mux32to1 m20(.d(mul20),.sel(shift),.y(out[20]));
mux32to1 m21(.d(mul21),.sel(shift),.y(out[21]));
mux32to1 m22(.d(mul22),.sel(shift),.y(out[22]));
mux32to1 m23(.d(mul23),.sel(shift),.y(out[23]));
mux32to1 m24(.d(mul24),.sel(shift),.y(out[24]));
mux32to1 m25(.d(mul25),.sel(shift),.y(out[25]));
mux32to1 m26(.d(mul26),.sel(shift),.y(out[26]));
mux32to1 m27(.d(mul27),.sel(shift),.y(out[27]));
mux32to1 m28(.d(mul28),.sel(shift),.y(out[28]));
mux32to1 m29(.d(mul29),.sel(shift),.y(out[29]));
mux32to1 m30(.d(mul30),.sel(shift),.y(out[30]));
mux32to1 m31(.d(mul31),.sel(shift),.y(out[31]));

endmodule
