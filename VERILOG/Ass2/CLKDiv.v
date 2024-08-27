`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// GROUP NO :- 50
// GOLLA MEGHANANDH MANVITH PRABHASH - 22CS30027
// SADDA SUCHITH REDDY - 22CS10063
//
//////////////////////////////////////////////////////////////////////////////////
module CLKDiv(
	input cly,
	output reg clk
    );
reg [26:0] counter = 27'b101111101011110000100000000;

always @(posedge cly)
	begin
		if(counter)
			begin 
				counter = counter - 1;
			end
		else 
			begin 
				clk=~clk;
				counter = 27'b101111101011110000100000000;
			end
	end

endmodule
