`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:37:21 08/14/2024
// Design Name:   CLA4BITWITHAUGMENTED
// Module Name:   D:/FPGA/assignment_1/CLA4BITWITHAUGMENTED_test.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA4BITWITHAUGMENTED
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA4BITWITHAUGMENTED_test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] c;
	wire P;
	wire G;
	wire [3:0] s;

	// Instantiate the Unit Under Test (UUT)
	CLA4BITWITHAUGMENTED uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.c(c), 
		.P(P), 
		.G(G), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 10;
		b = 15;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

