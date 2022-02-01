`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 01:36:00 PM
// Design Name: 
// Module Name: simple_net
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simple_net(
    input clk,
    
    input a_s,
    input [9:0] a_m,
    input [4:0] a_e,
    
    input b_s,
    input [9:0] b_m,
    input [4:0] b_e,
    
    output out_s,
    output [9:0] out_m,
    output [4:0] out_e
);

    wire p1_s;
    wire [9:0] p1_m;
    wire [4:0] p1_e;
    
    wire p2_s;
    wire [9:0] p2_m;
    wire [4:0] p2_e;
    
    wire s_s;
    wire [9:0] s_m;
    wire [4:0] s_e;
    
//    wire preout_s;
//    wire [9:0] preout_m;
//    wire [4:0] preout_e;
    
                 
    
    reg w1_s = 1'b0;
    reg [9:0] w1_m = 10'b10_1000_0000;
    reg [4:0] w1_e = 5'b0_0011;
    
    reg w2_s = 1'b0;
    reg [9:0] w2_m = 10'b01_0000_0000;
    reg [4:0] w2_e = 5'b0_0011;
    
    mul U1_mul(
        .clk(clk),
    
        .a_s(a_s),
        .a_m(a_m),
        .a_e(a_e),
    
        .b_s(w1_s),
        .b_m(w1_m),
        .b_e(w1_e),
    
        .p_s(p1_s),
        .p_m(p1_m),
        .p_e(p1_e)
    );
    
    mul U2_mul(
        .clk(clk),
        
        .a_s(b_s),
        .a_m(b_m),
        .a_e(b_e),
        
        .b_s(w2_s),
        .b_m(w2_m),
        .b_e(w2_e),
        
        .p_s(p2_s),
        .p_m(p2_m),
        .p_e(p2_e)
    );
    
    sum U_sum(
        .clk(clk),
        
        .a_s(p1_s),
        .a_m(p1_m),
        .a_e(p1_e),
        
        .b_s(p2_s),
        .b_m(p2_m),
        .b_e(p2_e),
        
        .s_s(s_s),
        .s_m(s_m),
        .s_e(s_e)        
    );
    
    relu UR_relu(
        .clk(clk),
        .a_s(s_s),
        .a_m(s_m),
        .a_e(s_e),
        
        .f_s(out_s),
        .f_m(out_m),
        .f_e(out_e)        
    );
   
   
    initial begin
//        w1_e=5'b0_0011;
//        w2_e=5'b0_0011;
           
//        w1_m=10'b10_1000_0000;
//        w2_m=10'b01_0000_0000;
           
//        w1_s=1'b0;
//        w2_s=1'b0;
        
//        out_s=preout_s;
//        out_m=preout_m;
//        out_e=preout_e;
    end
endmodule
