`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/14 23:53:20
// Design Name: 
// Module Name: TestIO
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


module TestIO(
    input Btn_Press,
    input Func_Choose,
    input CLK,
    input Clear,
    output [3:0] Select,
    output [7:0] Segment
    );

    wire Btn_State;
    wire CLK_slow;
    reg [15:0] Data;
    wire [15:0] putData;
    reg ifPutData;
    assign putData = ifPutData ? Data : 16'h0000;

    always @(posedge CLK)
    begin
    if(Clear)
        ifPutData <= 0;
    else
        ifPutData <= 1;
    end

    always @(posedge Btn_State)
    begin
        if (Func_Choose)
            Data <= Data + 1;
        else
            Data[7:4] <= Data[3:0];
    end

    clk_slow clk_slow_0(
        .CLK_100mhz(CLK),
        .CLK_slow(CLK_slow)
    );

    Input_OBtn Input_OBtn_0(
        .CLK_slow(CLK_slow),
        .Clear(Clear),
        .Btn_Input(Btn_Press),
        .Btn_State(Btn_State)
    );

    Display_7Seg Display_7Seg_0(
        .Data(Data),
        .Clear(Clear),
        .CLK_slow(CLK_slow),
        .Select(Select),
        .Segment(Segment)
    );
endmodule
