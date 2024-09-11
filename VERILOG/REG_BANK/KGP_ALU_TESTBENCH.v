`timescale 1ns / 1ps

module KGP_ALU_TESTBENCH;

	// Inputs
	reg [31:0] command;

	// Outputs
	wire [7:0] z;

	// Instantiate the Unit Under Test (UUT)
	KGP_ALU uut (
		.command(command), 
		.z(z)
	);
	initial begin
		// add
		command = 32'b00000000000000000000001100000001;
		#100
		// multiply
		command = 32'b00100000000000000000001100000010;
		#100
		//xor
      command = 32'b01100000000000000010001100001010;
		#100
		//left shift
		command = 32'b10100000000000000000001000000011;  
		#100
		// ham
		command = 32'b11110000000000000011101000000011;
		
	end
      
endmodule

