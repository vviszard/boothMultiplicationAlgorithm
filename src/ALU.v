`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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


module ALU (out, in1, in2, addSub);
    input [15:0] in1, in2;
    input addSub;
    output reg [15:0] out;
    
    always @(*)
        begin
            if (addSub == 0)
                out = in1 - in2;
            else
                out = in1 + in2;
        end   
endmodule
