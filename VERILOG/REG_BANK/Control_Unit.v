`timescale 1ns / 1ps
module Control_Unit(
		input [2:0] control,
		output reg [2:0] A,
		output reg [2:0] B,
		output reg [2:0] Z,
		output reg [3:0] command
    );
always @* begin
	case(control)  
		3'b000 : begin
			A = 3'b010;
			B = 3'b011;
			Z = 3'b001;
			command = 4'b0000;
			end
		
		3'b001 : begin
			A = 3'b101;
			B = 3'b001;
			Z = 3'b100;
			command = 4'b0001;
			end
		4'b010 :  begin
			A = 3'b001;
			B = 3'b010;
			Z = 3'b010;
			command = 4'b1010;
			end
		
		4'b011 :  begin
			A = 3'b001;
			B = 3'b010;
			Z = 3'b111;
			command = 4'b1011;
			end
		
		4'b100 :  begin
			A = 3'b001;
			B = 3'b010;
			Z = 3'b110;
			command = 4'b0010;
			end
		
		4'b101 :  begin
			A = 3'b001;
			B = 3'b010;
			Z = 3'b001;
			command = 4'b0100;
			end
		
		4'b110 :  begin
			A = 3'b010;
			B = 3'b000;
			Z = 3'b011;
			command = 4'b0000;
			end
		
		4'b111 :  begin
			A = 3'b000;
			B = 3'b000;
			Z = 3'b110;
			command = 4'b0000;
			end
		default : $display(command);
		endcase
end
endmodule
