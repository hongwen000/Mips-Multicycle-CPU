`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:05:33
// Design Name: 
// Module Name: InstrMem
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


module InstrMem(
    input [31:0] ReadAddr,
    //output [31:0] Instrction,
    output reg [31:0] Instr
    );
    reg[7:0] rom[127:0];
    initial 
    begin
        $readmemb("rom.txt", rom);
    end
    always @(ReadAddr)
    begin
        Instr[31:24] = rom[ReadAddr];
        Instr[23:16] = rom[ReadAddr + 1];
        Instr[15:8]  = rom[ReadAddr + 2];
        Instr[7:0]   = rom[ReadAddr + 3];
    end
endmodule
