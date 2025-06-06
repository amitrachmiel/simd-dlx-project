`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:09 12/28/2024 
// Design Name: 
// Module Name:    COMPARATOR 
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
module COMPARATOR(
	input [31:0] S,
	input NEG,
	input [2:0] F,
	output COMP_OUT 
    );
	 
	 wire s_eqz = (S == 32'h00000000) ? 1:0;
	 assign COMP_OUT = ((~s_eqz) & ((~NEG)& F[0])) | ((NEG & F[2]) | (s_eqz & F[1])) ;
	 
	 

endmodule
