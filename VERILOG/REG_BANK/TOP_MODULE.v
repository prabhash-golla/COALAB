`timescale 1ns / 1ps
module TOP_MODULE(
input [2:0] control,
input clk,
input rst
    );
wire [31:0] A,B,Z;
wire [2:0] P,Q,R;
wire [3:0] command;

Control_Unit c1 (
	.control(control),
	.A(P),
	.B(Q),
	.Z(R),
	.command(command)
);

REG_BANK r1 (
	.rst(rst),
	.clk(clk),
	.a(P),
	.b(Q),
	.c(R),
	.Load(Z),
	.Read1(A),
	.Read2(B)
 );
 

KGP_ALU k1(
	.operand1(A),
	.operand2(B),
	.command(command),
	.z(Z)
);

endmodule
