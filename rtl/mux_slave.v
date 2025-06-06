`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:03 11/16/2024 
// Design Name: 
// Module Name:    mux_slave 
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
module mux_slave(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [1:0] SEL_MUX,
    output [31:0] OUT_MUX
    );


	assign OUT_MUX = (SEL_MUX == 2'b00) ? A : 
                 (SEL_MUX == 2'b01) ? B : 
                 (SEL_MUX == 2'b10) ? C : 
                 D;  // If sel is 2'b11

endmodule
