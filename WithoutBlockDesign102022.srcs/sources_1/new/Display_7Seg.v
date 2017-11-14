`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/14 23:09:21
// Design Name: 
// Module Name: Display_7Seg
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


module Display_7Seg(
    input [15:0] Data,
    input Clear,
    input CLK_slow,
    output reg [3:0] Select,
    output reg [7:0] Segment
    );

    reg [1:0] cnt;

    always@(posedge CLK_slow)
    begin
        if(Clear)
            cnt <= 2'b00;
        else
            cnt <= cnt + 1;
    end

	reg [3:0] Segdata;
	always @ (posedge CLK_slow)   
	begin
		begin
			case (cnt)
				2'b00: begin Select = 4'b0111; Segdata <= Data[3:0];end  
				2'b01: begin Select = 4'b1011; Segdata <= Data[7:4];end
				2'b10: begin Select = 4'b1101; Segdata <= Data[11:8];end
				2'b11: begin Select = 4'b1110; Segdata <= Data[15:12];end
				default:  Segdata <= 0;
			endcase
		end
	end
	always @ (*) 
	begin
		if(Clear)
		begin
			Segment <= 8'b11111111;
		end
		else
		begin
		  case(Segdata)
	         4'h0: Segment = 8'b10000001;
	         4'h1: Segment = 8'b11001111;
	         4'h2: Segment = 8'b10010010;
	         4'h3: Segment = 8'b10000110;
	         4'h4: Segment = 8'b11001100;
    	     4'h5: Segment = 8'b10100100;
        	 4'h6: Segment = 8'b10100000;
        	 4'h7: Segment = 8'b10001111;
        	 4'h8: Segment = 8'b10000000;
        	 4'h9: Segment = 8'b10000100;
        	 4'hA: Segment = 8'b10001000;
        	 4'hB: Segment = 8'b11100000;
        	 4'hC: Segment = 8'b10110001;
        	 4'hD: Segment = 8'b11000010;
        	 4'hE: Segment = 8'b10110000;
        	 4'hF: Segment = 8'b10111000;
			default: Segment <= 8'b11111111;
		endcase
	  end
	end
endmodule

