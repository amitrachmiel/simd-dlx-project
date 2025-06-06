`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:56 11/24/2024 
// Design Name: 
// Module Name:    status_reg 
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
module statusreg(
    input [4:0] DIN,
    input  CLK,
    input  CE,
	 input RESET,
    output reg [7:0] OUT
    );
	always @ (posedge CLK) begin
	if(RESET)
		OUT <= 8'b0;
	else if (CE)
	   OUT <= {3'b000,DIN};
	else
		OUT <= OUT;
	
	end


endmodule
