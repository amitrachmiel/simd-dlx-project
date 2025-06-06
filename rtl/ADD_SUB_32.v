`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:49:19 12/28/2024 
// Design Name: 
// Module Name:    ADD_SUB_32 
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
module ADD_SUB_32(
	input [31:0] A,
	input [31:0] B,
	input SUB,
	output [31:0] S,
	output OVF,
	output NEG
    );

	wire add ; 
	assign add = ~ SUB ; 
	wire cout ;
	
	wire [15:0] out_add1 ;
	wire [16:0] out_add2 ;//cin =0 
	wire [16:0] out_add3 ;// cin =1 
	wire [16:0] out_mux ; 
	wire cout1 ; 
	wire ovf1;
	wire ovf2;
	wire ovf3;
	

	ADSU16 add1 (
	.CI(SUB),
	.A(A[15:0]),
	.B(B[15:0]),
	.ADD(add),
	.S(out_add1),
	.CO(cout1),
	.OFL(ovf1)
	);
	
	ADSU16 add2 (
	.CI(1'b0),
	.A(A[31:16]),
	.B(B[31:16]),
	.ADD(add),
	.S(out_add2[15:0]),
	.CO(out_add2[16]),
	.OFL(ovf2)
	);
	
	ADSU16 add3 (
	.CI(1'b1),
	.A(A[31:16]),
	.B(B[31:16]),
	.ADD(add),
	.S(out_add3[15:0]),
	.CO(out_add3[16]),
	.OFL(ovf3)
	);
	
	MUX_17_BIT mux_17_bit (
	.INPUT0(out_add2),
	.INPUT1(out_add3),
	.sel(cout1),
	.O(out_mux)
	);
	
	assign S = {out_mux[15:0],out_add1[15:0]} ;
	assign cout = out_mux[16] ; 
	assign OVF = (cout1==1)? ovf3 : ovf2;
	assign NEG = OVF ^ S[31] ;

endmodule
