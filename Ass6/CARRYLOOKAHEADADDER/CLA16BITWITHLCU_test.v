`timescale 1ns / 1ps

module CLA4BITWITHAUGMENTED_test;

    // Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

    //Outputs
	wire [3:0] carry;
	wire p;
	wire g;
	wire [15:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
	CLA16BITWITHLCU uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.carry(carry), 
		.p(p), 
		.g(g), 
		.sum(sum),
        .cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 10;
		b = 15;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

