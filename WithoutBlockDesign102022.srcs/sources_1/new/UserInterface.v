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


module UserInterface(
    input Btn_Press,
    input Func_Choose1,
    input Func_Choose0,
    input CLK,
    input ClearCPU,
    input ClearUI,
    output [3:0] Select,
    output [7:0] Segment
    );

    wire Btn_State;
    wire Clr_State;
    wire CLK_slow;
    reg [15:0] Data;
    wire [1:0] Func_Choose;
    assign Func_Choose = {Func_Choose1, Func_Choose0};
    wire [15:0]UI_PC_NextPC;
    wire [15:0]UI_RsAddr_RsValue;
    wire [15:0]UI_RtAddr_RtValue;
    wire [15:0]UI_ALU_DB;

    top top_0 (
        .Clear_top(Clr_State),
        .CLK_top(Btn_State),
        .UI_PC_NextPC(UI_PC_NextPC),
        .UI_RsAddr_RsValue(UI_RsAddr_RsValue),
        .UI_RtAddr_RtValue(UI_RtAddr_RtValue),
        .UI_ALU_DB(UI_ALU_DB)
    );

    always @(posedge CLK)
    begin
        case(Func_Choose)
            2'b00: Data <= UI_PC_NextPC;
            2'b01: Data <= UI_RsAddr_RsValue;
            2'b10: Data <= UI_RtAddr_RtValue;
            2'b11: Data <= UI_ALU_DB;
        endcase
    end

    clk_slow clk_slow_0(
        .CLK_100mhz(CLK),
        .CLK_slow(CLK_slow)
    );

    Input_OBtn Input_OBtn_0(
        .CLK_slow(CLK_slow),
        .Clear(ClearUI),
        .Btn_Input(Btn_Press),
        .Btn_State(Btn_State)
    );

    Input_OBtn Input_OBtn_1(
        .CLK_slow(CLK_slow),
        .Clear(ClearUI),
        .Btn_Input(ClearCPU),
        .Btn_State(Clr_State)
    );

    Display_7Seg Display_7Seg_0(
        .Data(Data),
        .Clear(ClearUI),
        .CLK_slow(CLK_slow),
        .Select(Select),
        .Segment(Segment)
    );
endmodule