`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:35:55 01/03/2025 
// Design Name: 
// Module Name:    DLX_TOP 
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
module DLX_TOP(
	input CLK,
	input RESET,
	input STEP_EN,
	input ACK_N,
	input [4:0] D_ADDR,
	input [31:0] D_IN,
	output AS_N ,
	output WR_N , 
	output [31:0]GPR_D, 
	output [31:0] AO , 
	output  MR, 
	output  MW, 
	output A_CE, 
	output B_CE, 
	output C_CE, 
	output IR_CE, 
	output PC_CE, 
	output OVF, 
	output GPR_WE, 
	output [1:0] S1_SEL, 
	output [1:0] S2_SEL, 
	output A_SEL, 
	output MDR_SEL, 
	output DINT_SEL, 
	output TEST, 
	output ITYPE, 
	output ADD, 
	output SHIFT, 
	output JLINK, 
	output STOP_N, 
	output BUSY, 
	output IN_INIT, 
	output [31:0] DO, 
	output [2:0] ALUF, 
	output MAR_CE, 
	output MDR_CE, 
	output AEQZ, 
	output [31:0] IR, 
	output [1:0] MAC_STATE, 
	output [4:0] DLX_STATE ,
	output MUXALU_SEL
    );
	
	wire right; 
	
	
	CONTROL_DLX control_dlx (
	 .CLK(CLK),
    .RESET(RESET),
    .AEQZ(AEQZ),
    .STEP_EN(STEP_EN),
	 .IR(IR),
    .ACK_N(ACK_N),
	 .IN_INIT(IN_INIT),
    .IR_CE(IR_CE),
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
    .SHIFT_CE(SHIFT),
    .RIGHT(right),
    .A_SEL(A_SEL),
    .DINT_SEL(DINT_SEL),
    .JLINK(JLINK),
    .GPR_WE(GPR_WE),
    .DLX_STATE(DLX_STATE),
    .S1_SEL(S1_SEL),
    .S2_SEL(S2_SEL),
	 .STOP_N(STOP_N),
	 .MAC_STATE(MAC_STATE),
	 .BUSY(BUSY),
	 .AS_N(AS_N),
	 .WR_N(WR_N),
	 .MUXALU_SEL(MUXALU_SEL)
	);
	
	DATAPATH_DLX datapath_dlx (
	.CLK(CLK),
	.RESET(RESET),
	.IR_CE(IR_CE),
	.A_CE(A_CE),
	.B_CE(B_CE),
	.C_CE(C_CE),
	.S1_SEL(S1_SEL),
	.S2_SEL (S2_SEL),
	.ITYPE(ITYPE) ,
	.ADD(ADD),
	.TEST(TEST),
	.RIGHT(right),
	.SHIFT(SHIFT),
	.DI(D_IN),
	.MDR_CE(MDR_CE),
	.MAR_CE(MAR_CE),
	.A_SEL(A_SEL),
	.JLINK(JLINK),
	.GPR_WE(GPR_WE),
	.PC_CE(PC_CE),
	.D_ADDR(D_ADDR),
	.DINT_SEL(DINT_SEL),
	.MDR_SEL(MDR_SEL),
	.AO(AO),
	.DO(DO),
	.OVF(OVF),
	.GPR_D(GPR_D),
	.IR(IR),
	.AEQZ_OUT(AEQZ),
	.MUXALU_SEL(MUXALU_SEL)
	);

	

endmodule
