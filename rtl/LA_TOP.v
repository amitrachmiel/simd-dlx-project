`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:41 11/24/2024 
// Design Name: 
// Module Name:    LA_TOP 
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
module LA_TOP(
    input CLK,
    input [31:0] MONITOR_SIGNAL,
    input [4:0] AI,
    input step_en,
    input in_init,
    input stop_n,
	 input RESET,
    output [31:0] DOUT,
    output [7:0] STATUS
    );
	wire la_run;
	wire la_we;
	wire sts_ce;
	control_la control_la1(.stop_n(stop_n),.CLK(CLK),.step_en(step_en),.in_init(in_init),.la_run(la_run),.la_we(la_we),.sts_ce(sts_ce));
	data_path_la data_path_la(.CLK(CLK),.RESET(RESET),.DIN_RAM(MONITOR_SIGNAL),.AI(AI),.la_we(la_we),.sts_ce(sts_ce),.DOUT_RAM(DOUT),.STATUS(STATUS));

endmodule
