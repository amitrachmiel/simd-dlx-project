
* Matrix Transpose: Swap B and C in [A, B, C, D] to get [A, C, B, D]
   pc =0x0 
   start: lw R1 R0 matrix        * Load matrix: [A, B, C, D]
    lw R10 R0 mask_8       * Load mask: 0x000000FF into R10

    * Extract B (bits 23:16)
    add R2 R1 R0           * R2 = [A, B, C, D]
    addi R11 R0 16         * R11 = shift counter (16 shifts right)

 shift_b:   srli R2 R2            * Shift right by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shift_b       * Repeat until 16 shifts
    and R3 R2 R10          * R3 = [0, 0, 0, B]

    * Extract C (bits 15:8)
    add R2 R1 R0           * R2 = [A, B, C, D]
    addi R11 R0 8          * R11 = shift counter (8 shifts right)

shift_c:    srli R2 R2            * Shift right by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shift_c       * Repeat until 8 shifts
    and R4 R2 R10          * R4 = [0, 0, 0, C]

    * Build [A, C, B, D]
    lw R5 R0 mask_ad       * Load mask for A and D: [FF, 00, 00, FF]
    and R6 R1 R5           * R6 = [A, 0, 0, D] (keep A and D)

    add R7 R4 R0           * R7 = [0, 0, 0, C]
    addi R11 R0 16         * R11 = shift counter (16 shifts left)

  shift_cl:  slli R7 R7           * Shift C left by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shift_cl  * Repeat until 16 shifts
    add R6 R6 R7           * R6 = [A, C, 0, D]

    add R7 R3 R0           * R7 = [0, 0, 0, B]
    addi R11 R0 8          * R11 = shift counter (8 shifts left)

 shift_bl:   slli R7 R7            * Shift B left by 1
    addi R11 R11 -1        * Decrement counter
    bnez R11 shift_bl  * Repeat until 8 shifts
    add R6 R6 R7           * R6 = [A, C, B, D]

    * Store result
    sw R6 R0 result        * Store transposed matrix: [A, C, B, D]
    halt                   * End program

* Data section
matrix:    dc 0x12345678  * Matrix: [A=18, B=34, C=56, D=78]
mask_8:    dc 0x000000FF  * Mask for 8 bits (bits 7:0)
mask_ad:   dc 0xFF0000FF  * Mask for A and D: [FF, 00, 00, FF]
result:    ds 1           * Space for [A, C, B, D] = [18, 56, 34, 78]
