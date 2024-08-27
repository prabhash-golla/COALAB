`timescale 1ns / 1ps

// Top-level module connecting the secure_router, error_inject, and error_correct modules
module top_module(
    input [0:5] din,        // 6-bit input data
    output [0:3] dout0,     // 4-bit output data for channel 0
    output [0:3] dout1,     // 4-bit output data for channel 1
    output [0:3] dout2,     // 4-bit output data for channel 2
    output [0:3] dout3      // 4-bit output data for channel 3
);

    // Internal wires to connect between modules
    wire [0:6] d_out0;      // 7-bit output data from secure_router for channel 0
    wire [0:6] d_out1;      // 7-bit output data from secure_router for channel 1
    wire [0:6] d_out2;      // 7-bit output data from secure_router for channel 2
    wire [0:6] d_out3;      // 7-bit output data from secure_router for channel 3

    wire [0:6] d_error0;    // 7-bit data with errors injected for channel 0
    wire [0:6] d_error1;    // 7-bit data with errors injected for channel 1
    wire [0:6] d_error2;    // 7-bit data with errors injected for channel 2
    wire [0:6] d_error3;    // 7-bit data with errors injected for channel 3

    // Instantiate the secure_router module to generate 7-bit output data from 6-bit input
    secure_router uut (
        .din(din),           // Connect the 6-bit input data
        .d_out0(d_out0),     // Connect the 7-bit output data for channel 0
        .d_out1(d_out1),     // Connect the 7-bit output data for channel 1
        .d_out2(d_out2),     // Connect the 7-bit output data for channel 2
        .d_out3(d_out3)      // Connect the 7-bit output data for channel 3
    );

    // Instantiate the error_inject module to introduce errors into the 7-bit output data
    error_inject uut0 (
        .d_orig(d_out0),     // Connect the 7-bit output data for channel 0
        .d_error(d_error0)   // Connect the 7-bit data with errors injected for channel 0
    );

    error_inject uut1 (
        .d_orig(d_out1),     // Connect the 7-bit output data for channel 1
        .d_error(d_error1)   // Connect the 7-bit data with errors injected for channel 1
    );

    error_inject uut2 (
        .d_orig(d_out2),     // Connect the 7-bit output data for channel 2
        .d_error(d_error2)   // Connect the 7-bit data with errors injected for channel 2
    );

    error_inject uut3 (
        .d_orig(d_out3),     // Connect the 7-bit output data for channel 3
        .d_error(d_error3)   // Connect the 7-bit data with errors injected for channel 3
    );

    // Instantiate the error_correct module to correct errors in the injected data
    error_correct uut4 (
        .d_hamm(d_error0),   // Connect the 7-bit data with errors injected for channel 0
        .d_disp(dout0)       // Connect the 4-bit corrected output data for channel 0
    );

    error_correct uut5 (
        .d_hamm(d_error1),   // Connect the 7-bit data with errors injected for channel 1
        .d_disp(dout1)       // Connect the 4-bit corrected output data for channel 1
    );

    error_correct uut6 (
        .d_hamm(d_error2),   // Connect the 7-bit data with errors injected for channel 2
        .d_disp(dout2)       // Connect the 4-bit corrected output data for channel 2
    );

    error_correct uut7 (
        .d_hamm(d_error3),   // Connect the 7-bit data with errors injected for channel 3
        .d_disp(dout3)       // Connect the 4-bit corrected output data for channel 3
    );

endmodule
