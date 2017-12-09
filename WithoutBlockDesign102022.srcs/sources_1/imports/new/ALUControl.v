`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 00:05:33
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    input [5:0] Func,
    input [3:0] ALUOp_in,
    output reg [3:0] ALUControl
    );
    wire [3:0] inner_ALUControl;
    always @(Func or ALUOp_in)
    begin
        case (ALUOp_in)
            4'b0010:
            begin
                case (Func)
                    6'b000000: ALUControl = 4'b1001;
                    6'b100000: ALUControl = 4'b0010;
                    6'b100010: ALUControl = 4'b0110;
                    6'b100100: ALUControl = 4'b0000;
                    6'b100101: ALUControl = 4'b0001;
                    6'b101010: ALUControl = 4'b1000;
                    6'b001000: ALUControl = 4'b1010;
                    default:
                    begin
                        ALUControl = 4'b0000;
                        $display("EXCEPTION@[ALUControl]:no match Func Input: %b", Func);
                    end
                endcase
            end
            4'b0000: ALUControl = 4'b0010;
            4'b0001: ALUControl = 4'b0110;
            4'b0011: ALUControl = 4'b1000;
            4'b0100: ALUControl = 4'b0010;
            4'b0101: ALUControl = 4'b0001;
            4'b0110: ALUControl = 4'b1000;
            default:
            begin
                ALUControl = 4'b0000;
                $display("EXCEPTION@[ALUControl]:no match ALUOp Input :%d", ALUOp_in);
            end
        endcase
    end
endmodule
