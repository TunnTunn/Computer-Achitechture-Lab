.data
 message1: .asciiz "Nhap string: "
 s: .space 1000
 endline: .ascii "\n"
 
 .text

#--------- input ---------
 li $v0, 4
 la $a0, message1
 syscall

 li $v0, 8
 la $a0, s
 li $a1, 1000
 syscall
 
 move $s0, $a0 # $s0 = s[]
 add $s1, $s0, $0 # $s1 = s_end
 li $s2, 0 # $s2 = s.length
 set_s_end:
 lb $t1, 0($s1)
 la $t2, endline
 lb $t2, 0($t2)
 addi $s2, $s2, 1
 addi $s1, $s1, 1
 bne $t1, $t2, set_s_end
 
#--------- traversal ---------
 li $t0, 0 # i = 0
 add $t8, $s0, $0 # $t8 = s[]
 loop:
 lb $t2, 0($t8) # $t2 = s[i]
 li $t1, 0 # j = 0
 add $t9, $s0, $0 # $t9 = s[]
 jal check
 addi $t0, $t0, 1 # i++
 addi $t8, $t8, 1
 bne $t2, , loop
 
 exit:
 li $v0, 10
 syscall
 
 check:
 
 lb $t3, 0($t9) # $t3 = s[j]
 beq $t0, $0, print
 beq $t2, $t3, return_loop # if(s[i] == s[j]) break
 addi $t1, $t1, 1 # j++
 addi $t9, $t9, 1
 blt $t1, $t0, check # loop while j < i
 
 print:
 li $v0, 11
 move $a0, $t2
 syscall
 
 return_loop:
 jr $ra