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
    output [31:0] Read_Data_2,
    output [3:0] reg1,
    output [3:0] reg2
    );
    reg[31:0] impl_reg[1:31];
    integer i;
    assign Read_Data_1 = (Read_Reg_1 == 0) ? 0 : impl_reg[Read_Reg_1];
    assign Read_Data_2 = (Read_Reg_2 == 0) ? 0 : impl_reg[Read_Reg_2];
    assign reg1 = impl_reg[1][3:0];
    assign reg2 = Write_Reg[3:0];
    always @(negedge CLK or negedge Clear or posedge Clear)
    begin
        if(Clear) 
        begin
            for(i = 1; i < 32; i = i + 1) impl_reg[i] <= 0;
            if(RegWrite_in == 1 && Write_Reg != 0)
                impl_reg[Write_Reg] <= Write_Data;
        end
        else if(RegWrite_in == 1 && Write_Reg != 0)
            impl_reg[Write_Reg] <= Write_Data;
    end
endmodule
