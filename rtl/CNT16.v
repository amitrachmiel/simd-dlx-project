`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:32 04/09/2024 
// Design Name: 
// Module Name:    CNT5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CNT16(
    input CLK,
    input RST,
    input CE,
    output[15:0] CNT
    );


reg [15:0] CNT_S = 16'b0;

always @(posedge CLK)
     if (RST == 1)
	      CNT_S <= 16'b0;
	  else if (CE == 1) 
	      CNT_S	<= CNT_S + 16'b1;
	  else 
	      CNT_S	<= CNT_S;


assign CNT=CNT_S;			
endmodule
