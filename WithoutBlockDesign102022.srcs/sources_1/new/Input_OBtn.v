`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/14 23:22:01
// Design Name: 
// Module Name: Input_OBtn
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


module Input_OBtn(
    input CLK_slow,
    input Clear,
    input Btn_Input,
    output Btn_State
    );
    reg [2:0] state;
    assign Btn_State = state[2];
    always @(posedge CLK_slow)
    begin
        if (Clear)
            state <= 3'b000;
        else
        begin
            if(!Btn_Input) 
 	            state <= 3'b000;
            else 
            begin
                if(state >= 3'b100)
                    state <= 3'b100;
                else
                    state <= state + 1;
            end
        end
    end
endmodule
