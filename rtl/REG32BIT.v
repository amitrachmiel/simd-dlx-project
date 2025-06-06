`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:59 12/08/2024 
// Design Name: 
// Module Name:    REG32BIT 
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
module REG32BIT(
    input CLK,
    input CE,
    input RESET,
    input [31:0] DI,
    output reg [31:0] DOUT
    );
	 
	always @ (posedge CLK) begin
	if(RESET)
		DOUT <= 32'b0;
	else if (CE)
	   DOUT <= DI;
	else
		DOUT <= DOUT;
	
	end



endmodule
