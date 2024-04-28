.data
 A: .word 5, 4, -1, -3, 2, -6, -7, 8, 10, -9
 
.text
  li $s1, 0 # i = 0
  la $s2, A # load address of A into $s2
  li $s3, 10 # n = 10
  li $s4, 1 # step = 1
  li $s5, 0 # max = 0
  li $s6, 0 # pos_max = 0
  
  loop:
  bge $s1, $s3, endloop
  add $t1, $s1, $s1 # $t1 = 2*i
  add $t1, $t1, $t1 # $t1 = 4*i
  add $t1, $t1, $s2 # $t1 store the address of A[i]
  lw $t0, 0($t1) # load the value of A[i]
  slt $t8, $0, $t0 # $t8 = 0 < A[i] ? 1 : 0
  beq $t8, $0, aBs
  
  positive:
  slt $t9, $s5, $t0 # $t9 = max < A[i] ? 1 : 0
  beq $t9, $0, continue
  add $s5, $t0, $0 # max = A[i]
  add $s6, $s1, $0 #pos_max = i
  
  aBs:
  sub $t0, $0, $t0 # A[i] = 0 - A[i]
  j, positive
  
  continue:
  add $s1, $s1, $s4 # i = i + step
  j loop
  
  endloop:
