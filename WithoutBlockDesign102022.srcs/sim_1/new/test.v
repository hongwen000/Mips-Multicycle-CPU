`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 19:49:30
// Design Name: 
// Module Name: test
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

module test(

    );
    reg Clear_test;
    reg CLK_test;
    initial
    begin
        CLK_test = 0;
        Clear_test = 1;
        #50 Clear_test = 0;
        #50
        forever #10 CLK_test = ~CLK_test;
        #2000 $stop;
    end
    //always
    //begin
    //    #10 CLK_test = ~CLK_test;
    //end

    wire [15:0]UI_PC_NextPC;
    wire [15:0]UI_RsAddr_RsValue;
    wire [15:0]UI_RtAddr_RtValue;
    wire [15:0]UI_ALU_DB;
    top top_0
      (.Clear_top(Clear_test),
       .CLK_top(CLK_test),
       .UI_PC_NextPC(UI_PC_NextPC),
       .UI_RsAddr_RsValue(UI_RsAddr_RsValue),
       .UI_RtAddr_RtValue(UI_RtAddr_RtValue),
       .UI_ALU_DB(UI_ALU_DB));
endmodule
