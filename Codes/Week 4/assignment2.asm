.text
 li $s0, 0x12345678
 andi $t0, $s0, 0xff000000 #mask to extract MSB
 srl $t0, $t0, 24 #shift right 24 bits
 andi $t1, $s0, 0xffffff00 #Clear LSB
 ori $t2, $s0, 0x000000ff #LSB of $s0 turns into bits of 1
 andi $t3, $s0, 0