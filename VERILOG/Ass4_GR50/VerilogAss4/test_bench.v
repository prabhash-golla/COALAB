`timescale 1ns / 1ps

module tb_top_mod;
    reg clk;
    reg [5:0] d_in;
    reg [2:0] error_position;
    wire [15:0] d_disp;
    wire [6:0] d_out0, d_out1, d_out2, d_out3, d_error0, d_error1, d_error2, d_error3,d_orig0,d_orig1,d_orig2,d_orig3,d_hamm0,d_hamm1,d_hamm2,d_hamm3;
    secure_router rtr(d_in, d_out0, d_out1, d_out2, d_out3, clk);
    router_send send0(clk,d_out0,d_orig0);
    router_send send1(clk,d_out1,d_orig1);
    router_send send2(clk,d_out2,d_orig2);
    router_send send3(clk,d_out3,d_orig3);
    error_inject error_c0(d_orig0, error_position, d_error0, clk);
    error_inject error_c1(d_orig1, error_position, d_error1, clk);
    error_inject error_c2(d_orig2, error_position, d_error2, clk);
    error_inject error_c3(d_orig3, error_position, d_error3, clk);
    router_send send4(clk,d_error0,d_hamm0);
    router_send send5(clk,d_error1,d_hamm1);
    router_send send6(clk,d_error2,d_hamm2); 
    router_send send7(clk,d_error3,d_hamm3);   
    error_correct correct0(d_hamm0, d_disp[3:0], clk);
    error_correct correct1(d_hamm1, d_disp[7:4], clk);
    error_correct correct2(d_hamm2, d_disp[11:8], clk);
    error_correct correct3(d_hamm3, d_disp[15:12], clk);
    initial begin
     clk = 0;
     end  
    always 
      #10 clk = ~clk; 
    initial begin
        d_in = 6'b001001;
        error_position = 3'b111;
        #10$monitor("clk= %b,d_in= %b,pos= %b,out =%b",clk, d_in, error_position, d_disp);
    end
endmodule
