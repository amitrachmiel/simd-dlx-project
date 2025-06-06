`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:51 11/24/2024 
// Design Name: 
// Module Name:    control_la 
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
module control_la(
	 input CLK,
    input step_en,
    input in_init,
    input stop_n,
    output la_run,
    output la_we,
    output sts_ce
    );
	reg in_init_q;
	reg la_run_q;

	
	always @(posedge CLK)
		in_init_q <= in_init ; 
		
	always @(posedge CLK)
		la_run_q <= la_run ; 
	
	
	assign la_run = step_en | (~(in_init & in_init_q));
	assign la_we = stop_n & la_run;
	assign sts_ce = (~la_run) & la_run_q;
	

	
	


endmodule
