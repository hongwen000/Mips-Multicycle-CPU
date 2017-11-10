`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:10:28
// Design Name: 
// Module Name: Control
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


module Control(
    input [31:26] Instr,
    output RegDst,
    output Jump,
    output [3:0]Branch,
    output MemRead,
    output MemtoReg,
    output [3:0] ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
    output Clear,
    output PCWrite,
    output ZeroExt
    );
endmodule
