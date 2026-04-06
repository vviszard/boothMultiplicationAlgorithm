`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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

module CONTROLPATH (ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, clrff, addSub, start, decr, ldCnt, done, clk, q0, qm1,eqz);
    input clk, q0, qm1, start,eqz;
    output reg ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, clrff, addSub, decr, ldCnt, done;
    
    reg [2:0] state;
    
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;
   
   always @(posedge clk)
       begin
           case (state)
               S0: if (start)
                       state <= S1;
               S1: state <= S2;
               S2: state <= S7;
               S3: state <= S5;
               S4: state <= S5;
               S5: state <= S7;
               S6: if (start)
                       state <= S1;
                   else 
                       state <= S6;
               S7: if (eqz)
                       state <= S6;
                   else if ({q0,qm1} == 2'b01)
                       state <= S3;
                   else if ({q0,qm1} == 2'b10)
                       state <= S4;
                   else
                       state <= S5;
                       
               default: state <= S0;
           endcase
       end
       
   always @(state)
       begin
           done = 0;
           clrA = 0;
           ldA = 0;
           sftA = 0;
           clrQ = 0;
           ldQ = 0;
           sftQ = 0;
           ldM = 0;
           clrff = 0;
           addSub = 0;
           decr = 0;
           ldCnt = 0;
           
           case (state)
               S0: begin
                       done = 0;
                   end
               S1: begin
                       clrA = 1;
                       clrff = 1;
                       ldCnt = 1;
                       ldM = 1;
                   end
               S2: begin
                       ldQ = 1;
                   end
               S3: begin
                       ldA = 1;
                       addSub = 1;
                   end
               S4: begin
                       ldA = 1;
                       addSub = 0;
                   end
               S5: begin
                       sftA = 1;
                       sftQ = 1;
                       decr = 1;
                   end
               S6: done = 1;
           endcase
       end 
endmodule