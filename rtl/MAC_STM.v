`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:56:40 12/14/2024 
// Design Name: 
// Module Name:    MAC_STM 
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
module MAC_STM(
	 input CLK,
    input RESET,
    input ACK_N,
	 input MR,
	 input MW,
    output STOP_N,
    output AS_N,
    output WR_N,
    output BUSY,
    output [1:0] MAC_STATE
    );
	reg [1:0] MAC_STATE_REG;
	
	
	
	parameter stm_st0 = 2'h0 ; // wait4req
	parameter stm_st1 = 2'h1 ; // wait4ack
	parameter stm_st2 = 2'h2 ; // next

	
	always @(posedge CLK)
	begin 
	if(RESET ==1)
		MAC_STATE_REG = stm_st0 ;
	else
	begin 
		
		case(MAC_STATE_REG)
			
			stm_st0 : 
				if((MR|MW) ==1)
				begin
				MAC_STATE_REG = stm_st1 ;
				end
				else 
				begin 
				MAC_STATE_REG = stm_st0;
				end
				
			stm_st1 : 
					if(ACK_N ==0)
					begin
					MAC_STATE_REG = stm_st2 ;
					end
					else 
					begin 
					MAC_STATE_REG = stm_st1;
					end
			
			stm_st2 : 
				MAC_STATE_REG = stm_st0 ;
		
			default : 
			begin 
			MAC_STATE_REG = stm_st0 ;
			end
		endcase
		end
		end
		
		assign BUSY = (ACK_N & (MR|MW))  ; 
		assign WR_N = (MAC_STATE_REG == stm_st1 & MW) ? 0 : 1 ;
		assign AS_N = MAC_STATE_REG == stm_st1 ? 0 : 1 ;
		assign STOP_N = (MAC_STATE_REG== stm_st1) ? 0:1 ;
		assign MAC_STATE = MAC_STATE_REG;
				
		
		
	

endmodule
   



