`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:39 12/28/2024 
// Design Name: 
// Module Name:    SHIFT_DLX 
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
module SHIFT_DLX(
    input [31:0] SHIFT_IN,
    input RIGHT,
    input SHIFT,
    output [31:0] SHIFT_OUT
    );
	 reg [31:0] reg_out; 
	always @(*) begin
       if (SHIFT)
		 begin
			 if (RIGHT)
			 begin
             reg_out = SHIFT_IN >> 1; // Shift right by 1 bit
            end 
				else
				begin
              reg_out = SHIFT_IN << 1; // Shift left by 1 bit
            end
		end 
		else // SHIFT ==0 
		begin
			  reg_out = SHIFT_IN; // No shift, output the input data
		  end
		 end
		 
	assign  SHIFT_OUT = reg_out ; 

endmodule
