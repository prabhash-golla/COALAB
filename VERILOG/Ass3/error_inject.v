`timescale 1ns / 1ps

module error_inject(
	input [0:6] d_orig,
	output reg [0:6] d_error
    );
	 
integer mynumber;
always @* begin
	d_error = d_orig;
	mynumber = $random % 7;
	d_error[mynumber] = ~d_error[mynumber];
end

endmodule
