`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 11:18:39 AM
// Design Name: 
// Module Name: COUNTER
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


module COUNTER(dOut,dec,ld,clk);
    input dec,clk,ld;
    output reg [4:0] dOut;
    always @(posedge clk)
        begin
            if (ld)
                dOut <= 5'b10000;
            else if (dec)
                dOut <= dOut - 1;
        end
endmodule
