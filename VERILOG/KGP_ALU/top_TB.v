`timescale 1ns / 1ps
module top_TB;

	// Inputs
	reg [5:0] a;
	reg [5:0] b;
	reg [3:0] c;

	// Outputs
	wire [7:0] d;

	// Instantiate the Unit Under Test (UUT)
	TOP_MODULE uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d)
	);

	initial begin
		// Initialize Inputs
		a = 6'b001000;
		b = 6'b000010;
		c = 4'b1111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

