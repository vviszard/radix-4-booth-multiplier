`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 03/31/2026 11:05:31 AM
// Design Name: 
// Module Name: PIPO
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


module PIPO (dOut, dIn, clk, ld);
    input [15:0] dIn; 
    input ld, clk;
    output reg [15:0] dOut;
    
    always @(posedge clk) 
        if (ld) 
            dOut <= dIn;
endmodule
