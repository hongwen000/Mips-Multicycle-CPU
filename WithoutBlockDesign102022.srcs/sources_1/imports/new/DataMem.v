`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:05:33
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    input [31:0] Addr,
    input CLK,
    input [31:0] Write_Data,
    input MemRead_in,
    input MemWrite_in,
    output [31:0] Read_Data
    );
    reg[7:0] ram[127:0];
    assign Read_Data[7:0]    = (MemRead_in==1)?ram[Addr + 3] :8'bz;
    assign Read_Data[15:8]   = (MemRead_in==1)?ram[Addr + 2] :8'bz;
    assign Read_Data[23:16]  = (MemRead_in==1)?ram[Addr + 1] :8'bz;
    assign Read_Data[31:24]  = (MemRead_in==1)?ram[Addr ]    :8'bz; 
    always @(negedge CLK)
    begin
        if(MemWrite_in)
        begin
            ram[Addr]    <= Write_Data[31:24];
            ram[Addr+1]  <= Write_Data[23:16];
            ram[Addr+2]  <= Write_Data[15:8];
            ram[Addr+3]  <= Write_Data[7:0];
        end
    end
endmodule
