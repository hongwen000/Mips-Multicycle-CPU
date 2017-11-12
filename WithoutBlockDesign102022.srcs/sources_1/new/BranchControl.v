`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2017 01:30:03 AM
// Design Name: 
// Module Name: BranchControl
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


module BranchControl(
    input [3:0] BranchControl_Input_Type,
    output reg BranchControl_Output_Exec_Branch,
    input Sign_in,
    input Zero_in
    );
    always@(BranchControl_Input_Type or Sign_in or Zero_in)
    begin
        case (BranchControl_Input_Type)
            4'b0000: BranchControl_Output_Exec_Branch = 1'b0;
            4'b0001: BranchControl_Output_Exec_Branch = Zero_in;
            4'b0010: BranchControl_Output_Exec_Branch = ~Zero_in;
            4'b0011: BranchControl_Output_Exec_Branch = (~Sign_in && ~Zero_in);
            default:
            begin
                BranchControl_Output_Exec_Branch = 1'b0;
                $display("EXCEPTION@[BranchControl]:no match Branch Type Input:%b", BranchControl_Input_Type);
            end
        endcase
    end
endmodule
