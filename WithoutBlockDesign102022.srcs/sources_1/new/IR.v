`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/10 07:10:44
// Design Name: 
// Module Name: IR
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


module IR(
    input IRWrite_in,
    input Clear,
    input [31:0] IN,
    output reg[31:0] OUT,
    input CLK
    );
    always @(negedge CLK or negedge Clear) 
    begin
        if(Clear)
            OUT = IN;
        else
        begin
            if(IRWrite_in)
                OUT = IN;
        end
    end
endmodule
