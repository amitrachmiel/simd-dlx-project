`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:26 12/28/2024 
// Design Name: 
// Module Name:    ALU_ENV_DLX 
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
module ALU_ENV_DLX(
	input [31:0] A,
	input [31:0] B,
	input [2:0] ALUF,
	input ADD,
	input TEST,
	output OVF,
	output [31:0] ALU_OUT
    );
	 
	wire [31:0] or_out ;
	wire [31:0] xor_out ;
	wire [31:0] and_out ;	
	wire [2:0] F;
	wire [31:0] out_mux_f0 ; 
	wire [31:0] out_mux_f1 ; 
	wire [31:0] out_mux_f2 ; 
	wire [31:0] out_mux_test ; 
	wire sub ; 
	wire [31:0] add_sub_out ;
	wire neg ;
	wire comp_out;
	wire [31:0] comp_out_32_bit ; 
	assign F  =  (ADD==1)   ? 3'b011 : ALUF[2:0] ; // forcing add
	assign or_out = A | B ;
	assign xor_out = A ^ B ;
	assign and_out = A & B ;
	assign sub = (~F[0]) | TEST ;
	
			
	
	ADD_SUB_32 add_sub (
	.A(A),
	.B(B),
	.SUB(sub),
	.S(add_sub_out),
	.OVF(OVF),
	.NEG(neg)
	);
	
	
	COMPARATOR comparator (
	.S(add_sub_out),
	.NEG(neg),
	.F(F),
	.COMP_OUT(comp_out) 
	);
	
	assign comp_out_32_bit = {31'b0 , comp_out} ;
	 
	MUX32bit mux_f0 (
	  .A(xor_out),
	  .B(or_out),
     .sel(F[0]),
     .O(out_mux_f0)
	);
	
		MUX32bit mux_f1 (
	  .A(out_mux_f0),
	  .B(and_out),
     .sel(F[1]),
     .O(out_mux_f1)
	);
	
		MUX32bit mux_f2 (
	  .A(add_sub_out),
	  .B(out_mux_f1),
     .sel(F[2]),
     .O(out_mux_f2)
	);

		MUX32bit mux_test (
	  .A(out_mux_f2),
	  .B(comp_out_32_bit),
     .sel(TEST),
     .O(ALU_OUT)
	);

endmodule
