`timescale 1ns / 1ps

module secure_router(
	 input [0:5] din,
    output reg [0:6] d_out0,
    output reg [0:6] d_out1,
    output reg [0:6] d_out2,
    output reg [0:6] d_out3
    );
	 
always @* begin
    // Default values for the outputs
    d_out0 = 7'b0;
    d_out1 = 7'b0;
    d_out2 = 7'b0;
    d_out3 = 7'b0;

    if (din[0] & din[1]) begin
        d_out3 = {din[2], din[3], din[4], (din[2] ^ din[3] ^ din[4]), din[5], (din[2] ^ din[3] ^ din[5]), (din[4] ^ din[2] ^ din[5])};
    end
	 if (~din[0] & din[1]) begin
        d_out1 = {din[2], din[3], din[4], (din[2] ^ din[3] ^ din[4]), din[5], (din[2] ^ din[3] ^ din[5]), (din[4] ^ din[2] ^ din[5])};
    end
	 if (~din[0] & ~din[1]) begin
        d_out0 = {din[2], din[3], din[4], (din[2] ^ din[3] ^ din[4]), din[5], (din[2] ^ din[3] ^ din[5]), (din[4] ^ din[2] ^ din[5])};
    end
	 if (din[0] & ~din[1]) begin
        d_out2 = {din[2], din[3], din[4], (din[2] ^ din[3] ^ din[4]), din[5], (din[2] ^ din[3] ^ din[5]), (din[4] ^ din[2] ^ din[5])};
    end
end

endmodule
