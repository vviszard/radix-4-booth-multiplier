`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 03/31/2026 02:55:01 PM
// Design Name: 
// Module Name: TOP
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


module TOP (product, done, dIn, clk, start);
    input  [15:0] dIn;
    input  clk, start;
    output done;
    output [31:0] product;

    wire ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, ldM2, clrff, decCnt, ldCnt, qm1, eqz, q0, q1;
    wire [2:0]  opSel;
    wire [16:0] AVal;
    wire [15:0] QVal;

    CONTROLPATH CP ( .ldA(ldA), .clrA(clrA), .sftA(sftA), .ldQ(ldQ), .clrQ(clrQ), .sftQ(sftQ), .ldM(ldM), .ldM2(ldM2), .clrff(clrff), .opSel(opSel), .start(start), .decr(decCnt), .ldCnt(ldCnt), .done(done), .clk(clk), .q0(q0), .q1(q1), .qm1(qm1), .eqz(eqz));

    DATAPATH DP ( .ldA(ldA), .ldQ(ldQ), .ldM(ldM), .ldM2(ldM2), .clrA(clrA), .clrQ(clrQ), .clrff(clrff), .sftA(sftA), .sftQ(sftQ), .opSel(opSel), .decCnt(decCnt), .ldCnt(ldCnt), .dIn(dIn), .clk(clk), .q0(q0), .q1(q1), .qm1(qm1), .eqz(eqz), .AOut(AVal), .QOut(QVal));

    assign product = {AVal[15:0], QVal};
endmodule
