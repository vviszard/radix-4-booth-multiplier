`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 03/31/2026 11:12:09 AM
// Design Name: 
// Module Name: ALU
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


module ALU (out, inA, inM, inM2, opSel);
    input  [16:0] inA;
    input  [16:0] inM;
    input  [16:0] inM2;
    input  [2:0]  opSel;
    output reg [16:0] out;
    
    always @(*) 
        begin
            case (opSel)
                3'b000: out = inA;          // no op
                3'b001: out = inA + inM;    // A + M
                3'b010: out = inA - inM;    // A - M
                3'b011: out = inA + inM2;   // A + 2M
                3'b100: out = inA - inM2;   // A - 2M
                default: out = inA;
            endcase
        end
endmodule
