`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 01:18:26 PM
// Design Name: 
// Module Name: mulTB
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


module mulTB;

    reg clk;
    
    reg a_s;
    reg [9:0] a_m;
    reg [4:0] a_e;
    
    reg b_s;
    reg [9:0] b_m;
    reg [4:0] b_e;
    
    wire p_s;
    wire [9:0] p_m;
    wire [4:0] p_e;

    
    mul U_mul(
        .clk(clk),
        .a_s(a_s),
        .a_m(a_m),
        .a_e(a_e),
        .b_s(b_s),
        .b_m(b_m),
        .b_e(b_e),
        .p_s(p_s),
        .p_m(p_m),
        .p_e(p_e)
    );
    
    initial begin
        a_e=5'd17;
        b_e=5'd17;
           
        a_m=10'b01_0000_0000;
        b_m=10'b11_0000_0000;
           
        a_s=1'b1;
        b_s=1'b0;     
    
        clk=1'b0;
    
        #30 $finish;

    end
    
    always begin   
        #1 clk=~clk;
    end
endmodule
