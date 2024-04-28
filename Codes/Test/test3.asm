.data
 A: .space 1000
 
.text
 li $v0, 5
 syscall
 move $s0, $v0 # $s0 = n
 
 la $s1, A # $s1 = A[]
 li $t0, 0
 loop_cin:
 li $v0, 5
 syscall
 sw $v0, 0($s1)
 addi $s1, $s1, 4
 addi $t0, $t0, 1
 blt $t0, $s0, loop_cin
 
 #-------- Get M --------
 li $v0, 5
 syscall
 move $s2, $v0 # $s2 = M
 
 #-------- Get N --------
 li $v0, 5
 syscall
 move $s3, $v0 # $s3 = N
 
 #-------- Traversal --------
 li $t0, 0 # i = 0
 la $s1 ,A # $s1 = A[]
 li $s7, 0 # $s7 = result
 loop:
 lw $t8, 0($s1) # $t8 = a[i]
 add $t1, $s2, $0 # j = M
 jal check
 addi $s1, $s1, 4
 addi $t0, $t0, 1
 blt $t0, $s0, loop
 
 exit:
 li $v0, 10
 syscall
 
 #-------- Check and update --------
 update:
 addi $s7, $s7, 1
 j return_main
 
 check:
 beq $t8, $t1, update # update if a[i] = j
 addi $t1, $t1, 1
 ble $t1, $s3, check # loop while j <= N
 
 return_main: jr $ra 