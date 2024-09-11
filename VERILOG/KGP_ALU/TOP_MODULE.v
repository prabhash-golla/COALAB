`timescale 1ns / 1ps
module TOP_MODULE(
input [5:0] a,
input [5:0] b,
input [3:0] c,
output [7:0] d
    );
	wire [31:0] command;
assign command = {c,14'b0,a,2'b0,b}; 	
KGP_ALU k1(
	.command(command),
	.z(d)
	);

endmodule
