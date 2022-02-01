`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 01:32:02 PM
// Design Name: 
// Module Name: comparisonTB
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


module sumTB;

    reg clk;
    
    reg a_s;
    reg [9:0] a_m;
    reg [4:0] a_e;
    
    reg b_s;
    reg [9:0] b_m;
    reg [4:0] b_e;
    
    wire s_s;
    wire [9:0] s_m;
    wire [4:0] s_e;

    
    sum U_sum(
        .clk(clk),
        .a_s(a_s),
        .a_m(a_m),
        .a_e(a_e),
        .b_s(b_s),
        .b_m(b_m),
        .b_e(b_e),
        .s_s(s_s),
        .s_m(s_m),
        .s_e(s_e)
    );
    
    initial begin
        a_e=5'b0_0011;
        b_e=5'b0_0010;
           
        a_m=10'b10_1000_0000;
        b_m=10'b01_0000_0000;
           
        a_s=1'b0;
        b_s=1'b0;   
        
        #10 $finish;
    end
    
    initial begin
        clk=1'b0;        
        #5 clk=~clk;
    end
endmodule
