`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 01:54:54 PM
// Design Name: 
// Module Name: simple_netTB
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


module simple_netTB;

    reg clk;
    
    reg a_s;
    reg [9:0] a_m;
    reg [4:0] a_e;
    
    reg b_s;
    reg [9:0] b_m;
    reg [4:0] b_e;
    
    wire out_s;
    wire [9:0] out_m;
    wire [4:0] out_e;

    
    simple_net U_simple_net(
        .clk(clk),
        .a_s(a_s),
        .a_m(a_m),
        .a_e(a_e),
        .b_s(b_s),
        .b_m(b_m),
        .b_e(b_e),
        .out_s(out_s),
        .out_m(out_m),
        .out_e(out_e)
    );
    
    initial begin
        a_e=5'b1_0001;
        b_e=5'b1_0001;
           
        a_m=10'b01_0000_0000;
        b_m=10'b11_0000_0000;
           
        a_s=1'b1;
        b_s=1'b0;   
    
        clk=1'b0;
    
        #200 $finish;

    end
    
    always begin   
        #1 clk=~clk;
    end
endmodule
