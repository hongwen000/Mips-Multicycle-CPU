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
    input [31:0] Next_IP,
    input CLK,
    input Clear,
    input PCWrite,
    output [31:0] This_IP
    );
    always @(posedge CLK or posedge Clear or PCWrite)
    begin
        if(Clear)
        begin
            This_IP <= 0;
        end
        else
        if(PCWrite == 1)
        begin
            This_IP <= Next_IP;
        end
    end
endmodule
