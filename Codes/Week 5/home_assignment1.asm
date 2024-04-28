#Laboratory Exercise 5, Home Assignment 1
.data
str1: .asciiz "The sum of "
str2: .asciiz " and "
str3: .asciiz " is "

.text
 li $s0, 1
 li $s1, 2
 add $s2, $s0, $s1
 
 #Print s1 = "The sum of "
 li $v0, 4 
 la $a0, str1
 syscall
 
 #Print $s0
 li $v0, 1
 move $a0, $s0 
 syscall
 
 #Print s2 = " and "
 li $v0, 4 
 la $a0, str2
 syscall
 
 #Print $s1
 li $v0, 1
 move $a0, $s1  
 syscall
 
 #Print s3 = " is "
 li $v0, 4 
 la $a0, str3
 syscall
 
 #Print $s2
 li $v0, 1
 move $a0, $s2  
 syscall
 
 Exit: li $v0, 10 
 syscall
