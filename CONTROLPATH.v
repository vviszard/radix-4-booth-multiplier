`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal
// 
// Create Date: 03/31/2026 03:03:06 PM
// Design Name: 
// Module Name: CONTROLPATH
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

module CONTROLPATH (ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, ldM2, clrff, opSel, start, decr, ldCnt, done, clk, q0, q1, qm1, eqz);
    input  clk, q0, q1, qm1, start, eqz;
    output reg ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, ldM2, clrff, decr, ldCnt, done;
    output reg [2:0] opSel;

    reg [3:0] state;
    parameter S0=4'd0,  // idle
              S1=4'd1,  // init: clrA, clrff, ldCnt, ldM
              S8=4'd8,  // precompute 2M -> ldM2
              S2=4'd2,  // ldQ
              S7=4'd7,  // evaluate {q1,q0,qm1}
              S3=4'd3,  // A = A + M
              S4=4'd4,  // A = A - M
              S5=4'd5,  // A = A + 2M
              S6=4'd6,  // A = A - 2M
              SX=4'd9,  // shift by 2, decrement
              S9=4'd10; // done

    always @(posedge clk) begin
        case (state)
            S0: if (start) state <= S1;
            S1: state <= S8;           // after init, precompute 2M
            S8: state <= S2;           // after 2M stored, load Q
            S2: state <= S7;           // after ldQ, wait one cycle
            S7: if      (eqz)
                    state <= S9;
                else begin
                    case ({q1,q0,qm1})
                        3'b000: state <= SX;     // no operation
                        3'b001: state <= S3;     // +M
                        3'b010: state <= S3;     // +M
                        3'b011: state <= S5;     // +2M
                        3'b100: state <= S6;     // -2M
                        3'b101: state <= S4;     // -M
                        3'b110: state <= S4;     // -M
                        3'b111: state <= SX;     // no operation
                        default: state <= SX;
                    endcase
                end
            S3: state <= SX;
            S4: state <= SX;
            S5: state <= SX;
            S6: state <= SX;
            SX: state <= S7;           // shift done and re evaluate
            S9: if (start) state <= S1; else state <= S9;
            default: state <= S0;
        endcase
    end

    always @(state) begin
    
        done=0; 
        clrA=0; 
        ldA=0; 
        sftA=0; 
        clrQ=0; 
        ldQ=0;
        sftQ=0; 
        ldM=0; 
        ldM2=0; 
        clrff=0; 
        opSel=3'b000;
        decr=0; 
        ldCnt=0;

        case (state)
            S1: begin clrA=1; clrff=1; ldCnt=1; ldM=1; end
            S8: begin ldM2=1; end
            S2: begin ldQ=1; end
            S3: begin ldA=1; opSel=3'b001; end   // +M
            S4: begin ldA=1; opSel=3'b010; end   // -M
            S5: begin ldA=1; opSel=3'b011; end   // +2M
            S6: begin ldA=1; opSel=3'b100; end   // -2M
            SX: begin sftA=1; sftQ=1; decr=1; end
            S9: done=1;
        endcase
    end
endmodule