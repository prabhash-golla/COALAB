`timescale 1ns / 1ps
module REG_BANK(
	input clk,
	input rst,
	input [2:0] a,b,c,
	input [31:0] Load,
	output reg [31:0] Read1,Read2
    );
	
reg [31:0] regbank [7:0];
always @ (posedge rst) begin
	regbank[0]<=32'b0;
	regbank[1]<=32'b111;
	regbank[2]<=32'b1;
	regbank[3]<=32'b1110;
	regbank[4]<=32'b0;
	regbank[5]<=32'b0;
	regbank[6]<=32'b0;
	regbank[7]<=32'b0;
end
always @(posedge clk) begin
	Read1<=regbank[a];
	Read2<=regbank[b];
end
always @(negedge clk) begin
	regbank[c]<=Load;
end
endmodule