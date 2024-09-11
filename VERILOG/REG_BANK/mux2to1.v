`timescale 1ns / 1ps
module mux2to1(
  input a,
  input b,
  input sel,
  output out
);

	 wire not_sel;  
    wire and1_out;  
    wire and2_out; 
    not u1 (not_sel, sel);       
    and u2 (and1_out, a, not_sel); 
    and u3 (and2_out, b, sel);    
	 or  u4 (out, and1_out, and2_out); 
  
endmodule
