`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 00:57:06
// Design Name: 
// Module Name: simTestIO
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


module simTestIO(

    );
    reg CLK;
    reg Clear;
    wire CLK_slow;
    initial
    begin
        Clear <= 0;
        CLK <= 0;
    end
    always #10
    begin
        CLK = ~CLK;
    end
    clk_slow CLK_slow_test(
        .CLK_100mhz(CLK),
        .Clear(Clear),
        .CLK_slow(CLK_slow)
    );
endmodule
