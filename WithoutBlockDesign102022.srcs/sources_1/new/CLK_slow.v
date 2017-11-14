`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/14 23:01:41
// Design Name: 
// Module Name: CLK_slow
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


module clk_slow(
    input CLK_100mhz,
    output reg CLK_slow
    );

    reg [31:0] count = 0;
    reg [31:0] N = 524288/2-1;
    initial CLK_slow = 0;

    always @(posedge CLK_100mhz) begin
        if(count >= N)
        begin
            count <= 0;
            CLK_slow <= ~CLK_slow;
        end
        else 
        begin
            count <= count + 1;
        end
    end
endmodule

