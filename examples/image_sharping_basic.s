pc=0x0
* Image Sharpening: Apply sharpening to a 2x2 block (4 pixels, 8-bit each) without extensions

start:   lw R1 R0 input         * Load input: [P00, P01, P10, P11]
    lw R10 R0 mask_8       * Load mask: 0x000000FF (8-bit mask)

    * Extract P11, P10, P01, P00 using loops efficiently
    and R5 R1 R10          * R5 = P11 (no shift needed)

    add R4 R1 R0           * R4 = [P00, P01, P10, P11]
    addi R11 R0 8          * R11 = shift counter (8 shifts right)
shiftp10:   srli R4 R4            * Shift right by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shiftp10      * Repeat until 8 shifts
    add R3 R4 R0           * R3 = [0, P00, P01, P10] (copy for next step)
    and R6 R4 R10          * R6 = P10 (extract P10 now)

    addi R11 R0 8          * R11 = shift counter (8 more shifts right)
shiftp01:   srli R3 R3            * Shift right by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shiftp01      * Repeat until 8 shifts
    add R2 R3 R0           * R2 = [0, 0, P00, P01] (copy for next step)
    and R7 R3 R10          * R7 = P01 (extract P01 now)

    addi R11 R0 8          * R11 = shift counter (8 more shifts right)
shiftp00:   srli R2 R2            * Shift right by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shiftp00      * Repeat until 8 shifts
    and R8 R2 R10          * R8 = P00 (extract P00 now)

    * Assign extracted values to registers
    add R2 R8 R0           * R2 = P00
    add R3 R7 R0           * R3 = P01
    add R4 R6 R0           * R4 = P10
    add R5 R5 R0           * R5 = P11 (already correct)

    * Compute Laplacian and Sharpening for S00 (P00 position)
    add R6 R2 R0           * R6 = P00
    add R6 R6 R2           * R6 = 2*P00
    add R6 R6 R2           * R6 = 3*P00 (center weight)
    sub R6 R6 R3           * R6 = 3*P00 - P01
    sub R6 R6 R4           * R6 = 3*P00 - P01 - P10 (Laplacian)
    add R7 R2 R6           * R7 = P00 + Laplacian
    * Clip S00 to 0-255
    slti R8 R7 0           * R8 = 1 if R7 < 0
    bnez R8 cl00min        * If R7 < 0, set to 0
    slti R8 R7 256         * R8 = 0 if R7 >= 256
    beqz R8 cl00max        * If R7 >= 256, set to 255
    beqz R0 done_s00
cl00min:    add R7 R0 R0           * R7 = 0
     beqz R0 done_s00
cl00max:    addi R7 R0 255         * R7 = 255
done_s00:   add R20 R7 R0          * R20 = S00

    * Compute Laplacian and Sharpening for S01 (P01 position)
    add R6 R3 R0           * R6 = P01
    add R6 R6 R3           * R6 = 2*P01
    add R6 R6 R3           * R6 = 3*P01 (center weight)
    sub R6 R6 R2           * R6 = 3*P01 - P00
    sub R6 R6 R5           * R6 = 3*P01 - P00 - P11 (Laplacian)
    add R7 R3 R6           * R7 = P01 + Laplacian
    * Clip S01 to 0-255
    slti R8 R7 0           * R8 = 1 if R7 < 0
    bnez R8 cl01min        * If R7 < 0, set to 0
    slti R8 R7 256         * R8 = 0 if R7 >= 256
    beqz R8 cl01max        * If R7 >= 256, set to 255
    beqz R0 done_s01
cl01min:    add R7 R0 R0           * R7 = 0
     beqz R0 done_s01
cl01max:    addi R7 R0 255         * R7 = 255
done_s01:   add R21 R7 R0          * R21 = S01

    * Compute Laplacian and Sharpening for S10 (P10 position)
    add R6 R4 R0           * R6 = P10
    add R6 R6 R4           * R6 = 2*P10
    add R6 R6 R4           * R6 = 3*P10 (center weight)
    sub R6 R6 R2           * R6 = 3*P10 - P00
    sub R6 R6 R5           * R6 = 3*P10 - P00 - P11 (Laplacian)
    add R7 R4 R6           * R7 = P10 + Laplacian
    * Clip S10 to 0-255
    slti R8 R7 0           * R8 = 1 if R7 < 0
    bnez R8 cl10min        * If R7 < 0, set to 0
    slti R8 R7 256         * R8 = 0 if R7 >= 256
    beqz R8 cl10max        * If R7 >= 256, set to 255
     beqz R0 done_s10
cl10min:    add R7 R0 R0           * R7 = 0
     beqz R0 done_s10
cl10max:    addi R7 R0 255         * R7 = 255
done_s10:   add R22 R7 R0          * R22 = S10

    * Compute Laplacian and Sharpening for S11 (P11 position)
    add R6 R5 R0           * R6 = P11
    add R6 R6 R5           * R6 = 2*P11
    add R6 R6 R5           * R6 = 3*P11 (center weight)
    sub R6 R6 R3           * R6 = 3*P11 - P01
    sub R6 R6 R4           * R6 = 3*P11 - P01 - P10 (Laplacian)
    add R7 R5 R6           * R7 = P11 + Laplacian
    * Clip S11 to 0-255
    slti R8 R7 0           * R8 = 1 if R7 < 0
    bnez R8 cl11min        * If R7 < 0, set to 0
    slti R8 R7 256         * R8 = 0 if R7 >= 256
    beqz R8 cl11max        * If R7 >= 256, set to 255
     beqz R0 done_s11
cl11min:    add R7 R0 R0           * R7 = 0
     beqz R0 done_s11
cl11max:    addi R7 R0 255         * R7 = 255
done_s11:   add R23 R7 R0          * R23 = S11

    * Combine results into one 32-bit word using loops
    add R24 R20 R0         * R24 = S00
    addi R11 R0 24         * R11 = shift counter (24 shifts left)
shifts00:   slli R24 R24          * Shift left by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shifts00      * Repeat until 24 shifts
    * R24 = [S00, 0, 0, 0]

    add R7 R21 R0          * R7 = S01
    addi R11 R0 16         * R11 = shift counter (16 shifts left)
shifts01:   slli R7 R7            * Shift left by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shifts01      * Repeat until 16 shifts
    add R24 R24 R7         * R24 = [S00, S01, 0, 0]

    add R7 R22 R0          * R7 = S10
    addi R11 R0 8          * R11 = shift counter (8 shifts left)
shifts10:   slli R7 R7            * Shift left by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shifts10      * Repeat until 8 shifts
    add R24 R24 R7         * R24 = [S00, S01, S10, 0]

    add R24 R24 R23        * R24 = [S00, S01, S10, S11] (S11 needs no shift)

    sw R24 R0 output       * Store output
    halt                   * End program

* Data section
input:   dc 0x12345678  * [P00=12, P01=34, P10=56, P11=78]
mask_8:  dc 0x000000FF  * Mask for 8 bits
output:  ds 1          * Space for [S00, S01, S10, S11]