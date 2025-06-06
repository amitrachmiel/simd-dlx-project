* Block Matching: Compute SAD for a 2x2 block (4 pixels of 8-bit each)	

    

   pc =0x0
    start: lw R1 R0 curr_blo    * Load current block: [P3, P2, P1, P0]
    lw R2 R0 ref_blo     * Load reference block: [REF3, REF2, REF1, REF0]
    lw R10 R0 mask         * Load mask: 0x000000FF into R10
    add R3 R0 R0           * R3 = SAD accumulator (initialize to 0)
    addi R4 R0 4           * R4 = loop counter for 4 pixels (3 down to 0)


    * Extract current pixel (8-bit) starting from P0
  pix_loop:  and R5 R1 R10          * R5 = P0 (mask lowest 8 bits with R10 = 0xFF)
    * Extract reference pixel (8-bit) from R2
    and R6 R2 R10          * R6 = REF0
    * Compute absolute difference
    sub R7 R5 R6           * R7 = P0 - REF0
    slti R8 R7 0           * R8 = 1 if R7 < 0, else 0
    beqz R8 skip_neg       * If R7 >= 0, skip negation
    sub R7 R0 R7           * R7 = |P0 - REF0| (negate if negative)

  skip_neg:  add R3 R3 R7           * Add to SAD accumulator
    * Shift both blocks right by 8 bits using a shift loop
    addi R9 R0 8           * R9 = shift counter (8 shifts)


   shift: srli R1 R1            * Shift R1 right by 1 bit
    srli R2 R2            * Shift R2 right by 1 bit
    addi R9 R9 -1          * Decrement shift counter
    bnez R9 shift          * Repeat until 8 shifts are done
    * after the loop of shift R1 has [0, P3, P2, P1], R2 has [0, REF3, REF2, REF1]

    * Decrement pixel counter and loop
    addi R4 R4 -1          * R4 = R4 - 1
    bnez R4 pix_loop     * If R4 != 0, process next pixel

    sw R3 R0 sad_res    * Store final SAD result
    halt                   * End programx

curr_blo: dc 0x04134930  * Current block: [18, 34, 56, 78]
ref_blo:  dc 0x11223344  * Reference block: [17, 34, 51, 68]
mask:       dc 0x000000FF  * Mask to extract 8 bits
sad_res: ds 1         * Space for SAD result