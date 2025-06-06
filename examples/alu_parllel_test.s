pc=0x0 
 * Load input registers
 start: lw R1 R0 input1 * R1 = 0x12345678
 lw R2 R0 input2 * R2 = 0x11223344
* I-Type Instructions (Immediate-based)
PSLLBI  R3, R1, 2   * Shift left bytes by 2
sw R3 R0 result0
PSLLHI  R3, R1, 3   * Shift left half-words by 3
sw R3 R0 result1
PSRLBI  R3, R1, 2   * Shift right logical bytes by 2
sw R3 R0 result2
PSRLHI  R3, R1, 3   * Shift right logical half-words by 3
sw R3 R0 result3
PERMUTEB R3, R1, 0xE4 * Permute bytes (imm = 11100100: [31:24, 15:8, 7:0, 23:16])
sw R3 R0 result4
PERMUTEH R3, R1, 0x03 * Permute half-words (imm = 11: swap half-words)
sw R3 R0 result5

* R-Type Instructions: Arithmetic
PADDUB  R3, R1, R2  * Add bytes with saturation
sw R3 R0 result6
PADDH   R3, R1, R2  * Add half-words with saturation
sw R3 R0 result7
PSUBUB  R3, R1, R2  * Subtract bytes with saturation
sw R3 R0 result8
PSUBUH  R3, R1, R2  * Subtract half-words with saturation
sw R3 R0 result9
PSLLB   R3, R1, R2  * Shift left bytes by R2[3:0]
sw R3 R0 result10
PSLLH   R3, R1, R2  * Shift left half-words by R2[4:0]
sw R3 R0 result11
PSRLB   R3, R1, R2  * Shift right logical bytes by R2[3:0]
sw R3 R0 result12
PSRLH   R3, R1, R2  * Shift right logical half-words by R2[4:0]
sw R3 R0 result13
PSRAH   R3, R1, R2  * Shift right arithmetic half-words by R2[4:0]
sw R3 R0 result14

* R-Type Instructions: Compare
PCMPEQB R3, R1, R2  * Compare equal bytes
sw R3 R0 result15
PCMPGTB R3, R1, R2  * Compare greater than bytes
sw R3 R0 result16
PCMPLEB R3, R1, R2  * Compare less than or equal bytes
sw R3 R0 result17
PCMPEQH R3, R1, R2  * Compare equal half-words
sw R3 R0 result18
PCMPGTH R3, R1, R2  * Compare greater than half-words
sw R3 R0 result19
PCMPLEH R3, R1, R2  * Compare less than or equal half-words
sw R3 R0 result20

* R-Type Instructions: Permutation and Mixing
MIXL    R3, R1, R2  * Mix left
sw R3 R0 result21
MIXR    R3, R1, R2  * Mix right
sw R3 R0 result22
PACKHH  R3, R1, R2  * Pack high half-words
sw R3 R0 result23
PACKLH  R3, R1, R2  * Pack low half-words
sw R3 R0 result24
UNPACKH R3, R1, R0  * Unpack high half-word (zero-extended)
sw R3 R0 result25
UNPACKSH R3, R1, R0 * Unpack high half-word (sign-extended)
sw R3 R0 result26
UNPACKLB R3, R1, R0 * Unpack low byte (zero-extended)
sw R3 R0 result27
UNPACKSLB R3, R1, R0 * Unpack low byte (sign-extended)
sw R3 R0 result28
UNPACKHB R3, R1, R0 * Unpack high byte (zero-extended)
sw R3 R0 result29
UNPACKSHB R3, R1, R0 * Unpack high byte (sign-extended)
sw R3 R0 result30

* R-Type Instructions: Bitwise
PORB    R3, R1, R2  * OR bytes
sw R3 R0 result31
PANDB   R3, R1, R2  * AND bytes
sw R3 R0 result32
PXORB   R3, R1, R2  * XOR bytes
sw R3 R0 result33
PORH    R3, R1, R2  * OR half-words
sw R3 R0 result34
PANDH   R3, R1, R2  * AND half-words
sw R3 R0 result35
PXORH   R3, R1, R2  * XOR half-words
sw R3 R0 result36

* R-Type Instructions: Absolute Subtract
PABSUBB R3, R1, R2  * Absolute subtract bytes
sw R3 R0 result37
PABSUBH R3, R1, R2  * Absolute subtract half-words
sw R3 R0 result38

halt                * End program

*Data section
 input1: dc 0x12345678 * Input 1: [18, 52, 86, 120] 
input2: dc 0x0472FB61 * Input 2: [, 34, 51, 68]
 result0: ds 1 * Result for PSLLBI
 result1: ds 1 * Result for PSLLHI 
result2: ds 1 * Result for PSRLBI
 result3: ds 1 * Result for PSRLHI
 result4: ds 1 * Result for PERMUTEB 
result5: ds 1 * Result for PERMUTEH
 result6: ds 1 * Result for PADDUB
 result7: ds 1 * Result for PADDH 
result8: ds 1 * Result for PSUBUB 
result9: ds 1 * Result for PSUBUH
 result10: ds 1 * Result for PSLLB
 result11: ds 1 * Result for PSLLH
 result12: ds 1 * Result for PSRLB 
result13: ds 1 * Result for PSRLH
 result14: ds 1 * Result for PSRAH
 result15: ds 1 * Result for PCMPEQB 
result16: ds 1 * Result for PCMPGTB 
result17: ds 1 * Result for PCMPLEB 
result18: ds 1 * Result for PCMPEQH 
result19: ds 1 * Result for PCMPGTH 
result20: ds 1 * Result for PCMPLEH
 result21: ds 1 * Result for MIXL
 result22: ds 1 * Result for MIXR 
result23: ds 1 * Result for PACKHH 
result24: ds 1 * Result for PACKLH 
result25: ds 1 * Result for UNPACKH 
result26: ds 1 * Result for UNPACKSH 
result27: ds 1 * Result for UNPACKLB 
result28: ds 1 * Result for UNPACKSLB
 result29: ds 1 * Result for UNPACKHB
 result30: ds 1 * Result for UNPACKSHB 
result31: ds 1 * Result for PORB 
result32: ds 1 * Result for PANDB 
result33: ds 1 * Result for PXORB
 result34: ds 1 * Result for PORH
 result35: ds 1 * Result for PANDH 
result36: ds 1 * Result for PXORH 
result37: ds 1 * Result for PABSUBB 
result38: ds 1 * Result for PABSUBH