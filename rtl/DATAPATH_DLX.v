`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:37 12/28/2024 
// Design Name: 
// Module Name:    DATAPATH_DLX 
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
module DATAPATH_DLX(
	input CLK,
	input RESET,
	input IR_CE,
	input A_CE,
	input B_CE,
	input C_CE,
	input [1:0] S1_SEL,
	input [1:0] S2_SEL ,
	input ITYPE ,
	input ADD,
	input  TEST,
	input RIGHT,
	input SHIFT,
	input [31:0] DI,
	input MDR_CE,
	input MAR_CE,
	input A_SEL,
	input JLINK,
	input GPR_WE,
	input PC_CE,
	input [4:0]D_ADDR,
	input DINT_SEL,
	input MDR_SEL,
	input MUXALU_SEL,
	output [31:0] AO,
	output [31:0]DO,
	output OVF ,
	output [31:0] GPR_D,
	output [31:0] IR,
	output AEQZ_OUT  
    );
	
	wire [31:0] dint_mux_out  ;
	wire [31:0] a_out ;
	wire [31:0] b_out ;
	wire [31:0] c_out ;
	wire [31:0] pc_out;
	wire [31:0] mdr_mux_out  ;
	wire [31:0] gpr_a  ;
	wire [31:0] gpr_b  ;
	wire [5:0] opcode ;
	wire [4:0] rs1 ;
	wire [4:0] rs2 ;
	wire [4:0] c_addr ;
	wire [2:0] aluf ;
	wire [31:0] sext_imm ;
	wire [31:0] s1_mux_out;
	wire [31:0] s2_mux_out;
	wire [31:0] shift_out ;
	wire [31:0] alu_out ;
	wire [31:0] mar_out;
	wire [31:0] a_mux_out ;
	wire [31:0] alu_mux_out;
	wire [5:0] alufp ;
	wire [31:0] alup_out; 
	REG32BIT reg_c (
	 .CLK(CLK),
    .CE(C_CE),
    .RESET(RESET),
    .DI(dint_mux_out),
	 .DOUT(c_out)
	);
	
	MUX32bit mux_mdr(
	.A(dint_mux_out),
	.B(DI),
	.sel(MDR_SEL),
	.O(mdr_mux_out )
	);
	
	
	
	IR_ENV_DLX ir_env_dlx (
	 .CLK(CLK),
    .IR_CE(IR_CE),
    .D_IN(DI),
    .OPCODE(opcode),
    .RS1(rs1),
    .RS2(rs2),
    .IR_OUT(IR),
    .SEXT_IMM(sext_imm),
    .ALUF(aluf),
    .C_ADDR(c_addr),
	 .ALUFP(alufp)
	);
	
	GPR_ENV gpr (
	 .CLK(CLK),
    .GPR_WE(GPR_WE),
    .C(c_out),
    .A_ADDRESS(rs1),
    .B_ADDRESS(rs2),
    .C_ADDRESS(c_addr),
    .D_ADDRESS(D_ADDR),
    .A(gpr_a),
    .B(gpr_b),
    .D(GPR_D),
    .AEQZ(AEQZ_OUT)
	);
	
	  REG32BIT reg_a (
	 .CLK(CLK),
    .CE(A_CE),
    .RESET(RESET),
    .DI(gpr_a),
	 .DOUT(a_out)
	);
	
	  REG32BIT reg_b (
	 .CLK(CLK),
    .CE(B_CE),
    .RESET(RESET),
    .DI(gpr_b),
	 .DOUT(b_out)
	);
	
	  REG32BIT reg_mdr (
	 .CLK(CLK),
    .CE(MDR_CE),
    .RESET(RESET),
    .DI(mdr_mux_out),
	 .DOUT(DO)
	);
	
	  REG32BIT reg_pc (
	 .CLK(CLK),
    .CE(PC_CE),
    .RESET(RESET),
    .DI(dint_mux_out),
	 .DOUT(pc_out)
	);
	
	MUX4_32bit s1_mux (
	.A(pc_out),
	.B(a_out),
	.C(b_out),
	.D(DO),
	.sel(S1_SEL),
	.O(s1_mux_out)
	);
	
	MUX4_32bit s2_mux (
	.A(b_out),
	.B(sext_imm),
	.C(32'b0),
	.D(32'b1),
	.sel(S2_SEL),
	.O(s2_mux_out)
	);

	SHIFT_DLX shift_dlx (
	 .SHIFT_IN(s1_mux_out),
    .RIGHT(RIGHT),
    .SHIFT(SHIFT),
    .SHIFT_OUT(shift_out)
	);
	
	ALU_ENV_DLX alu_env_dlx(
	.A(s1_mux_out),
	.B(s2_mux_out),
	.ALUF(aluf),
	.ADD(ADD),
	.TEST(TEST),
	.OVF(OVF),
	.ALU_OUT(alu_out)
	);
	
	PARALLEL_ALU parallel_alu(
	.rs1(s1_mux_out),
	.rs2(s2_mux_out),
	.imm(sext_imm),
	.opcode(alufp),
	.rd(alup_out)
	);
	
	MUX32bit mux_alu(
	.A(alu_out),
	.B(alup_out),
	.sel(MUXALU_SEL),
	.O(alu_mux_out)
	);
	
	MUX32bit mux_dint(
	.A(alu_mux_out),
	.B(shift_out),
	.sel(DINT_SEL),
	.O(dint_mux_out)
	);
	
	  REG32BIT reg_mar (
	 .CLK(CLK),
    .CE(MAR_CE),
    .RESET(RESET),
    .DI(dint_mux_out),
	 .DOUT(mar_out)
	);
	
	MUX32bit mux_a(
	.A(pc_out),
	.B(mar_out),
	.sel(A_SEL),
	.O(a_mux_out)
	);

	assign AO = {8'b0, a_mux_out[23:0]}; //  The MMU function is to disable the software
													//access to the area of upper address.

endmodule
