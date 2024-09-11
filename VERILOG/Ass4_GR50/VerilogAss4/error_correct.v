`timescale 1ns / 1ps
module error_correct(
    input [6:0] d_hamm,
    output reg [3:0] d_disp,
    input clk
    );
    reg [6:0] temp;
    reg [2:0] c;
    
    always @(posedge clk)
        begin
            temp = d_hamm;
            c[0] = d_hamm[0] ^ d_hamm[2] ^ d_hamm[4] ^ d_hamm[6];
            c[1] = d_hamm[1] ^ d_hamm[2] ^ d_hamm[5] ^ d_hamm[6];
            c[2] = d_hamm[3] ^ d_hamm[4] ^ d_hamm[5] ^ d_hamm[6];
            if (c != 3'b000)
                temp[c - 1] = ~temp[c - 1];
            d_disp[0] = temp[2];
            d_disp[1] = temp[4];
            d_disp[2] = temp[5];
            d_disp[3] = temp[6];
        end
endmodule
