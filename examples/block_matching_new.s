*Block Matching: Compute SAD (Sum of Absolute Differences) for two 2x2 blocks
*Uses parallel ALU instructions for pixel extraction and combining
*Input: curr_blo = 0x04134930 [4, 19, 73, 48]
*ref_blo = 0x11223344 \[17, 34, 51, 68\]
*Output: sad_res = |4-17| + |19-34| + |73-51| + |48-68| = 13 + 15 + 22 + 20 = 70

pc=0x0
*Load current and reference blocks 
start: lw R1 R0 curr_blo * R1 = [4, 19, 73, 48] 
lw R2 R0 ref_blo * R2 = [17, 34, 51, 68]



*Compute absolute differences for all 4 pixels in parallel
 PABSUBB R3, R1, R2     * R3 = [|4-17|, |19-34|, |73-51|, |48-68|] = [13, 15, 22, 20]


*Initialize SAD accumulator 
add R4 R0 R0 * R4 = 0 (SAD accumulator)



*Extract and sum the 4 bytes from R3

*Byte 0 (bits 7:0)
 UNPACKLB R5, R3, R0 * R5 = [0, 0, 0, 20] 
 add R4 R4 R5 * R4 = 0 + 20 = 20



*Byte 1 (bits 15:8)
 PERMUTEB R6, R3, 0x1111 * R6 = [dc, dc, dc, 22] dc= dont care
  UNPACKLB R5, R6, R0 * R5 = [0, 0, 0, 22] 
  add R4 R4 R5 * R4 = 20 + 22 = 42



*Byte 2 (bits 23:16) 
PERMUTEB R6, R3, 0x2222 * R6 = [dc, dc, dc, 15] 
UNPACKLB R5, R6, R0 * R5 = [0, 0, 0, 15] 
add R4 R4 R5 * R4 = 42 + 15 = 57



*Byte 3 (bits 31:24)
 PERMUTEB R6, R3, 0x3333 * R6 = [dc, dc, dc, 13] 
 UNPACKLB R5, R6, R0 * R5 = [0, 0, 0, 13] 
 add R4 R4 R5 * R4 = 57 + 13 = 70



*Store final SAD result 
sw R4 R0 sad_res * Store R4 (70) to sad_res

halt * End program

*Data section 
curr_blo: dc 0x04134930 * Current block: [4, 19, 73, 48]
 ref_blo: dc 0x11223344 * Reference block: [17, 34, 51, 68] 
 sad_res: ds 1 * Space for SAD result