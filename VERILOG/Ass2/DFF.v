`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// GROUP NO :- 50
// GOLLA MEGHANANDH MANVITH PRABHASH - 22CS30027
// SADDA SUCHITH REDDY - 22CS10063
//
//////////////////////////////////////////////////////////////////////////////////
module DFF(
		input rst,
		input clk,
		input d,
		output reg q
    );

	always @(posedge clk) 
		begin
			if (rst) 
				begin
					q <= 1'b0;
				end
			else
				begin
					q <= d;
				end
		end

endmodule
