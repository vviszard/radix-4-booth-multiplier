`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 03/31/2026 12:04:07 PM
// Design Name: 
// Module Name: DATAPATH
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


module DATAPATH (ldA, ldQ, ldM, ldM2, clrA, clrQ, clrff, sftA, sftQ, opSel, decCnt, ldCnt, dIn, clk, q0, q1, qm1, eqz, AOut, QOut);
    input ldA, ldQ, ldM, ldM2, clrA, clrQ, clrff;
    input sftA, sftQ, clk, decCnt, ldCnt;
    input [2:0] opSel;
    input [15:0] dIn;
    output q0, q1, qm1, eqz;
    output [16:0] AOut;
    output [15:0] QOut;

    wire [16:0] A, Z, M_ext, M2;
    wire [15:0] M, Q;
    wire [3:0]  count;

    assign eqz   = ~|count;
    assign q0    = Q[0];
    assign q1    = Q[1];

    // sign extend M to 17 bits for ALU
    assign M_ext = {M[15], M};

    SHIFTREG_A AR (.dOut(A), .dIn(Z), .clk(clk), .ld(ldA), .clr(clrA), .sft(sftA));
    SHIFTREG_Q QR (.dOut(Q), .dIn(dIn), .sIn(A[1:0]), .clk(clk), .ld(ldQ), .clr(clrQ), .sft(sftQ));
    DFLPOP     FF (.d(Q[1]), .q(qm1), .en(sftQ), .clk(clk), .clr(clrff));
    PIPO       MR (.dOut(M), .dIn(dIn), .clk(clk), .ld(ldM));
    PIPO17    M2R (.dOut(M2), .dIn({M_ext[15:0], 1'b0}), .clk(clk), .ld(ldM2));
    ALU      ADSB (.out(Z), .inA(A), .inM(M_ext), .inM2(M2), .opSel(opSel));
    COUNTER    CN (.dOut(count), .dec(decCnt), .ld(ldCnt), .clk(clk));

    assign AOut = A;
    assign QOut = Q;
endmodule