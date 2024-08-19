`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:59:28 08/14/2024
// Design Name:   bit16adder
// Module Name:   D:/FPGA/assignment_1/bit16_adder.v
// Project Name:  assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit16adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit16_adder;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [16:0] f;
	wire [16:0] cin;

	// Instantiate the Unit Under Test (UUT)
	bit16adder uut (
		.a(a), 
		.b(b), 
		.f(f), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 1000;
		b = 2000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

