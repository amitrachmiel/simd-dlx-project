`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:57:46 01/05/2025
// Design Name:   DLX_IO_SIM_VERILOG
// Module Name:   E:/adlx/A7/amit_tom/lab7/HOME_VER/TB_IO_SIM_DLX_TOP.v
// Project Name:  HOME_VER
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DLX_IO_SIM_VERILOG
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_IO_SIM_DLX_TOP;

	// Inputs
	reg CLK_IN;
	reg RST;
	reg STEP_EN;

	// Outputs
	wire AS_N;
	wire WR_N;
	wire [31:0] GPR_D;
	wire [31:0] AO;
	wire MR;
	wire MW;
	wire A_CE;
	wire B_CE;
	wire C_CE;
	wire IR_CE;
	wire PC_CE;
	wire OVF;
	wire GPR_WE;
	wire [1:0] S1_SEL;
	wire [1:0] S2_SEL;
	wire A_SEL;
	wire MDR_SEL;
	wire DINT_SEL;
	wire TEST;
	wire ITYPE;
	wire ADD;
	wire SHIFT;
	wire JLINK;
	wire STOP_N;
	wire BUSY;
	wire IN_INIT;
	wire [31:0] DO;
	wire [2:0] ALUF;
	wire MAR_CE;
	wire MDR_CE;
	wire AEQZ;
	wire [31:0] IR;
	wire [1:0] MAC_STATE;
	wire [4:0] DLX_STATE;
	wire MUXALU_SEL;

	// Instantiate the Unit Under Test (UUT)
	DLX_IO_SIM_VERILOG uut (
		.CLK_IN(CLK_IN), 
		.RST(RST), 
		.STEP_EN(STEP_EN), 
		.AS_N(AS_N), 
		.WR_N(WR_N), 
		.GPR_D(GPR_D), 
		.AO(AO), 
		.MR(MR), 
		.MW(MW), 
		.A_CE(A_CE), 
		.B_CE(B_CE), 
		.C_CE(C_CE), 
		.IR_CE(IR_CE), 
		.PC_CE(PC_CE), 
		.OVF(OVF), 
		.GPR_WE(GPR_WE), 
		.S1_SEL(S1_SEL), 
		.S2_SEL(S2_SEL), 
		.A_SEL(A_SEL), 
		.MDR_SEL(MDR_SEL), 
		.DINT_SEL(DINT_SEL), 
		.TEST(TEST), 
		.ITYPE(ITYPE), 
		.ADD(ADD), 
		.SHIFT(SHIFT), 
		.JLINK(JLINK), 
		.STOP_N(STOP_N), 
		.BUSY(BUSY), 
		.IN_INIT(IN_INIT), 
		.DO(DO), 
		.ALUF(ALUF), 
		.MAR_CE(MAR_CE), 
		.MDR_CE(MDR_CE), 
		.AEQZ(AEQZ), 
		.IR(IR), 
		.MAC_STATE(MAC_STATE), 
		.DLX_STATE(DLX_STATE),
		.MUXALU_SEL(MUXALU_SEL)
	);

		initial 
	 CLK_IN = 1 ;
	 always #100 CLK_IN = ~ CLK_IN ; 

	initial begin
		// Initialize Inputs
		RST = 1;
		STEP_EN = 0;

		// Wait 202 ns for global reset to finish
		#202;
		// Add stimulus here
		RST = 0 ;
		// LOAD
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		
		//store
			STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		//HALT 
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
			STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;
		STEP_EN = 1;
		#200;
		STEP_EN = 0;
		#2800;

	end
      
endmodule

