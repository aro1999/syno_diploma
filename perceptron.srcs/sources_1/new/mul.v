`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 01:22:18 PM
// Design Name: 
// Module Name: mul
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


    module mul(
    input clk,
    
    input a_s,
    input [9:0] a_m,
    input [4:0] a_e,
    
    input b_s,
    input [9:0] b_m,
    input [4:0] b_e,
    
    output reg p_s,
    output reg [9:0] p_m,
    output reg [4:0] p_e

);

    wire [21:0] p;
    
    wallaceMultiply U_wallaceMultiply(
        .clk(clk),
        .a({1'b1,a_m}),
        .b({1'b1,b_m}),
        .p(p)
    );

    always @(posedge clk)
    begin
        $display("test"); 
        $display(2'b11 + 2'b11);
        p_e = a_e + b_e - 15;
            
        p_s <= a_s ^ b_s;
        p_m <= {p[21], p[20], p[19], p[18], p[17], p[16], p[15], p[14], p[13], p[12]};
        if(p_m[9] == 1'b0) begin
            
            p_m = p_m << 2;
        end else begin
            
            p_m = p_m << 1;
            p_e = p_e+1;
        end
        
        if(p_e > 31 | p_e < 0) begin
            p_e = 5'bx;
            p_m = 10'bx;
            p_s = 1'bx;  
        end
    end        
endmodule
