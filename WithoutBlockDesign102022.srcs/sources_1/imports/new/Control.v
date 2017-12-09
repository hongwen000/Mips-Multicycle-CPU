`timescale 1ns / 1ps
`define	OP_RTPYE	6'b000000
`define	OP_BEQ	    6'b000100
`define	OP_BNE	    6'b000101
`define	OP_BGTZ	    6'b000111
`define	OP_ADDI	    6'b001000
`define	OP_ORI	    6'b001101
`define OP_SLTI     6'b001010
`define	OP_LW	    6'b100011
`define	OP_SW	    6'b101011
`define	OP_J	    6'b000010
`define	OP_JAL	    6'b000011
`define	OP_HALT	    6'b111111

`define	FUNCT_ADD	6'b100000
`define	FUNCT_SUB	6'b100010
`define	FUNCT_AND	6'b100100
`define	FUNCT_OR	6'b100101
`define	FUNCT_SLL	6'b000000
`define	FUNCT_SLT	6'b101010
`define	FUNCT_JR	6'b001000

`define CONTROL_SINGLES RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt,SaveRa

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
    output reg [1:0] RegDst,
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
    output reg ReadShamt,
    output reg SaveRa
    );
    always @(Instr or Funct)
    begin
        case (Instr)
            `OP_RTPYE:
            begin
                case(Funct)
                    `FUNCT_SLL:  {`CONTROL_SINGLES} = 20'b01_0_0_1_0_0_0000_0010_0_1_1_1_0;
                    `FUNCT_JR:   {`CONTROL_SINGLES} = 20'b01_0_0_0_0_0_0100_0010_0_1_0_0_0;
                    default:    {`CONTROL_SINGLES} = 20'b01_0_0_1_0_0_0000_0010_0_1_0_0_0;
                endcase
            end
            `OP_BEQ:    {`CONTROL_SINGLES} =	20'b00_0_0_0_0_0_0001_0001_0_1_0_0_0;			
            `OP_BNE: 	{`CONTROL_SINGLES} =	20'b00_0_0_0_0_0_0010_0001_0_1_0_0_0;			
            `OP_BGTZ:	{`CONTROL_SINGLES} =	20'b00_0_0_0_0_0_0011_0011_0_1_0_0_0;			
            `OP_ADDI:	{`CONTROL_SINGLES} =	20'b00_1_0_1_0_0_0000_0100_0_1_0_0_0;			
            `OP_ORI: 	{`CONTROL_SINGLES} =	20'b00_1_0_1_0_0_0000_0101_0_1_1_0_0;			
            `OP_SLTI:   {`CONTROL_SINGLES} =    20'b00_1_0_1_0_0_0000_0110_0_1_0_0_0;
            `OP_LW:  	{`CONTROL_SINGLES} =	20'b00_1_1_1_1_0_0000_0000_0_1_0_0_0;			
            `OP_SW:  	{`CONTROL_SINGLES} =	20'b00_1_0_0_0_1_0000_0000_0_1_0_0_0;			
            `OP_J:   	{`CONTROL_SINGLES} =	20'b00_0_0_0_0_0_0000_0000_1_1_0_0_0;			
            `OP_JAL: 	{`CONTROL_SINGLES} =	20'b10_0_0_1_0_0_0000_0000_1_1_0_0_1;			
            `OP_HALT:	{`CONTROL_SINGLES} =	20'b00_0_0_0_0_0_0000_0000_0_0_0_0_0;			
            default:
            begin
                {`CONTROL_SINGLES} = 20'b00_0_0_0_0_0_0000_0000_0_0_0_0_0;
                $display("EXCEPTION@[Control]:no match OPCode Input:%b", Instr);
            end
        endcase
    end
endmodule
