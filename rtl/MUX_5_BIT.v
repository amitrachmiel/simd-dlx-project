`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:44:33 12/14/2024 
// Design Name: 
// Module Name:    MUX_5_BIT 
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
module MUX_5_BIT(
    input  [4:0] INPUT0,
    input  [4:0] INPUT1,
    input  sel,
    output [4:0] O
    );

assign O = (sel) ? INPUT1:INPUT0;

endmodule



