`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:38:47 12/14/2024 
// Design Name: 
// Module Name:    CONTROL_STM 
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
module CONTROL_STM(
    input CLK,
    input RESET,
    input ACK_N,
	 input BUSY,
	 input STEP_EN,
    input [5:0] OPCODE,
    output MR,
    output MW,
    output IN_INIT,
	 output REG_B_CE,
	 output REG_C_CE,
	 output IR_CE,
	 output PC_CE,
	 output GPR_WE,
	 output MUX_SELECTOR,
    output [2:0] CON_STATE
    );
	reg [2:0] CON_STATE_REG;

	
	
	parameter INIT = 3'h0 ; 
	parameter FETCH = 3'h1 ; 
	parameter DECODE = 3'h2 ;
	parameter HALT = 3'h3 ;
	parameter LOAD = 3'h4 ;
	parameter STORE = 3'h5 ;
	parameter WRITEBACK = 3'h6 ;
	
	always @(posedge CLK)
	begin 
	if(RESET ==1)
		CON_STATE_REG = INIT ;
	else
	begin 
		
		case(CON_STATE_REG)
			
			INIT : 
				if(STEP_EN ==1)
				begin
				CON_STATE_REG = FETCH ;
				end
				else 
				begin 
				CON_STATE_REG = INIT;
				end
				
			FETCH : 
					if(BUSY ==0)
					begin
					CON_STATE_REG = DECODE ;
					end
					else 
					begin 
					CON_STATE_REG = FETCH;
					end
			
			DECODE : 
				if(OPCODE==6'b100011) // LOAD
				begin
				CON_STATE_REG = LOAD;
				end
				
				else if(OPCODE==6'b101011)//STORE
				begin
				CON_STATE_REG = STORE;
				end
				else // HALT 
				begin
				CON_STATE_REG = HALT;
				end
			
			LOAD: 
				if(BUSY ==0)
					begin
					CON_STATE_REG = WRITEBACK ;
					end
					else 
					begin 
					CON_STATE_REG = LOAD;
					end
			
			STORE:
				if(BUSY ==0)
					begin
					CON_STATE_REG = INIT ;
					end
					else 
					begin 
					CON_STATE_REG = STORE;
					end
			
			HALT:
			if(RESET ==1)
					begin
					CON_STATE_REG = INIT ;
					end
					else 
					begin 
					CON_STATE_REG = HALT;
					end
			
			WRITEBACK:
				CON_STATE_REG = INIT ;
			
			default : 
			begin 
			CON_STATE_REG = INIT ;
			end
		endcase
		end
		end
		
		assign MR = ((CON_STATE_REG ==FETCH) | (CON_STATE_REG==LOAD)) ? 1 : 0 ; 
		assign MW  = CON_STATE_REG==STORE ? 1:0 ; 
		assign IN_INIT = ((CON_STATE_REG==INIT) | (CON_STATE_REG==HALT)) ? 1 : 0 ;
		assign REG_B_CE = CON_STATE_REG == DECODE ? 1 : 0  ;
		assign REG_C_CE = CON_STATE_REG ==LOAD ? 1  : 0 ; 
		assign IR_CE = CON_STATE_REG == FETCH ? 1 : 0 ;
		assign PC_CE = CON_STATE_REG == DECODE ? 1 : 0 ;
		assign GPR_WE = CON_STATE_REG == WRITEBACK ? 1 : 0 ; 
		assign MUX_SELECTOR = (CON_STATE_REG == INIT || CON_STATE_REG==FETCH || CON_STATE_REG==HALT) ? 1:0;
		assign CON_STATE = CON_STATE_REG;
				
		
		
	

endmodule
   
