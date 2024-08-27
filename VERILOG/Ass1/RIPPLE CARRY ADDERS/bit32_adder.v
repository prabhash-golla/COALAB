`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:51 08/14/2024
// Design Name:   bit32adder
// Module Name:   D:/FPGA/assignment_1/bit32_adder.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit32adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit32_adder;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [32:0] f;
	wire [32:0] cin;

	// Instantiate the Unit Under Test (UUT)
	bit32adder uut (
		.a(a), 
		.b(b), 
		.f(f), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 100;
		b = 200;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

