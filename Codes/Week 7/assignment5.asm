# #Laboratory Exercise 7, Assignment 5

.data
 largest: .asciiz "Largest: "
 smallest: .asciiz "\nSmallest: "
 comma: .asciiz ","
 
.text
main:
# 3 5 8 6 1 7 2 4
 li $s0, 3
 li $s1, 5
 li $s2, 8
 li $s3, 6
 li $s4, 1
 li $s5, 7
 li $s6, 2
 li $s7, 4
 
 jal save
 nop
 print:
 # Print message largest
 li $v0, 4
 la $a0, largest
 syscall
 
 # Print max - $t1 = max
 li $v0, 1
 move $a0, $t1
 syscall
 
 # Print message Comma 
 li $v0, 4  
 la $a0, comma 
 syscall 
 
 # Print max index - $t5 = max index
 li $v0, 1
 move $a0, $t5
 syscall
 
 # Print message smallest
 li $v0, 4
 la $a0, smallest
 syscall
 
 # Print max - $t2 = min
 li $v0, 1
 move $a0, $t2
 syscall
 
 # Print message Comma 
 li $v0, 4  
 la $a0, comma 
 syscall 
 
 # Print min index - $t6 = min index
 li $v0, 1
 move $a0, $t6
 syscall
 
end_main:
 li $v0, 10 
 syscall
 
save:
 move $t9, $sp # save the address of the top stack - $t9 = address of top stack
 addi $sp, $sp, -32 # get 32 bytes
 sw $ra, 0($sp) # address to return to main
 sw $s1, 4($sp) 
 sw $s2, 8($sp) 
 sw $s3, 12($sp) 
 sw $s4, 16($sp) 
 sw $s5, 20($sp) 
 sw $s6, 24($sp) 
 sw $s7, 28($sp) 
 
 add $t1, $s0, $0 # $t1 = max = $s0
 add $t2, $s0, $0 # $t2 = min = $s0
 li $t5, 0 # $t5 = max index = 0
 li $t6, 0 # $t6 = max index = 0
 li $t0, 0 # $t0 = i = 0
 
# 3 5 8 6 1 7 2 4
find:
 addi $sp, $sp, 4
 beq $sp, $t9, end_find # if $sp = top stack, jump to end_find
 nop
 lw $t3, 0($sp) # load the current value
 sub $t8, $t1, $t3 # $t8 = max - current value
 bltzal $t8, swap_max # if max - current value <= 0, then jump to swap_max
 nop
 sub $t8, $t3, $t2 # $t8 = current value - min
 bltzal $t8, swap_min # if current value - min <= 0, then jump to swap_min
 nop
 addi $t0, $t0, 1
 j find #loop
 nop
end_find:
 lw $ra -32($sp) 
 jr $ra
 
# 3 5 8 6 1 7 2 4
 swap_max:
 move $t1, $t3 # $t1 = current $sp
 move $t5, $t0 # $t5 = current index
 jr $ra # return to find
 
# 3 5 8 6 1 7 2 4
 swap_min:
 move $t2, $t3 # $t1 = current $sp
 move $t6, $t0 # $t6 = current index
 jr $ra # return to find