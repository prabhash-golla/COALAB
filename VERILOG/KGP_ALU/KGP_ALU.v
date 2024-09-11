`timescale 1ns / 1ps

module KGP_ALU(
		input [31:0] command,
		output reg [7:0] z
    );
wire [7:0] add,sub,andg,org,xorg,notg,sl,srl,sra,add4,sub4,ham;
wire flag1,flag2,flag3,flag4;
	Adder ad(
		.a(command[15:8]),
		.b(command[7:0]),
		.cin(1'b0),
		.c(add),
		.cout(flag1)
		);
	Subtract su(
		.a(command[15:8]),
		.b(command[7:0]),
		.cin(1'b0),
		.c(sub),
		.cout(flag2)
		);
	AND g1(.c(andg),.a(command[15:8]),.b(command[7:0]));
	OR g2(.c(org),.a(command[15:8]),.b(command[7:0]));
	XOR g3(.c(xorg),.a(command[15:8]),.b(command[7:0]));
	NOT g4(.c(notg),.a(command[15:8]));
	HAMM h1(.a(command[15:8]),.c(ham));
	shiftleft s1(
		.a(command[15:8]),
		.shift(command[2:0]),
		.out(sl)
	);
	shiftrightlogical s2(
		.a(command[15:8]),
		.shift(command[2:0]),
		.out(srl)
	);
	shiftrightarthimetic s3(
		.a(command[15:8]),
		.shift(command[2:0]),
		.out(sra)
	);
	Adder ad4(
		.a(command[15:8]),
		.b(8'b100),
		.cin(1'b0),
		.c(add4),
		.cout(flag3)
		);
	Subtract su4(
		.a(command[15:8]),
		.b(8'b100),
		.cin(1'b0),
		.c(sub4),
		.cout(flag4)
	);
	always @(*) begin
			case(command[31:28])  
				4'b0000 : z = add;
				4'b0001 : z = sub;
				4'b0010 :  z = command[15:8]*command[7:0];
				4'b0011 :  z = command[15:8]/command[7:0];
				4'b0100 :  z = andg;
				4'b0101 :  z = org;
				4'b0110 :  z = xorg;
				4'b0111 :  z = notg;
				4'b1000 :  z = command[15:8];
				4'b1001 :  z = command[7:0];
				4'b1010 :  z = sl;
				4'b1011 :  z = srl;
				4'b1100 :  z = sra;
				4'b1101 :  z = add4;
				4'b1110 :  z = sub4;
				4'b1111 :  z = ham;
				default : $display(command[31:28]);
			endcase
	end
	
		


endmodule
