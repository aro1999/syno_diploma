`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 01:06:24 PM
// Design Name: 
// Module Name: relu
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


module relu(
    input clk,
    
    input a_s,
    input [9:0] a_m,
    input [4:0] a_e,
    
    output reg f_s,
    output reg [9:0] f_m,
    output reg [4:0] f_e
);

    always @(posedge clk)
    begin
        if(a_s==1'b1) begin
            f_s=0;
            f_e=0;
            f_m=0;
        end else begin
            f_s=a_s;
            f_e=a_e;
            f_m=a_m;
        end
    end
endmodule
