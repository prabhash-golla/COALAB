`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// GROUP NO :- 50
// GOLLA MEGHANANDH MANVITH PRABHASH - 22CS30027
// SADDA SUCHITH REDDY - 22CS10063
//
//////////////////////////////////////////////////////////////////////////////////
module MUX(
	input s0,
	input s1,
	input select,
	output reg out
    );
	
	always @(*)
		begin
			if(select) 
				begin
					out <= s0;
				end
			else
				begin
					out <= s1;
				end
		end
				
			

endmodule
