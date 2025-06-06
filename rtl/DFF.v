`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:02 11/16/2024 
// Design Name: 
// Module Name:    DFF 
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
module DFF(
    input D,
	 input CLK,
	 input RESET,
    output reg Q
    );

	always @(posedge CLK)begin
	if(RESET)
	Q<= 1'b0 ;
	else 
	Q<=D;
	end
	

endmodule
