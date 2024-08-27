`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:34:57 08/14/2024
// Design Name:   CLA4bit
// Module Name:   D:/FPGA/assignment_1/cla_4bit.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_4bit;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [4:0] c;
	wire [4:0] s;

	// Instantiate the Unit Under Test (UUT)
	CLA4bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.c(c), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 10;
		b = 5;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

