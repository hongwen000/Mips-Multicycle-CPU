`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/09 21:06:15
// Design Name: 
// Module Name: MUX1in4_32
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


module MUX1in4_32(
    input [31:0] Mux_Input_1,
    input [31:0] Mux_Input_2,
    input [31:0] Mux_Input_3,
    input [31:0] Mux_Input_4,
    input [1:0]  Mul_Sel,
    output [31:0] Mul_Output
    );
    assign Mul_Output = (Mul_Sel == 2'b00) ? Mux_Input_1:
                        (Mul_Sel == 2'b01) ? Mux_Input_2:
                        (Mul_Sel == 2'b10) ? Mux_Input_3:
                        Mux_Input_4;
endmodule
