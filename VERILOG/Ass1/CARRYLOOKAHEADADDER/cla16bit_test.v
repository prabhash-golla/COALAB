`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:44 08/14/2024
// Design Name:   CLA16bit
// Module Name:   D:/FPGA/assignment_1/cla16_adder.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla16bit_test;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire [15:0] c;
	wire [15:0] s;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	CLA16bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.c(c), 
		.s(s), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 3000;
		b = 2000;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

