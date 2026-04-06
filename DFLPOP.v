`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 11:08:52 AM
// Design Name: 
// Module Name: DFLPOP
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


module DFLPOP (d,q,clk,clr,en);
    input d,clk,clr,en;
    output reg q;
    
    always @(posedge clk)
        if (clr)
            q <= 0;
        else if (en)
            q <= d;
endmodule