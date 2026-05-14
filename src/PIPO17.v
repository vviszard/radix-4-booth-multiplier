`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 05/06/2026 10:07:50 AM
// Design Name: 
// Module Name: PIPO17
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


module PIPO17 (dOut, dIn, clk, ld);
    input [16:0] dIn; 
    input ld, clk;
    output reg [16:0] dOut;
    
    always @(posedge clk) 
        if (ld) 
            dOut <= dIn;
endmodule
