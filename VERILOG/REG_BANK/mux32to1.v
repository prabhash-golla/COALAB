`timescale 1ns / 1ps
module mux32to1(
    input wire [31:0] d,    // 32 inputs
    input wire [4:0] sel,   // 5-bit select line
    output wire y           // Output
);

    wire [3:0] mux_out;  
    
    // 8-to-1 MUXes
    mux8to1 m1 (.d(d[7:0]), .sel(sel[2:0]), .y(mux_out[0]));
    mux8to1 m2 (.d(d[15:8]), .sel(sel[2:0]), .y(mux_out[1]));
    mux8to1 m3 (.d(d[23:16]), .sel(sel[2:0]), .y(mux_out[2]));
    mux8to1 m4 (.d(d[31:24]), .sel(sel[2:0]), .y(mux_out[3]));
    
    // 4-to-1 MUX for the final selection
    mux4to1 m5 (.a(mux_out),.sel(sel[4:3]), .y(y));

endmodule
