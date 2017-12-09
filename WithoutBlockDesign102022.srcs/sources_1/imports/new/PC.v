`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:10:28
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] Next_PC,
    input CLK,
    input Clear,
    input PCWrite,
    output reg [31:0] This_PC
    );
    always @(posedge CLK or posedge Clear)
    begin
        if(Clear)
        begin
            This_PC <= 0;
        end
        else
        if(PCWrite == 1)
        begin
            This_PC <= Next_PC;
        end
    end
endmodule
