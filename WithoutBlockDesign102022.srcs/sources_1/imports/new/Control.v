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
    input [10:6] Funct,
    output RegDst,
    output Jump,
    output [3:0]Branch,
    output MemRead,
    output MemtoReg,
    output [3:0] ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
    output PCWrite,
    output ZeroExt
    );
    always @(Instr or Funct)
    begin
        case (Instr)
            6'b000000:
            begin
                case(Funct)
                    6'b000000: {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b1_0_0_1_0_0_0000_0010_0_0_1_0;
                    default: {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b1_0_0_1_0_0_0000_0010_0_0_1_0;
                endcase
            end
            4'b000100:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_0_0_0_0_0_0001_0001_0_0_1_0;
            4'b000101:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_0_0_0_0_0_0010_0001_0_0_1_0;
            4'b000111:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_0_0_0_0_0_0011_0011_0_0_1_0;
            4'b001000:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_1_0_1_0_0_0000_0100_0_0_1_0;
            4'b001101:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_1_0_1_0_0_0000_0101_0_0_1_1;
            4'b100011:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_1_1_1_1_0_0000_0000_0_0_1_0;
            4'b101011:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_1_0_0_0_1_0000_0000_0_0_1_0;
            4'b000010:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_0_0_0_0_0_0000_0000_1_0_1_0;
            4'b111111:{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_0_0_0_0_0_0000_0000_0_0_0_0;
            default:
            begin
                {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,Clear,PCWrite,ZeroExt} = 18'b0_0_0_0_0_0_0000_0000_0_0_0_0;
                $display("EXCEPTION@[Control]:no match OPCode Input");
            end
        endcase
    end
endmodule
