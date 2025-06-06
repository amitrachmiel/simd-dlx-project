pc=0x0
 start: lw R1 R0 matrix
  PERMUTEB R2, R1, 0xD8  
  sw R2 R0 result   
  halt              
    *Data section 
 matrix: dc 0x12345678 * Matrix: [12, 34, 56, 78] 
 result: ds 1 * Space for [12, 56, 34, 78]