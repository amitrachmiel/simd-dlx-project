`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:50 11/16/2024 
// Design Name: 
// Module Name:    SLAVE_TOP 
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
module SLAVE_TOP(
    input CLK,
    input CARD_SEL,
    input [9:0] AI,
    input WR_IN_N,
	 input RESET,
	 input [31:0] IN1_MUX,
	 input [31:0] IN2_MUX,
	 input [31:0] IN3_MUX,
	 input [31:0] IN4_MUX,
    output SACK_N,
    output [31:0] SDO,
	 output [4:0] REG_ADDR
	 
    );

	 mux_slave mux_slave1 (.A(IN1_MUX[31:0]),.B(IN2_MUX[31:0]),.C(IN3_MUX[31:0]),.D(IN4_MUX[31:0]),.SEL_MUX(AI[6:5]),.OUT_MUX(SDO));
	 SLAVECONTROL control_slave1 (.CLK(CLK),.CARD_SEL(CARD_SEL),.AI(AI[9:0]),.WR_IN_N(WR_IN_N),.RESET(RESET),.REG_ADDR(REG_ADDR[4:0]),.SACK_N(SACK_N));


endmodule
