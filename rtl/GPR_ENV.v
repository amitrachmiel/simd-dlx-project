`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:20 12/14/2024 
// Design Name: 
// Module Name:    GPR_ENV 
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
module GPR_ENV(
    input CLK,
    input GPR_WE,
    input [31:0] C,
    input [4:0] A_ADDRESS,
    input [4:0] B_ADDRESS,
    input [4:0] C_ADDRESS,
    input [4:0] D_ADDRESS,
    output [31:0] A,
    output [31:0] B,
    output [31:0] D,
    output AEQZ
    );

	wire GPR_WE_RAM; 
	assign GPR_WE_RAM = (C_ADDRESS[0] || C_ADDRESS[1] || C_ADDRESS[2] || C_ADDRESS[3]
	|| C_ADDRESS[4]) && GPR_WE;
	
	assign AEQZ = ~|A; 
	
	wire [4:0] ADDRESS_RAM_A;
	wire [4:0] ADDRESS_RAM_B;
	wire [4:0] ADDRESS_RAM_D;
	
	MUX_5_BIT mux_a (.INPUT1(C_ADDRESS),.INPUT0(A_ADDRESS),.sel(GPR_WE),.O(ADDRESS_RAM_A));
	MUX_5_BIT mux_b (.INPUT1(C_ADDRESS),.INPUT0(B_ADDRESS),.sel(GPR_WE),.O(ADDRESS_RAM_B));
	MUX_5_BIT mux_d (.INPUT1(C_ADDRESS),.INPUT0(D_ADDRESS),.sel(GPR_WE),.O(ADDRESS_RAM_D));
	RAM32x32 ram_a (.CLK(CLK),.ADDR(ADDRESS_RAM_A),.WE(GPR_WE_RAM),.DI(C),.DO(A));
	RAM32x32 ram_b (.CLK(CLK),.ADDR(ADDRESS_RAM_B),.WE(GPR_WE_RAM),.DI(C),.DO(B));
	RAM32x32 ram_d (.CLK(CLK),.ADDR(ADDRESS_RAM_D),.WE(GPR_WE_RAM),.DI(C),.DO(D));
	
endmodule
