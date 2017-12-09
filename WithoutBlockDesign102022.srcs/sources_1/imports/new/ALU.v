`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 23:46:52
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] ALU_Input_1,
    input [31:0] ALU_Input_2,
    input [3:0] ALU_Control_in,
    output reg [31:0] ALU_Output_Result,
    output ALU_Output_Zero,
    output ALU_Output_Sign
    );
    assign ALU_Output_Zero = ALU_Input_1 == ALU_Input_2 ? 1 : 0;
    assign ALU_Output_Sign = ALU_Input_1[31];
    always @(ALU_Control_in or ALU_Input_1 or ALU_Input_2)
    begin
        case(ALU_Control_in)
            4'b0000: ALU_Output_Result = ALU_Input_1 & ALU_Input_2;
            4'b0001: ALU_Output_Result = ALU_Input_1 | ALU_Input_2;
            4'b0010: ALU_Output_Result = ALU_Input_1 + ALU_Input_2;
            4'b0110: ALU_Output_Result = ALU_Input_1 - ALU_Input_2;
            4'b0111: ALU_Output_Result = ALU_Input_1 < ALU_Input_2 ? 1 : 0;
            4'b1000: 
            begin
                if(ALU_Input_1[31] == 1 && ALU_Input_2[31] == 0)
                    ALU_Output_Result = 1;
                else if ((ALU_Input_1 < ALU_Input_2) &&(ALU_Input_1[31] == ALU_Input_2[31]))
                    ALU_Output_Result = 1;
                else
                    ALU_Output_Result = 0;
            end
            4'b1001: ALU_Output_Result = ALU_Input_2 << ALU_Input_1;
            4'b1010: ALU_Output_Result = ALU_Input_1;
            4'b1100: ALU_Output_Result = ALU_Input_1 ^ ALU_Input_2;
            default:
            begin
                ALU_Output_Result = 32'h00000000;
                $display("EXCEPTION@[ALU]:no match ALU Control Input:%d", ALU_Control_in);
            end
        endcase
    end
endmodule
