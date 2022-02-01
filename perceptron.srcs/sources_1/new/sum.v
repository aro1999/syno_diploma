`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 01:12:21 PM
// Design Name: 
// Module Name: sum
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


module sum(
    input clk,
    
    input a_s,
    input [9:0] a_m,
    input [4:0] a_e,
    
    input b_s,
    input [9:0] b_m,
    input [4:0] b_e,
    
    output reg s_s,
    output reg [9:0] s_m,
    output reg [4:0] s_e

);
    reg [9:0] check;
    reg [9:0] shifted;

    
    always @(posedge clk)
    begin
            if(a_e>b_e) begin
                s_s<=a_s; 
                s_e<=a_e; 
                shifted={1'b1,b_m}>>1;
                shifted=shifted>>(a_e-b_e);
                
                if(a_s ~^ b_s) begin
                    $display("%b",shifted);
                    $display("%b",({1'b1,a_m[9:1]}));
                    $display("%b",shifted+({1'b1,a_m[9:1]}));

                    shifted=(shifted+({1'b1,a_m[9:1]}));
                    
                    if(shifted[9]==1'b1) begin
                        s_m=shifted<<1;
                    end else begin
                        s_e=s_e+1;
                    end                    
                    s_m=shifted<<(shifted[9]==1'b1 ? 1 : 0);
                end else  begin
                    s_m=({1'b1,a_m[9:1]}-shifted);
                    while(s_m[9]!=1'b1) begin
                        s_m=s_m<<1;
                        s_e=s_e-1;
                    end
                    
                    s_m=s_m<<1;
                end
            end else if (a_e<b_e) begin
                s_s<=b_s;
                s_e<=b_e;
                shifted={1'b1,a_m}>>1;
                shifted<=shifted>>(b_e-a_e);
                
                if(a_s ~^ b_s) begin
                    shifted=(shifted+({1'b1,b_m[9:1]}));
                    if(shifted[9]==1'b1) begin
                        s_m=shifted<<1;
                    end else begin
                        s_e=s_e+1;
                    end           
                end else begin
                    s_m=({1'b1,b_m[9:1]}-shifted);
                    
                    while(s_m[9]!=1'b1) begin
                        s_m=s_m<<1;
                        s_e=s_e-1;
                    end
                    
                    s_m=s_m<<1;
                end
                
            end else begin
                s_e<=b_e;
                        
                if(a_m>b_m) begin
                    s_s<=a_s;
                    s_m=({1'b1,a_m[9:1]}-{1'b1,b_m[9:1]});
                    
                    while(s_m[9]!=1'b1) begin
                        s_m=s_m<<1;
                        s_e=s_e-1;
                    end
                    
                    s_m=s_m<<1;
                end else begin
                    s_s<=b_s;
                    s_m=({1'b1,b_m[9:1]}-{1'b1,a_m[9:1]});
                    
                    while(s_m[9]!=1'b1) begin
                        s_m=s_m<<1;
                        s_e=s_e-1;
                    end
                    
                    s_m=s_m<<1;
                    
                end
                
                if(a_s ~^ b_s) begin
                    shifted=({1'b1,b_m[9:1]}+{1'b1,a_m[9:1]});
                    if(shifted[9]==1'b1) begin
                        s_m=shifted<<1;
                    end else begin
                        s_e=s_e+1;
                    end           
                end
            end        
    end  
endmodule
