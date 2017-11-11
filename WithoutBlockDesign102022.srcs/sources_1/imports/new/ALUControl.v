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
    output [3:0] ALUControl
    );
    wire [3:0] inner_ALUControl;
    always @(Func or ALUOp_in)
    begin
        case (ALUOp_in)
            4'b0010:
            begin
                case (Func)
                    4'b100000: ALUControl = 4'b0010;
                    4'b100010: ALUControl = 4'b0110;
                    4'b100100: ALUControl = 4'b0000;
                    4'b100101: ALUControl = 4'b0001;
                    4'b101010: ALUControl = 4'b1000;
                    default:
                    begin
                        ALUControl = 4'b0000;
                        $display("EXCEPTION@[ALUControl]:no match Func Input");
                    end
                endcase
            end
            4'b0000: ALUControl = 4'b0010;
            4'b0001: ALUControl = 4'b0110;
            4'b0011: ALUControl = 4'b1000;
            4'b0100: ALUControl = 4'b0010;
            4'b0101: ALUControl = 4'b0001;
            default:
            begin
                ALUControl = 4'b0000;
                $display("EXCEPTION@[ALUControl]:no match ALUOp Input");
            end
        endcase
    end
endmodule
