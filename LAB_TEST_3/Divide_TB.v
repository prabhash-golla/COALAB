`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////////////////////////
// Golla Meghanandh Manvith Prabhash
// 22CS30027
// Group number 50
// Slot Number 1
///////////////////////////////////////////////////////////////////////////////////////////////////

module Divide_TB;

	// Inputs
	reg [7:0] N;
	reg [7:0] D;
	reg rst;
	reg clk;

	// Outputs
	wire [7:0] Q;
	wire [7:0] R;

	// Instantiate the Unit Under Test (UUT)
	Divide uut (
		.N(N), 
		.D(D), 
		.rst(rst), 
		.clk(clk), 
		.Q(Q), 
		.R(R)
	);
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		N = 10;
		D = 5;
		rst = 1;
		clk = 0;
		#10 rst=~rst;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

