`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:45:07 08/14/2024
// Design Name:   nbitadder
// Module Name:   D:/FPGA/assignment_1/nbit_adder.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nbitadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit8_adder;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [8:0] f;

	// Instantiate the Unit Under Test (UUT)
	bit8adder uut (
		.a(a), 
		.b(b), 
		.f(f)
	);

	initial begin
		// Initialize Inputs
		a = 11;
		b = 20;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

