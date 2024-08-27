`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:03 08/27/2024
// Design Name:   error_inject
// Module Name:   D:/FPGA/Assignment3/error_inject_tb.v
// Project Name:  Assignment3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: error_inject
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module error_inject_tb;

	// Inputs
	reg [0:6] d_orig;

	// Outputs
	wire [0:6] d_error;

	// Instantiate the Unit Under Test (UUT)
	error_inject uut (
		.d_orig(d_orig), 
		.d_error(d_error)
	);

	initial begin
		// Initialize Inputs
		d_orig = 7'b1111111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

