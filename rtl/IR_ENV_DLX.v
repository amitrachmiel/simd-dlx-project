`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:28:43 12/28/2024 
// Design Name: 
// Module Name:    IR_ENV_DLX 
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
module IR_ENV_DLX(
    input CLK,
    input IR_CE,
    input [31:0] D_IN,
    output [5:0] OPCODE,
    output [4:0] RS1,
    output [4:0] RS2,
    output [31:0] IR_OUT,
    output [31:0] SEXT_IMM,
    output [2:0] ALUF,
    output [4:0] C_ADDR,
	 output [5:0] ALUFP
    );
	
   wire [4:0] rd;
	reg [31:0] reg_ir ;
	always @(posedge CLK) begin
		if(IR_CE==1)begin
				reg_ir <= D_IN ;		
		end
		else begin
				reg_ir <= reg_ir ;
				end
		end
	
	assign rd = (reg_ir[31:28] ==4'b0) ? reg_ir[15:11] : reg_ir[20:16] ; 	
	assign IR_OUT = reg_ir  ;	
	assign OPCODE = reg_ir[31:26];
	assign RS1 =  reg_ir[25:21];
	assign RS2 = reg_ir[20:16] ;
	assign SEXT_IMM =  (reg_ir[15]==1)  ? { 16'hFFFF,reg_ir[15:0]} :{ 16'h0000,reg_ir[15:0]};
	assign C_ADDR = (reg_ir[31:29]== 3'b010 && reg_ir[26]==1) ? 5'b11111 : rd[4:0]  ; // on jalr we want c_addr wiil be R31
	assign ALUF = (reg_ir[31:28] ==4'b0) ? reg_ir[2:0] : reg_ir[28:26] ; 
	assign ALUFP = (reg_ir[31:29]==3'b111) ? {3'b0,reg_ir[28:26]} : reg_ir[5:0] ;

endmodule
