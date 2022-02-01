`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2022 10:50:51 PM
// Design Name: 
// Module Name: reluTB
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


module UR_relu;
    reg clk;
        
    reg a_s;
    reg [9:0] a_m;
    reg [4:0] a_e;
    
    wire out_s;
    wire [9:0] out_m;
    wire [4:0] out_e;
      
    U_relu relu(
        .a_s(a_s),
        .a_m(a_m),
        .a_e(a_e),
        
        .f_s(out_s),
        .f_m(out_m),
        .f_e(out_e)
    );  
    
    initial begin
        a_e=5'b1_0000;
        a_m=10'b10_0000_0000;
        a_s=1'b0;
        
        clk=1'b0;
    
        #200 $finish;

    end
    
    always begin   
        #1 clk=~clk;
    end
endmodule
