`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:43 11/24/2024 
// Design Name: 
// Module Name:    date_path_la 
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
module date_path_la(
    input [31:0] DIN_RAM,
    input CLK,
    input la_we,
    input [4:0] AI,
    input sts_ce,
    output [31:0] DOUT_RAM,
    output  [4:0] STATUS
    );
	 
	 wire [4:0] counter_out;
	 wire [4:0] mux_out;
	CNT5 counter5(.CLK(CLK), .RST(RESET) ,.CE(la_we) ,.CNT(counter_out));
	MUX5bit mux5(.A(AI), .B(counter_out) ,.sel(la_we) ,.O(mux_out));
	statusreg statusreg(.DIN(counter_out) ,.CLK(CLK) ,.CE(sts_ce),.OUT(STATUS));
	RAM32x32(.CLK(CLK),.ADDR(mux_out) ,.WE(la_we),.DI(DIN_RAM),.DO(DOUT_RAM));

	
endmodule
