# 20226096_OnQuangTung_B2
.data
 A: .space 1000
 n_input: .asciiz "Nhap n: "
 space: .asciiz " "
 res: .asciiz "Cap phan tu lien ke co tich lon nhat la: "

.text
 li $v0, 4
 la $a0, n_input
 syscall
 
 li $v0, 5 # get n
 syscall
 move $s0, $v0 # $s0 = n
 
 la $s1, A # A[] = $s1
 li $t0, 0 # i = 0
 loop_cin: #for(int i =0; i<n; i++) cin>>a[i]
 	li $v0, 5
 	syscall
 	sw $v0, 0($s1) 
 	addi $t0, $t0, 1
 	addi $s1, $s1, 4
 	blt $t0, $s0, loop_cin
 
 
 la $s1, A # A[] = $s1
 lw $t2, 0($s1) # $t2 = A[i-1]
 addi $s1, $s1, 4
 lw $t3, 0($s1) # $t3 = A[i+1]
 li $t0, 1 # i = 1
 li $s7, -999999 # $s7 = max_mul
 loop:
 	mul $t1, $t2, $t3 # $t1 = A[i-1] * A[i] (no overflow)
 	jal check
 	addi $t0, $t0, 1
 	lw $t2, 0($s1) # $t2 = A[i-1]
 	addi $s1, $s1, 4
 	lw $t3, 0($s1) # $t3 = A[i+1]
 	blt $t0, $s0, loop
 
 print:
 li $v0, 4
 la $a0, res
 syscall
 li $v0, 1
 move $a0, $s2 # print A[i-1]
 syscall
 li $v0, 4
 la $a0, space
 syscall
 li $v0, 1
 move $a0, $s3 # print A[i-1]
 syscall
 
 exit:
 li $v0, 10
 syscall
 
 check:
 blt $t1, $s7, return # if A[i-1] * A[i] < max_mul -> return 
 move $s7, $t1 # update max_mul
 move $s2, $t2 # $s2 = A[i-1] with current largest mul
 move $s3, $t3 # $s3 = A[i] with current largest mul
 
 return: jr $ra