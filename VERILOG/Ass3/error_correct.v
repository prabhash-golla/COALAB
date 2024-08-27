`timescale 1ns / 1ps

module error_correct(
    input [0:6] d_hamm,    // 7-bit input data with Hamming code
    output reg [0:3] d_disp // 4-bit output data after correction
	 );

reg [2:0] num; // To store the bit position where error is detected
reg [0:6] corrected_d_hamm; // Internal register to store corrected Hamming code

always @(*) begin
    // Calculate syndrome bits to find the error position
    num = {d_hamm[0] ^ d_hamm[2] ^ d_hamm[4] ^ d_hamm[6],
           d_hamm[0] ^ d_hamm[1] ^ d_hamm[4] ^ d_hamm[5],
           d_hamm[0] ^ d_hamm[1] ^ d_hamm[2] ^ d_hamm[3]};

    // Initialize the corrected data to input data
    corrected_d_hamm = d_hamm;
    
    // Correct the error if `num` is within the range of valid bit positions
    if (num > 0 && num <= 7) begin
        corrected_d_hamm[7-num] = ~corrected_d_hamm[7-num];
    end

    // Extract the 4-bit data from the corrected Hamming code
    d_disp = {corrected_d_hamm[0], corrected_d_hamm[1], corrected_d_hamm[2], corrected_d_hamm[4]};
end

endmodule

