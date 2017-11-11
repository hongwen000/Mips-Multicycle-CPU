`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:42:34
// Design Name: 
// Module Name: Mux32
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


module Mux32(
    input [31:0] Mux_Input_1,
    input [31:0] Mux_Input_2,
    input Mul_Sel,
    output [31:0] Mul_Output
    );
    assign Mul_Output = Mul_Sel ? Mux_Input_1 : Mux_Input_2;
endmodule
