`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:57 03/09/2025 
// Design Name: 
// Module Name:    PARALLEL_ALU 
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
module PARALLEL_ALU(
    input [31:0] rs1,        // Source register 1
    input [31:0] rs2,        // Source register 2
    input [31:0] imm,        //  sign extension immediate value (for shift or compare)
    input [5:0] opcode,      // Opcode to select instruction
    output reg [31:0] rd     // Destination register
);

    // Opcode definitions
   // I-Type opcodes (immediate-based instructions)
	parameter PSLLBI  = 6'd0;  // Packed shift left bytes (immediate)
	parameter PSLLHI  = 6'd1;  // Packed shift left half-words (immediate)
	parameter PSRLBI  = 6'd2;  // Packed shift right logical bytes (immediate)
	parameter PSRLHI  = 6'd3;  // Packed shift right logical half-words (immediate)
	parameter PERMUTEB = 6'd4; // Permute bytes
	parameter PERMUTEH = 6'd5; // Permute half-words
	
	// R-Type opcodes (register-based instructions)
	// Packed Integer Arithmetic Instructions
	parameter PADDUB  = 6'd6;  // Packed add bytes with saturation (unsigned)
	parameter PADDH   = 6'd7;  // Packed add half-words with saturation (unsigned)
	parameter PSUBUB  = 6'd8;  // Packed subtract bytes with saturation (unsigned)
	parameter PSUBUH  = 6'd9;  // Packed subtract half-words with saturation (unsigned)
	parameter PSLLB   = 6'd10; // Packed shift left bytes (variable)
	parameter PSLLH   = 6'd11; // Packed shift left half-words (variable)
	parameter PSRLB   = 6'd12; // Packed shift right logical bytes (variable)
	parameter PSRLH   = 6'd13; // Packed shift right logical half-words (variable)
	parameter PSRAH   = 6'd14; // Packed shift right arithmetic half-words (variable)

	// Packed Compare Instructions
	parameter PCMPEQB = 6'd15; // Packed compare equal bytes
	parameter PCMPGTB = 6'd16; // Packed compare greater than bytes
	parameter PCMPLEB = 6'd17; // Packed compare less than or equal bytes
	parameter PCMPEQH = 6'd18; // Packed compare equal half-words
	parameter PCMPGTH = 6'd19; // Packed compare greater than half-words
	parameter PCMPLEH = 6'd20; // Packed compare less than or equal half-words

	// Permutation and Mixing Instructions
	parameter MIXL    = 6'd21; // Mix left
	parameter MIXR    = 6'd22; // Mix right
	parameter PACKHH  = 6'd23; // Pack high half-words
	parameter PACKLH  = 6'd24; // Pack low half-words
	parameter UNPACKH = 6'd25; // Unpack high half-word (zero-extended)
	parameter UNPACKSH= 6'd26; // Unpack high half-word (sign-extended)
	parameter UNPACKLB= 6'd27; // Unpack low byte (zero-extended)
	parameter UNPACKSLB=6'd28; // Unpack low byte (sign-extended)
	parameter UNPACKHB= 6'd29; // Unpack high byte (zero-extended)
	parameter UNPACKSHB=6'd30; // Unpack high byte (sign-extended)

	// Packed Bitwise Instructions
	parameter PORB    = 6'd31; // Packed OR bytes
	parameter PANDB   = 6'd32; // Packed AND bytes
	parameter PXORB   = 6'd33; // Packed XOR bytes
	parameter PORH    = 6'd34; // Packed OR half-words
	parameter PANDH   = 6'd35; // Packed AND half-words
	parameter PXORH   = 6'd36; // Packed XOR half-words

	// Packed Absolute Subtract Instructions
	parameter PABSUBB = 6'd37; // Packed absolute subtract bytes
	parameter PABSUBH = 6'd38; // Packed absolute subtract half-words
	
	// Packed By Imm
	parameter PACKBYRS2 = 6'd39; //Packed By RS2

    // Temporary variables for saturation calculations
    reg [8:0] temp_byte;   // 9 bits to detect overflow in byte operations
    reg [16:0] temp_half;  // 17 bits to detect overflow in half-word operations

    always @(*) begin
        case (opcode)
            // Packed Integer Arithmetic Instructions (Table 1)
            PADDUB: begin // Packed add bytes with saturation (unsigned)
                temp_byte = rs1[7:0] + rs2[7:0];
                rd[7:0]   = (temp_byte > 255) ? 8'hFF : temp_byte[7:0];
                temp_byte = rs1[15:8] + rs2[15:8];
                rd[15:8]  = (temp_byte > 255) ? 8'hFF : temp_byte[7:0];
                temp_byte = rs1[23:16] + rs2[23:16];
                rd[23:16] = (temp_byte > 255) ? 8'hFF : temp_byte[7:0];
                temp_byte = rs1[31:24] + rs2[31:24];
                rd[31:24] = (temp_byte > 255) ? 8'hFF : temp_byte[7:0];
            end
            PADDH: begin // Packed add half-words with saturation (unsigned)
                temp_half = rs1[15:0] + rs2[15:0];
                rd[15:0]  = (temp_half > 65535) ? 16'hFFFF : temp_half[15:0];
                temp_half = rs1[31:16] + rs2[31:16];
                rd[31:16] = (temp_half > 65535) ? 16'hFFFF : temp_half[15:0];
            end
            PSUBUB: begin // Packed subtract bytes with saturation (unsigned)
                temp_byte = rs1[7:0] - rs2[7:0];
                rd[7:0]   = (rs1[7:0] < rs2[7:0]) ? 8'h00 : temp_byte[7:0];
                temp_byte = rs1[15:8] - rs2[15:8];
                rd[15:8]  = (rs1[15:8] < rs2[15:8]) ? 8'h00 : temp_byte[7:0];
                temp_byte = rs1[23:16] - rs2[23:16];
                rd[23:16] = (rs1[23:16] < rs2[23:16]) ? 8'h00 : temp_byte[7:0];
                temp_byte = rs1[31:24] - rs2[31:24];
                rd[31:24] = (rs1[31:24] < rs2[31:24]) ? 8'h00 : temp_byte[7:0];
            end
            PSUBUH: begin // Packed subtract half-words with saturation (unsigned)
                temp_half = rs1[15:0] - rs2[15:0];
                rd[15:0]  = (rs1[15:0] < rs2[15:0]) ? 16'h0000 : temp_half[15:0];
                temp_half = rs1[31:16] - rs2[31:16];
                rd[31:16] = (rs1[31:16] < rs2[31:16]) ? 16'h0000 : temp_half[15:0];
            end
            PSLLB: begin // Packed shift left bytes (variable)
                rd[7:0]   = rs1[7:0]   << rs2[3:0];
                rd[15:8]  = rs1[15:8]  << rs2[3:0];
                rd[23:16] = rs1[23:16] << rs2[3:0];
                rd[31:24] = rs1[31:24] << rs2[3:0];
            end
            PSLLH: begin // Packed shift left half-words (variable)
                rd[15:0]  = rs1[15:0]  << rs2[4:0];
                rd[31:16] = rs1[31:16] << rs2[4:0];
            end
            PSRLB: begin // Packed shift right logical bytes (variable)
                rd[7:0]   = rs1[7:0]   >> rs2[3:0];
                rd[15:8]  = rs1[15:8]  >> rs2[3:0];
                rd[23:16] = rs1[23:16] >> rs2[3:0];
                rd[31:24] = rs1[31:24] >> rs2[3:0];
            end
            PSRLH: begin // Packed shift right logical half-words (variable)
                rd[15:0]  = rs1[15:0]  >> rs2[4:0];
                rd[31:16] = rs1[31:16] >> rs2[4:0];
            end
            PSRAH: begin // Packed shift right arithmetic half-words (variable)
                rd[15:0]  = $signed(rs1[15:0])  >>> rs2[4:0];
                rd[31:16] = $signed(rs1[31:16]) >>> rs2[4:0];
            end
            PCMPEQB: begin // Packed compare equal bytes
                rd[7:0]   = (rs1[7:0]   == rs2[7:0])   ? 8'hFF : 8'h00;
                rd[15:8]  = (rs1[15:8]  == rs2[15:8])  ? 8'hFF : 8'h00;
                rd[23:16] = (rs1[23:16] == rs2[23:16]) ? 8'hFF : 8'h00;
                rd[31:24] = (rs1[31:24] == rs2[31:24]) ? 8'hFF : 8'h00;
            end
            PCMPGTB: begin // Packed compare greater than bytes
                rd[7:0]   = (rs1[7:0]   > rs2[7:0])   ? 8'hFF : 8'h00;
                rd[15:8]  = (rs1[15:8]  > rs2[15:8])  ? 8'hFF : 8'h00;
                rd[23:16] = (rs1[23:16] > rs2[23:16]) ? 8'hFF : 8'h00;
                rd[31:24] = (rs1[31:24] > rs2[31:24]) ? 8'hFF : 8'h00;
            end
            PCMPLEB: begin // Packed compare less than or equal bytes
                rd[7:0]   = (rs1[7:0]   <= rs2[7:0])   ? 8'hFF : 8'h00;
                rd[15:8]  = (rs1[15:8]  <= rs2[15:8])  ? 8'hFF : 8'h00;
                rd[23:16] = (rs1[23:16] <= rs2[23:16]) ? 8'hFF : 8'h00;
                rd[31:24] = (rs1[31:24] <= rs2[31:24]) ? 8'hFF : 8'h00;
            end
            PCMPEQH: begin // Packed compare equal half-words
                rd[15:0]  = (rs1[15:0]  == rs2[15:0])  ? 16'hFFFF : 16'h0000;
                rd[31:16] = (rs1[31:16] == rs2[31:16]) ? 16'hFFFF : 16'h0000;
            end
            PCMPGTH: begin // Packed compare greater than half-words
                rd[15:0]  = (rs1[15:0]  > rs2[15:0])  ? 16'hFFFF : 16'h0000;
                rd[31:16] = (rs1[31:16] > rs2[31:16]) ? 16'hFFFF : 16'h0000;
            end
            PCMPLEH: begin // Packed compare less than or equal half-words
                rd[15:0]  = (rs1[15:0]  <= rs2[15:0])  ? 16'hFFFF : 16'h0000;
                rd[31:16] = (rs1[31:16] <= rs2[31:16]) ? 16'hFFFF : 16'h0000;
            end
            PSLLBI: begin // Packed shift left bytes (immediate)
                rd[7:0]   = rs1[7:0]   << imm[3:0];
                rd[15:8]  = rs1[15:8]  << imm[3:0];
                rd[23:16] = rs1[23:16] << imm[3:0];
                rd[31:24] = rs1[31:24] << imm[3:0];
            end
            PSLLHI: begin // Packed shift left half-words (immediate)
                rd[15:0]  = rs1[15:0]  << imm[4:0];
                rd[31:16] = rs1[31:16] << imm[4:0];
            end
            PSRLBI: begin // Packed shift right logical bytes (immediate)
                rd[7:0]   = rs1[7:0]   >> imm[3:0];
                rd[15:8]  = rs1[15:8]  >> imm[3:0];
                rd[23:16] = rs1[23:16] >> imm[3:0];
                rd[31:24] = rs1[31:24] >> imm[3:0];
            end
            PSRLHI: begin // Packed shift right logical half-words (immediate)
                rd[15:0]  = rs1[15:0]  >> imm[4:0];
                rd[31:16] = rs1[31:16] >> imm[4:0];
            end

            // Permutation Instructions (Table 2)
            PERMUTEB: begin // Permute bytes
                case (imm[1:0])   // Select source byte for rd[7:0]
                    2'b00: rd[7:0]   = rs1[7:0];
                    2'b01: rd[7:0]   = rs1[15:8];
                    2'b10: rd[7:0]   = rs1[23:16];
                    2'b11: rd[7:0]   = rs1[31:24];
                endcase
                case (imm[3:2])   // Select source byte for rd[15:8]
                    2'b00: rd[15:8]  = rs1[7:0];
                    2'b01: rd[15:8]  = rs1[15:8];
                    2'b10: rd[15:8]  = rs1[23:16];
                    2'b11: rd[15:8]  = rs1[31:24];
                endcase
                case (imm[5:4])   // Select source byte for rd[23:16]
                    2'b00: rd[23:16] = rs1[7:0];
                    2'b01: rd[23:16] = rs1[15:8];
                    2'b10: rd[23:16] = rs1[23:16];
                    2'b11: rd[23:16] = rs1[31:24];
                endcase
                case (imm[7:6])   // Select source byte for rd[31:24]
                    2'b00: rd[31:24] = rs1[7:0];
                    2'b01: rd[31:24] = rs1[15:8];
                    2'b10: rd[31:24] = rs1[23:16];
                    2'b11: rd[31:24] = rs1[31:24];
                endcase
            end
            PERMUTEH: begin // Permute half-words
                rd[15:0]  = imm[0] ? rs1[31:16] : rs1[15:0];
                rd[31:16] = imm[1] ? rs1[15:0]  : rs1[31:16];
            end
            MIXL: begin // Mix left
                rd[7:0]   = rs1[7:0];
                rd[15:8]  = rs2[7:0];
                rd[23:16] = rs1[15:8];
                rd[31:24] = rs2[15:8];
            end
            MIXR: begin // Mix right
                rd[7:0]   = rs1[23:16];
                rd[15:8]  = rs2[23:16];
                rd[23:16] = rs1[31:24];
                rd[31:24] = rs2[31:24];
            end
            PACKHH: begin // Pack high half-words
                rd[15:0]  = rs1[31:16];
                rd[31:16] = rs2[31:16];
            end
            PACKLH: begin // Pack low half-words
                rd[15:0]  = rs1[15:0];
                rd[31:16] = rs2[15:0];
            end
            UNPACKH: begin // Unpack high half-word (zero-extended)
                rd[15:0]  = rs1[31:16];
                rd[31:16] = 16'h0000;
            end
            UNPACKSH: begin // Unpack high half-word (sign-extended)
                rd[15:0]  = rs1[31:16];
                rd[31:16] = {16{rs1[31]}};
            end
            UNPACKLB: begin // Unpack low byte (zero-extended)
                rd[7:0]   = rs1[7:0];
                rd[31:8]  = 24'h000000;
            end
            UNPACKSLB: begin // Unpack low byte (sign-extended)
                rd[7:0]   = rs1[7:0];
                rd[31:8]  = {24{rs1[7]}};
            end
            UNPACKHB: begin // Unpack high byte (zero-extended)
                rd[7:0]   = rs1[31:24];
                rd[31:8]  = 24'h000000;
            end
            UNPACKSHB: begin // Unpack high byte (sign-extended)
                rd[7:0]   = rs1[31:24];
                rd[31:8]  = {24{rs1[31]}};
            end

            // New Packed Bitwise Instructions
            PORB: begin // Packed OR bytes
                rd[7:0]   = rs1[7:0]   | rs2[7:0];
                rd[15:8]  = rs1[15:8]  | rs2[15:8];
                rd[23:16] = rs1[23:16] | rs2[23:16];
                rd[31:24] = rs1[31:24] | rs2[31:24];
            end
            PANDB: begin // Packed AND bytes
                rd[7:0]   = rs1[7:0]   & rs2[7:0];
                rd[15:8]  = rs1[15:8]  & rs2[15:8];
                rd[23:16] = rs1[23:16] & rs2[23:16];
                rd[31:24] = rs1[31:24] & rs2[31:24];
            end
            PXORB: begin // Packed XOR bytes
                rd[7:0]   = rs1[7:0]   ^ rs2[7:0];
                rd[15:8]  = rs1[15:8]  ^ rs2[15:8];
                rd[23:16] = rs1[23:16] ^ rs2[23:16];
                rd[31:24] = rs1[31:24] ^ rs2[31:24];
            end
            PORH: begin // Packed OR half-words
                rd[15:0]  = rs1[15:0]  | rs2[15:0];
                rd[31:16] = rs1[31:16] | rs2[31:16];
            end
            PANDH: begin // Packed AND half-words
                rd[15:0]  = rs1[15:0]  & rs2[15:0];
                rd[31:16] = rs1[31:16] & rs2[31:16];
            end
            PXORH: begin // Packed XOR half-words
                rd[15:0]  = rs1[15:0]  ^ rs2[15:0];
                rd[31:16] = rs1[31:16] ^ rs2[31:16];
            end
		
				//  Block Matching Instructions (Table 2)
				PABSUBB: begin // Packed absolute subtract bytes
				rd[7:0]   = (rs1[7:0]   > rs2[7:0])   ? (rs1[7:0]   - rs2[7:0])   : (rs2[7:0]   - rs1[7:0]);
				rd[15:8]  = (rs1[15:8]  > rs2[15:8])  ? (rs1[15:8]  - rs2[15:8])  : (rs2[15:8]  - rs1[15:8]);
				rd[23:16] = (rs1[23:16] > rs2[23:16]) ? (rs1[23:16] - rs2[23:16]) : (rs2[23:16] - rs1[23:16]);
				rd[31:24] = (rs1[31:24] > rs2[31:24]) ? (rs1[31:24] - rs2[31:24]) : (rs2[31:24] - rs1[31:24]);
			   end
				PABSUBH: begin // Packed absolute subtract half-words
				rd[15:0]  = (rs1[15:0]  > rs2[15:0])  ? (rs1[15:0]  - rs2[15:0])  : (rs2[15:0]  - rs1[15:0]);
				rd[31:16] = (rs1[31:16] > rs2[31:16]) ? (rs1[31:16] - rs2[31:16]) : (rs2[31:16] - rs1[31:16]);
				end
				
				// Image Sharping Instructions
            PACKBYRS2: begin 
           case (rs2[1:0])
            2'b00: begin
					 rd[7:0]   = rs1[7:0];
                rd[15:8]  = 8'b0;
                rd[23:16] = 8'b0;
                rd[31:24] = 8'b0;
            end
            2'b01: begin
                rd[15:8]  = rs1[7:0];
                rd[7:0]   = 8'b0;
                rd[23:16] = 8'b0;
                rd[31:24] = 8'b0;
            end
            2'b10: begin
                rd[23:16] = rs1[7:0];
                rd[7:0]   = 8'b0;
                rd[15:8]  = 8'b0;
                rd[31:24] = 8'b0;
            end
            2'b11: begin
                rd[31:24] = rs1[7:0];
                rd[7:0]   = 8'b0;
                rd[15:8]  = 8'b0;
                rd[23:16] = 8'b0;
            end
        endcase
             end
			
            default: rd = 32'h00000000; // Default case
        endcase
    end
endmodule