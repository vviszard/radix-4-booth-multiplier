`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 05/06/2026 10:05:54 AM
// Design Name: 
// Module Name: SHIFTREG_Q
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


module SHIFTREG_Q (dOut, dIn, sIn, clk, ld, clr, sft);
    input clk, ld, clr, sft;
    input [1:0] sIn;
    input [15:0] dIn;
    output reg [15:0] dOut;
    always @(posedge clk) begin
        if (clr)      
            dOut <= 0;
        else if (ld)  
            dOut <= dIn;
        else if (sft) 
            dOut <= {sIn, dOut[15:2]};
    end
endmodule
