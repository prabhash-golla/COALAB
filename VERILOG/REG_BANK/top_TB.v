`timescale 1ns / 1ps

module top_TB;

	// Inputs
	reg [2:0] control;
	reg clk;
	reg rst;
	always #10 clk=~clk;
	// Instantiate the Unit Under Test (UUT)
	TOP_MODULE uut (
		.control(control), 
		.clk(clk),
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		control = 0;
		clk = 0;
		rst = 0;
		#5 rst = ~rst;
		// Wait 100 ns for global reset to finish
		#20;
		control = 3'b100;
		#20;
		control = 3'b010;
		#20;
		control = 3'b110;
        
		// Add stimulus here

	end
      
endmodule

