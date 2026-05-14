`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 03/31/2026 11:08:52 AM
// Design Name: 
// Module Name: DFLPOP
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


module DFLPOP (d, q, en, clk, clr);
    input d, en, clk, clr;
    output reg q;
    initial q = 0;
    always @(posedge clk)
        if (clr)     
            q <= 0;
        else if (en) 
            q <= d;
endmodule
