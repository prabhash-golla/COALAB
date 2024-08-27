`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:28 08/27/2024
// Design Name:   secure_router
// Module Name:   D:/FPGA/Assignment3/secure_router_tb.v
// Project Name:  Assignment3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: secure_router
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module secure_router_tb;

	// Inputs
	reg [0:5] din;

	// Outputs
	wire [0:6] d_out0;
	wire [0:6] d_out1;
	wire [0:6] d_out2;
	wire [0:6] d_out3;

	// Instantiate the Unit Under Test (UUT)
	secure_router uut (
		.din(din), 
		.d_out0(d_out0), 
		.d_out1(d_out1), 
		.d_out2(d_out2), 
		.d_out3(d_out3)
	);

	initial begin
		// Initialize Inputs
		din = 6'b11111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

