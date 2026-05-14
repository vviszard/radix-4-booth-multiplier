`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 05/06/2026 10:04:50 AM
// Design Name: 
// Module Name: SHIFTREG_A
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


module SHIFTREG_A (dOut, dIn, clk, ld, clr, sft);
    input clk, ld, clr, sft;
    input [16:0] dIn;
    output reg [16:0] dOut;
    
    always @(posedge clk) begin
        if (clr)      
            dOut <= 0;
        else if (ld)  
            dOut <= dIn;
        else if (sft) 
            dOut <= {{2{dOut[16]}}, dOut[16:2]};
    end
endmodule
