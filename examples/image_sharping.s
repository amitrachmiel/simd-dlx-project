* Image Sharpening: Apply sharpening to a 2x2 block (4 pixels, 8-bit each)
* Uses parallel ALU instructions for Laplacian and combining, basic instructions for clipping
* Input: input = 0x12345678 [P00=18, P01=52, P10=86, P11=120]
* Output: output = [S00=0, S01=70, S10=206, S11=255] = 0x0046CEFF
* Sharpening: Sxx = 4*Pxx - Pyy - Pzz, clipped to [0, 255]

pc=0x0 
* Load input block 
start: lw R1 R0 input * R1 = [P00=18, P01=52, P10=86, P11=120]

* Compute S00 = 4*P00 - P01 - P10
PERMUTEB R2, R1, 0xFF  * R2 = [P00, P00, P00, P00] = [18, 18, 18, 18]
UNPACKLB R3, R2, R0    * R3 = [0, 0, 0, P00] = [0, 0, 0, 18]
add R4, R3, R3         * R4 = 2*P00 = 36
add R4, R4, R3         * R4 = 3*P00 = 54
add R4, R4, R3         * R4 = 4*P00 = 72
PERMUTEB R5, R1, 0xAA  * R5 = [P01, P01, P01, P01] = [52, 52, 52, 52]
UNPACKLB R6, R5, R0    * R6 = [0, 0, 0, P01] = [0, 0, 0, 52]
sub R7, R4, R6         * R7 = 4*P00 - P01 = 72 - 52 = 20
PERMUTEB R8, R1, 0x55  * R8 = [P10, P10, P10, P10] = [86, 86, 86, 86]
UNPACKLB R9, R8, R0    * R9 = [0, 0, 0, P10] = [0, 0, 0, 86]
sub R10, R7, R9        * R10 = 20 - 86 = -66
slti R11, R10, 0       * R11 = 1 if R10 < 0
bnez R11 zero_s00      * If R10 < 0, set S00 = 0
sgti R11, R10, 255     * R11 = 1 if R10 > 255
bnez R11 max_s00       * If R10 > 255, set S00 = 255
add R20, R10, R0       * R20 = S00 = -66 (will be clipped)
beqz R0 done_s00
zero_s00: add R20, R0, R0 * R20 = S00 = 0
beqz R0 done_s00
max_s00: addi R20, R0, 255 * R20 = S00 = 255
done_s00:

* Compute S01 = 4*P01 - P00 - P11
PERMUTEB R2, R1, 0xAA  * R2 = [P01, P01, P01, P01] = [52, 52, 52, 52]
UNPACKLB R3, R2, R0    * R3 = [0, 0, 0, P01] = [0, 0, 0, 52]
add R4, R3, R3         * R4 = 2*P01 = 104
add R4, R4, R3         * R4 = 3*P01 = 156
add R4, R4, R3         * R4 = 4*P01 = 208
PERMUTEB R5, R1, 0xFF  * R5 = [P00, P00, P00, P00] = [18, 18, 18, 18]
UNPACKLB R6, R5, R0    * R6 = [0, 0, 0, P00] = [0, 0, 0, 18]
sub R7, R4, R6         * R7 = 4*P01 - P00 = 208 - 18 = 190
PERMUTEB R8, R1, 0x00  * R8 = [P11, P11, P11, P11] = [120, 120, 120, 120]
UNPACKLB R9, R8, R0    * R9 = [0, 0, 0, P11] = [0, 0, 0, 120]
sub R10, R7, R9        * R10 = 190 - 120 = 70
slti R11, R10, 0       * R11 = 1 if R10 < 0
bnez R11 zero_s01      * If R10 < 0, set S01 = 0
sgti R11, R10, 255     * R11 = 1 if R10 > 255
bnez R11 max_s01       * If R10 > 255, set S01 = 255
add R21, R10, R0       * R21 = S01 = 70
beqz R0 done_s01
zero_s01: add R21, R0, R0 * R21 = S01 = 0
beqz R0 done_s01
max_s01: addi R21, R0, 255 * R21 = S01 = 255
done_s01:

* Compute S10 = 4*P10 - P00 - P11
PERMUTEB R2, R1, 0x55  * R2 = [P10, P10, P10, P10] = [86, 86, 86, 86]
UNPACKLB R3, R2, R0    * R3 = [0, 0, 0, P10] = [0, 0, 0, 86]
add R4, R3, R3         * R4 = 2*P10 = 172
add R4, R4, R3         * R4 = 3*P10 = 258
add R4, R4, R3         * R4 = 4*P10 = 344
PERMUTEB R5, R1, 0xFF  * R5 = [P00, P00, P00, P00] = [18, 18, 18, 18]
UNPACKLB R6, R5, R0    * R6 = [0, 0, 0, P00] = [0, 0, 0, 18]
sub R7, R4, R6         * R7 = 4*P10 - P00 = 344 - 18 = 326
PERMUTEB R8, R1, 0x00  * R8 = [P11, P11, P11, P11] = [120, 120, 120, 120]
UNPACKLB R9, R8, R0    * R9 = [0, 0, 0, P11] = [0, 0, 0, 120]
sub R10, R7, R9        * R10 = 326 - 120 = 206
slti R11, R10, 0       * R11 = 1 if R10 < 0
bnez R11 zero_s10      * If R10 < 0, set S10 = 0
sgti R11, R10, 255     * R11 = 1 if R10 > 255
bnez R11 max_s10       * If R10 > 255, set S10 = 255
add R22, R10, R0       * R22 = S10 = 206
beqz R0 done_s10
zero_s10: add R22, R0, R0 * R22 = S10 = 0
beqz R0 done_s10
max_s10: addi R22, R0, 255 * R22 = S10 = 255
done_s10:

* Compute S11 = 4*P11 - P01 - P10
PERMUTEB R2, R1, 0x00  * R2 = [P11, P11, P11, P11] = [120, 120, 120, 120]
UNPACKLB R3, R2, R0    * R3 = [0, 0, 0, P11] = [0, 0, 0, 120]
add R4, R3, R3         * R4 = 2*P11 = 240
add R4, R4, R3         * R4 = 3*P11 = 360
add R4, R4, R3         * R4 = 4*P11 = 480
PERMUTEB R5, R1, 0xAA  * R5 = [P01, P01, P01, P01] = [52, 52, 52, 52]
UNPACKLB R6, R5, R0    * R6 = [0, 0, 0, P01] = [0, 0, 0, 52]
sub R7, R4, R6         * R7 = 4*P11 - P01 = 480 - 52 = 428
PERMUTEB R8, R1, 0x55  * R8 = [P10, P10, P10, P10] = [86, 86, 86, 86]
UNPACKLB R9, R8, R0    * R9 = [0, 0, 0, P10] = [0, 0, 0, 86]
sub R10, R7, R9        * R10 = 428 - 86 = 342
slti R11, R10, 0       * R11 = 1 if R10 < 0
bnez R11 zero_s11      * If R10 < 0, set S11 = 0
sgti R11, R10, 255     * R11 = 1 if R10 > 255
bnez R11 max_s11       * If R10 > 255, set S11 = 255
add R23, R10, R0       * R23 = S11 = 342 (will be clipped)
beqz R0 done_s11
zero_s11: add R23, R0, R0 * R23 = S11 = 0
beqz R0 done_s11
max_s11: addi R23, R0, 255 * R23 = S11 = 255
done_s11:

* Combine results into one 32-bit word
addi R30, R0, 0x03
PACKBYRS2 R24, R20, R30 * R24 = [S00, 0, 0, 0]
addi R30, R0, 0x02
PACKBYRS2 R25, R21, R30 * R25 = [0, S01, 0, 0]
PADDUB R24, R24, R25    * R24 = [S00, S01, 0, 0]
addi R30, R0, 0x01
PACKBYRS2 R25, R22, R30 * R25 = [0, 0, S10, 0]
PADDUB R24, R24, R25    * R24 = [S00, S01, S10, 0]
addi R30, R0, 0x00
PACKBYRS2 R25, R23, R30 * R25 = [0, 0, 0, S11]
PADDUB R24, R24, R25    * R24 = [S00, S01, S10, S11]

* Store result
sw R24 R0 output       * Store [0, 70, 206, 255] = 0x0046CEFF

halt                   * End program

* Data section 
input: dc 0x12345678   * Input = [P00=18, P01=52, P10=86, P11=120]
output: ds 1           * Space for [S00=0, S01=70, S10=206, S11=255]