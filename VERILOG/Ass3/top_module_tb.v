`timescale 1ns / 1ps

module top_module_tb;

	// Inputs
	reg [0:5] din;

	// Outputs
	wire [0:3] dout0;
	wire [0:3] dout1;
	wire [0:3] dout2;
	wire [0:3] dout3;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.din(din), 
		.dout0(dout0), 
		.dout1(dout1), 
		.dout2(dout2), 
		.dout3(dout3)
	);

	initial begin
		// Initialize Inputs
		din = 6'b001010;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

