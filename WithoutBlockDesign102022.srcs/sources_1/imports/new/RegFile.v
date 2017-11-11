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
    input Clear,
    input [4:0] Read_Reg_1,
    input [4:0] Read_Reg_2,
    input [4:0] Write_Reg,
    input [31:0] Write_Data,
    input RegWrite_in,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2
    );
    reg[31:0] impl_reg[1:31];
    assign Read_Data_1 = (Read_Reg_1 == 0) ? 0 : impl_reg[Read_Reg_1];
    assign Read_Data_2 = (Read_Reg_2 == 0) ? 0 : impl_reg[Read_Reg_2];
    always @(negedge CLK or posedge Clear)
    begin
        if(Clear) 
        begin
            integer i;
            for(i = 1; i < 32; i = i + 1) impl_reg[i] <= 0;
        end
        else if(RegWrite_in == 1 && Write_Reg != 0)
            impl_reg[Write_Reg] <= Write_Data;
    end
endmodule
