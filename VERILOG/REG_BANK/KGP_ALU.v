`timescale 1ns / 1ps

module KGP_ALU(
		input [31:0] operand1,
		input [31:0] operand2,
		input [3:0] command,
		output reg [31:0] z
    );
wire [31:0] add,sub,andg,org,xorg,notg,sl,srl,sra,add4,sub4,ham;
wire flag1,flag2,flag3,flag4;
	Adder_32 ad(
		.a(operand1),
		.b(operand2),
		.cin(1'b0),
		.c(add),
		.cout(flag1)
		);
	Subtract_32 su(
		.a(operand1),
		.b(operand2),
		.cin(1'b0),
		.c(sub),
		.cout(flag2)
		);
	AND_32 g1(.c(andg),.a(operand1),.b(operand2));
	OR_32 g2(.c(org),.a(operand1),.b(operand2));
	XOR_32 g3(.c(xorg),.a(operand1),.b(operand2));
	NOT_32 g4(.c(notg),.a(operand1));
	//HAMM h1(.a(operand1),.c(ham));
	shiftleft_32 s1(
		.a(operand1),
		.shift(operand2[4:0]),
		.out(sl)
	);
	shiftrightlogical_32 s2(
		.a(operand1),
		.shift(operand2[4:0]),
		.out(srl)
	);
	shiftrightarthimetic_32 s3(
		.a(operand1),
		.shift(operand2[4:0]),
		.out(sra)
	);
	Adder_32 ad4(
		.a(operand1),
		.b(32'b100),
		.cin(1'b0),
		.c(add4),
		.cout(flag3)
		);
	Subtract_32 su4(
		.a(operand1),
		.b(32'b100),
		.cin(1'b0),
		.c(sub4),
		.cout(flag4)
	);
	always @(*) begin
			case(command)  
				4'b0000 : z = add;
				4'b0001 : z = sub;
				4'b0010 :  z = operand1*operand2;
				4'b0011 :  z = operand1/operand2;
				4'b0100 :  z = andg;
				4'b0101 :  z = org;
				4'b0110 :  z = xorg;
				4'b0111 :  z = notg;
				4'b1000 :  z = operand1;
				4'b1001 :  z = operand2;
				4'b1010 :  z = sl;
				4'b1011 :  z = srl;
				4'b1100 :  z = sra;
				4'b1101 :  z = add4;
				4'b1110 :  z = sub4;
				4'b1111 :  z = ham;
				default : $display(command);
			endcase
	end
	
		


endmodule
