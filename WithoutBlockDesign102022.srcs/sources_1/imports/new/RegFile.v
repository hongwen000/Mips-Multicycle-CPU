`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 23:46:52
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    input CLK,
    input [4:0] Read_Reg_1,
    input [4:0] Read_Reg_2,
    input [4:0] Write_Reg,
    input [31:0] Write_Data,
    input RegWrite_in,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2
    );
endmodule
