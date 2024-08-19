`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:36 08/14/2024
// Design Name:   bit64adder
// Module Name:   D:/FPGA/assignment_1/bir64_adder.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit64adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit64_adder;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;

	// Outputs
	wire [64:0] f;
	wire [64:0] cin;

	// Instantiate the Unit Under Test (UUT)
	bit64adder uut (
		.a(a), 
		.b(b), 
		.f(f), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = -1;
		b = -2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

