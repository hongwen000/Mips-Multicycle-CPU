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
    input [5:0] Funct,
    output reg RegDst,
    output reg Jump,
    output reg [3:0]Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [3:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg PCWrite,
    output reg ZeroExt,
    output reg ReadShamt
    );
    always @(Instr or Funct)
    begin
        case (Instr)
            6'b000000:
            begin
                case(Funct)
                    6'b000000: {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b1_0_0_1_0_0_0000_0010_0_1_1_1;
                    default: {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b1_0_0_1_0_0_0000_0010_0_1_0_0;
                endcase
            end
            6'b000100:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_0_0_0_0_0_0001_0001_0_1_0_0;
            6'b000101:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_0_0_0_0_0_0010_0001_0_1_0_0;
            6'b000111:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_0_0_0_0_0_0011_0011_0_1_0_0;
            6'b001000:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_1_0_1_0_0_0000_0100_0_1_0_0;
            6'b001101:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_1_0_1_0_0_0000_0101_0_1_1_0;
            6'b100011:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_1_1_1_1_0_0000_0000_0_1_0_0;
            6'b101011:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_1_0_0_0_1_0000_0000_0_1_0_0;
            6'b000010:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_0_0_0_0_0_0000_0000_1_1_0_0;
            6'b111111:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_0_0_0_0_0_0000_0000_0_0_0_0;
            default:
            begin
                {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b0_0_0_0_0_0_0000_0000_0_0_0_0;
                $display("EXCEPTION@[Control]:no match OPCode Input:%b", Instr);
            end
        endcase
    end
endmodule
