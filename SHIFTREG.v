`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 10:57:23 AM
// Design Name: 
// Module Name: SHIFTREG
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


module SHIFTREG (dOut,dIn,sIn,clk,ld,clr,sft);
    input sIn, clk, ld, clr, sft;
    input [15:0] dIn;
    output reg [15:0] dOut;
    
    always @(posedge clk)
        begin
            if (clr)
                dOut <= 0;
            else if (ld)
                dOut <= dIn;
            else if (sft)
                dOut <= {sIn,dOut[15:1]};
        end
endmodule
