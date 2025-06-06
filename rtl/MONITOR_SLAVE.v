`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:45:52 11/25/2024 
// Design Name: 
// Module Name:    MONITOR_SLAVE 
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
module MONITOR_SLAVE(
    input CLK,
    input RESET,
    input CARD_SEL,
    input [9:0] AI,
    input WR_IN_N,
    input [31:0] C_IN,
    input [31:0] D_IN,
    input step_en,
    input in_init,
    input stop_n,
    input [31:0] DIN,
    output SACK_N,
    output [31:0] SDO,
    output [4:0] REG_ADDR
    );
	 wire [31:0]dout_la;
	 wire [7:0] STATUS;
	 wire [7:0] id;
	 wire [31:0] b_in;
ID_REG id_reg(.ID_OUT(id));	 
LA_TOP la_top(.CLK(CLK),.RESET(RESET),.MONITOR_SIGNAL(DIN),.AI(AI[4:0]),.step_en(step_en),.in_init(in_init),.stop_n(stop_n),.DOUT(dout_la),.STATUS(STATUS));
assign b_in = {16'b0, id , STATUS} ;	 
SLAVE_TOP slave_top(.CLK(CLK),.CARD_SEL(CARD_SEL),.AI(AI),.WR_IN_N(WR_IN_N),.RESET(RESET),.IN1_MUX(dout_la),.IN2_MUX(b_in),.IN3_MUX(C_IN),.IN4_MUX(D_IN),.SACK_N(SACK_N),.SDO(SDO),.REG_ADDR(REG_ADDR));

	 


endmodule
