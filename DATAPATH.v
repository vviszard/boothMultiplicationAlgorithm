`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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


module DATAPATH(ldA,ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addSub,decCnt,ldCnt,dIn,clk,qm1,eqz,AOut,QOut);
    input ldA,ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addSub,clk,decCnt,ldCnt;
    input [15:0] dIn;
    output qm1,eqz;
    output [15:0] AOut, QOut;
    wire [15:0] A, M, Q, Z;
    wire [4:0] count;
    
    assign eqz = ~|count;
    
    SHIFTREG AR (.dOut(A), .dIn(Z), .sIn(A[15]), .clk(clk), .ld(ldA), .clr(clrA), .sft(sftA));
    SHIFTREG QR (.dOut(Q), .dIn(dIn), .sIn(A[0]) , .clk(clk), .ld(ldQ), .clr(clrQ), .sft(sftQ));
    DFLPOP FF (.d(Q[0]), .q(qm1), .clk(clk) , .clr(clrff));
    PIPO MR (.dOut(M), .dIn(dIn), .clk(clk), .ld(ldM));
    ALU ADSB (.out(Z), .in1(A), .in2(M), .addSub(addSub));
    COUNTER CN (.dOut(count), .dec(decCnt), .ld(ldCnt), .clk(clk));
    
    assign AOut = A;
    assign QOut = Q;
endmodule