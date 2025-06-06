`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:28 12/27/2024 
// Design Name: 
// Module Name:    CONTROL_DLX 
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
module CONTROL_DLX(
    input CLK,
    input RESET,
    input AEQZ,
    input STEP_EN,
    input [31:0] IR,
    input ACK_N,
	 output IN_INIT,
    output IR_CE,
    output PC_CE,
    output ADD,
    output A_CE,
    output B_CE,
    output C_CE,
    output MR,
    output MW,
    output MDR_CE,
    output MAR_CE,
    output MDR_SEL,
    output TEST,
    output ITYPE,
    output SHIFT_CE,
    output RIGHT,
    output A_SEL,
    output DINT_SEL,
    output JLINK,
    output GPR_WE,
    output [4:0] DLX_STATE,
    output [1:0] S1_SEL,
    output [1:0] S2_SEL,
	 output STOP_N,
	 output [1:0] MAC_STATE,
	 output BUSY,
	 output AS_N,
	 output WR_N,
	 output MUXALU_SEL
    );
	wire stop_mac;
	reg stop_q;
	wire ir_ce_state ;
	MAC_STM mac_stm (.CLK(CLK),
	.RESET(RESET),
	.ACK_N(ACK_N),
	.MR(MR),
	.MW(MW),
	.STOP_N(stop_mac),
	.AS_N(AS_N),
	.WR_N(WR_N),
	.BUSY(BUSY),
	.MAC_STATE(MAC_STATE));// 2 bits


	DLX_CONTROL_STM dlx_control_stm ( .CLK(CLK),
     .RESET(RESET),
     .AEQZ(AEQZ),
     .STEP_EN(STEP_EN),
     .BUSY(BUSY),
     .IR(IR),
     .IN_INIT(IN_INIT),
     .IR_CE(ir_ce_state),
     .PC_CE(PC_CE),
     .ADD(ADD),
     .A_CE(A_CE),
     .B_CE(B_CE),
     .C_CE(C_CE),
     .MR(MR),
     .MW(MW),
     .MDR_CE(MDR_CE),
     .MAR_CE(MAR_CE),
     .MDR_SEL(MDR_SEL),
     .TEST(TEST),
     .ITYPE(ITYPE),
     .SHIFT_CE(SHIFT_CE),
     .RIGHT(RIGHT),
     .A_SEL(A_SEL),
     .DINT_SEL(DINT_SEL),
     .JLINK(JLINK),
     .GPR_WE(GPR_WE),
     .DLX_STATE(DLX_STATE),//5 bit
     .S1_SEL(S1_SEL),//2 bit
     .S2_SEL(S2_SEL),// 2 bit
	  .MUXALU_SEL(MUXALU_SEL)
	);

	assign IR_CE = ir_ce_state &&(~ACK_N) ;
	 
	
	always @(posedge CLK)
	stop_q <= stop_mac ;
	
	assign STOP_N = (stop_q || stop_mac) || (~ACK_N) ;  

endmodule
