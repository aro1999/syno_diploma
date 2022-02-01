`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2021 08:01:00 PM
// Design Name: 
// Module Name: wallaceMultiplyTB
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


module wallaceMultiplyTB;

    reg clk;
    
    reg [10:0] a;    
    reg [10:0] b;
    
    wire [21:0] p;

    
    wallaceMultiply U_WallaceMultiply(
        .clk(clk),
        .a(a),
        .b(b),
        .p(p)
    );
    
    initial begin
        a=11'b1100_1011_101;
        b=11'b0101_1100_101;
        
        #10 $finish;
    end
    
    initial begin
        clk=1'b0;        
        #5 clk=~clk;
    end
endmodule

