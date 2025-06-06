`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:36 12/28/2024 
// Design Name: 
// Module Name:    MUX_17_BIT 
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
module MUX_17_BIT(
    input  [16:0] INPUT0,
    input  [16:0] INPUT1,
    input  sel,
    output [16:0] O
    );

assign O = (sel) ? INPUT1:INPUT0;


endmodule
