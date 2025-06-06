`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:00 11/16/2024 
// Design Name: 
// Module Name:    SLAVECONTROL 
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
module SLAVECONTROL(
    input CLK,
    input CARD_SEL,
    input [9:0] AI,
    input WR_IN_N,
	 input RESET,
    output [4:0] REG_ADDR,
    output SACK_N
    );
	wire IN;
	wire D1;
	wire Q1;
	wire Q2;
	assign IN = AI[9]& AI[8] & AI[7] ;
	assign D1 = IN & CARD_SEL & WR_IN_N;
	
	DFF dff1 (.CLK(CLK),.D(D1),.RESET(RESET),.Q(Q1));
	DFF dff2 (.CLK(CLK),.D(Q1),.RESET(RESET),.Q(Q2));
	assign SACK_N = ~(Q1 & (~Q2));
	assign REG_ADDR = AI[4:0];
	

endmodule
