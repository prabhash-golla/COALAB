`timescale 1ns / 1ps

module router_send(
     input clk,
     input [6:0] d,
     output reg [6:0] d_out
    );
    integer cnt=0;
    always @(posedge clk) begin
        if(cnt<7)
            begin
                d_out[cnt]=d[cnt];
                cnt=cnt+1;
            end 
        else cnt=0;
    end
endmodule

