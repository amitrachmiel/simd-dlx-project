`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:39 12/27/2024 
// Design Name: 
// Module Name:    DLX_CONTROL_STM 
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
module DLX_CONTROL_STM(
    input CLK,
    input RESET,
    input AEQZ,
    input STEP_EN,
    input BUSY,
    input [31:0] IR,
    output IN_INIT,
    output IR_CE,
    output PC_CE,
    output ADD,
    output A_CE,
    output B_CE,
    output C_CE,
    output MR,
    output MW,
    output MDR_CE,
    output MAR_CE,
    output MDR_SEL,
    output TEST,
    output ITYPE,
    output SHIFT_CE,
    output RIGHT,
    output A_SEL,
    output DINT_SEL,
    output JLINK,
    output GPR_WE,
    output [4:0] DLX_STATE,
    output [1:0] S1_SEL,
    output [1:0] S2_SEL,
	 output MUXALU_SEL 
    );
	reg [4:0] DLX_STATE_REG;
	
	wire BRANCH_TAKEN  ; 
	
	parameter INIT = 5'b00000 ; 
	parameter FETCH = 5'b00001 ; 
	parameter DECODE = 5'b00010 ; 
	parameter BRANCH = 5'b00011 ; 
	parameter BTAKEN = 5'b00100 ; 
	parameter SAVEPC = 5'b00101 ; 
	parameter JALR = 5'b00110 ;
	parameter JR = 5'b00111 ; 	
	parameter ADDRESSCMP = 5'b01000 ; 
	parameter COPYGPR2MDR = 5'b01001 ; 
	parameter STORE = 5'b01010 ; 
	parameter LOAD = 5'b01011 ; 
	parameter COPYMDR2C = 5'b01100 ; 
	parameter TESTI = 5'b01101 ; 
	parameter ALUI = 5'b01110 ; 
	parameter WBI = 5'b01111 ; 
	parameter SHIFT = 5'b10000 ; 
	parameter ALU = 5'b10001 ; 
	parameter WBR = 5'b10010 ; 
	parameter HALT = 5'b10011 ; 
	parameter ALUPR = 5'b10100 ;
	parameter ALUPI = 5'b10101 ;
	
	
	always @(posedge CLK)
	begin 
	if(RESET ==1)
		DLX_STATE_REG = INIT ;
	else
	begin
	case(DLX_STATE_REG)
		INIT : 
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
	
	
		FETCH : 
					if(BUSY ==0)
					begin
					DLX_STATE_REG = DECODE ;
					end
					else 
					begin 
					DLX_STATE_REG = FETCH;
					end
	
		DECODE :
					if(IR[31:29]==3'b110)// special nop
					begin
						if(STEP_EN ==1) //countinues mode
							begin
							DLX_STATE_REG = FETCH ;
							end
							else 
							begin 
							DLX_STATE_REG = INIT;
							end
					end
					
					 else if (IR[31:27]==5'b00001) // R type, ALUPR , D 14
								begin
								DLX_STATE_REG = ALUPR ;
								end
					else if (IR[31:28]==4'b0000 && IR[5]==1'b1)// R type , ALU , D2
								begin
								DLX_STATE_REG = ALU;
								end
	
					else if (IR[31:28]==4'b0000 && IR[5]==1'b0)// R type ,  SHIFT , D4
								begin
								DLX_STATE_REG = SHIFT;
								end
					
					
					else if (IR[31:29]==3'b111 && IR[28:26] !=3'b111) //ALUPI ,D15
								begin
								DLX_STATE_REG = ALUPI;
								end
					
					else if (IR[31:29]==3'b001) //ADDI ,D5
								begin
								DLX_STATE_REG = ALUI;
								end
										
					else if (IR[31:29]==3'b011) //TEST , D6
						begin
						DLX_STATE_REG = TESTI;
						end
					
					else if (IR[31:30]==2'b10) //load or store command , D7
						begin
						DLX_STATE_REG = ADDRESSCMP;
						end

					else if (IR[31:29]==3'b010 && IR[26]==1'b0) //jr  , D8
						begin
						DLX_STATE_REG = JR;
						end
						
					else if (IR[31:29]==3'b010 && IR[26]==1'b1) //save pc , D9
						begin
						DLX_STATE_REG = SAVEPC;
						end
					
					
					else if (IR[31:28]==4'b0001) //branch , D12
						begin
						DLX_STATE_REG = BRANCH;
						end
					
					else
						begin
						DLX_STATE_REG = HALT;
						end
			
			ALU: 	
					DLX_STATE_REG = WBR;
			SHIFT: 	
					DLX_STATE_REG = WBR;
			ALUI: 	
					DLX_STATE_REG = WBI;
			TESTI: 	
					DLX_STATE_REG = WBI;
					
			ALUPR: 
					DLX_STATE_REG = WBR;
			ALUPI: 
					DLX_STATE_REG = WBI;
			
			ADDRESSCMP:
					if(IR[29]==1'b1) // store command
					begin
					DLX_STATE_REG = COPYGPR2MDR  ;
					end
					else if(IR[29]==1'b0) // load command
					begin
					DLX_STATE_REG = LOAD  ;
					end
					

		 COPYGPR2MDR:
						DLX_STATE_REG = STORE  ;
			
		 LOAD: 
					if(BUSY==1'b0) 
					begin
					DLX_STATE_REG = COPYMDR2C;
					end
					else // BUSY = 1 ; 
					begin
					DLX_STATE_REG = LOAD;
					end
		
		  COPYMDR2C:
					DLX_STATE_REG = WBI;
		
		SAVEPC: 
					DLX_STATE_REG = JALR;
				

		BRANCH: 
				if(BRANCH_TAKEN==1'b1)
				begin
				DLX_STATE_REG = BTAKEN;
				end
				else 
				begin
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
				end
				
				
		WBR:
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
		
		WBI:
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
				
		BTAKEN:
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
		
		
		JALR:
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
		
		
		JR:
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end

	STORE:
			if(BUSY==0)
			begin
				if(STEP_EN ==1)
				begin
				DLX_STATE_REG = FETCH ;
				end
				else 
				begin 
				DLX_STATE_REG = INIT;
				end
			end
			else
				DLX_STATE_REG = STORE;
	
	HALT: 
			
				if(RESET ==1)
				begin
				DLX_STATE_REG = INIT ;
				end
				else 
				begin 
				DLX_STATE_REG = HALT;
				end
				
				
	default : 
			begin 
			DLX_STATE_REG = INIT ;
			end
	endcase
		end
		end
		
		
		assign S1_SEL[0] = DLX_STATE_REG==ALU || DLX_STATE_REG==TESTI || DLX_STATE_REG==ALUI || 
			DLX_STATE_REG==SHIFT || DLX_STATE_REG==ADDRESSCMP || DLX_STATE_REG==COPYMDR2C ||
			 DLX_STATE_REG== JR ||  DLX_STATE_REG==JALR || DLX_STATE_REG==ALUPR || DLX_STATE_REG==ALUPI ;
			 
		assign S1_SEL[1] = DLX_STATE_REG==COPYMDR2C || DLX_STATE_REG==COPYGPR2MDR ; 
		
		assign S2_SEL[0] = DLX_STATE_REG== DECODE || DLX_STATE_REG== TESTI ||
			DLX_STATE_REG== ALUI || DLX_STATE_REG==ADDRESSCMP|| DLX_STATE_REG==BTAKEN || DLX_STATE_REG==ALUPI ; 
			
		assign S2_SEL[1] = DLX_STATE_REG== DECODE || DLX_STATE_REG== COPYMDR2C ||
			DLX_STATE_REG== COPYGPR2MDR || 	DLX_STATE_REG==JR || 
			DLX_STATE_REG==JALR || DLX_STATE_REG==SAVEPC ; 
			
		assign IN_INIT  = DLX_STATE_REG== INIT || DLX_STATE_REG==HALT  ; 
		
		assign IR_CE = DLX_STATE_REG== FETCH ;
		
		assign PC_CE = DLX_STATE_REG== DECODE ||  DLX_STATE_REG==BTAKEN ||
				 DLX_STATE_REG== JR ||  DLX_STATE_REG==JALR;
				 
		assign ADD = DLX_STATE_REG== DECODE ||  DLX_STATE_REG==BTAKEN ||
				 DLX_STATE_REG== JR ||  DLX_STATE_REG==JALR ||  DLX_STATE_REG==SAVEPC ||
					 DLX_STATE_REG== ALUI ||  DLX_STATE_REG==ADDRESSCMP;
					 
		assign A_CE =  DLX_STATE_REG== DECODE ; 
		
		assign B_CE =  DLX_STATE_REG== DECODE ; 
		
		assign C_CE =  DLX_STATE_REG== ALU || DLX_STATE_REG==TESTI || 
			DLX_STATE_REG == ALUI || DLX_STATE_REG== SHIFT || DLX_STATE_REG== SAVEPC ||
			DLX_STATE_REG == COPYMDR2C || DLX_STATE_REG==ALUPR || DLX_STATE_REG==ALUPI;  
			
		assign MR =  DLX_STATE_REG== FETCH || DLX_STATE_REG== LOAD ;
		
		assign MW  = DLX_STATE_REG== STORE; 
		
		assign MAR_CE =  DLX_STATE_REG==ADDRESSCMP;
		
		assign MDR_CE  = (DLX_STATE_REG == LOAD && BUSY ==0) || DLX_STATE_REG== COPYGPR2MDR ; 
		
		assign MDR_SEL = DLX_STATE_REG== LOAD ;
		
		assign TEST = DLX_STATE_REG== TESTI ;
		
		assign ITYPE  = DLX_STATE_REG== TESTI|| DLX_STATE_REG== ALUI ||
			DLX_STATE_REG== WBI || DLX_STATE_REG==ALUPI ; 
			
		assign SHIFT_CE =  DLX_STATE_REG== SHIFT;
		
		assign  RIGHT = DLX_STATE_REG== SHIFT && IR[1] ==1'b1 ; 
		
		assign A_SEL =  DLX_STATE_REG== STORE || DLX_STATE_REG== LOAD ;
		
		assign DINT_SEL  =  DLX_STATE_REG== SHIFT ||  DLX_STATE_REG== COPYGPR2MDR ||
			DLX_STATE_REG == COPYMDR2C; 
			
		assign JLINK =  DLX_STATE_REG==JALR ; 
		
		assign GPR_WE =  DLX_STATE_REG==JALR || DLX_STATE_REG== WBI || DLX_STATE_REG== WBR ; 
		
		assign BRANCH_TAKEN = AEQZ ^ IR[26] ; 
		
		assign MUXALU_SEL = DLX_STATE_REG==ALUPR || DLX_STATE_REG==ALUPI ; 
		
		assign DLX_STATE = DLX_STATE_REG;
		
		
		
endmodule
