# 20226096_OnQuangTung_A15
.data
	string_inputM: .asciiz "Nhap vao so M: "
	string_inputN: .asciiz "Nhap vao so N: "
	string_inputQ: .asciiz "Nhap vao so Q: "
	space: .asciiz " "
	
.text

 inputM:
	li $v0, 4
	la $a0, string_inputM
	syscall
	li $v0, 5
	syscall
	bltz $v0, inputM # if M < 0 -> re-input M
	move $s0, $v0 # $s0 = M
	
 inputN:
	li $v0, 4
	la $a0, string_inputN
	syscall
	li $v0, 5
	syscall
	bltz $v0, inputN # if N < 0 -> re-input N
	move $s1, $v0 # $s1 = N
	blt $s1, $s0, inputN # if N < M -> re-input N
	mul $s3, $s0, $s1 # $s3 = M*N
	
 inputQ:
	li $v0, 4
	la $a0, string_inputQ
	syscall
	li $v0, 5
	syscall
	move $s2, $v0 # $s2 = Q
	blt $s2, $s3, inputQ # if Q < M*N -> re-inputQ
	li $t5, 0 # initialize the number of divisor = 0

 move $t0, $s0 # initialize i = M
 loop:
 	div $s2, $t0
 	mfhi $t1 # $t1 = Q%i
 	jal check
 	addi $t0, $t0, 1
 	ble $t0, $s1, loop # loop while i <= N
	
 end: 
 	beqz $t5, no_ans # if there's no divisor -> print -1
	li $v0, 10
	syscall
	
 check:
 	bne $t1, $0, return
 	li $v0, 1
 	move $a0, $t0 # print i
 	syscall
 	li $v0, 4
 	la $a0, space # print " "
 	syscall
 	addi $t5, $t5, 1 # update the number of divisor
 	
 return: jr $ra
 	
no_ans: 
	li $v0, 1
	li $a0, -1
	syscall