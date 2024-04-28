#Laboratory Exercise 3, Home Assignment 1 
.data 
	i: .word 6
	j: .word 7
	
.text
la $t8, i
la $t9, j
lw $s1, 0($t8) # i=4
lw $s2, 0($t9) # j=3
addi $t1, $0, 10 # x=10
addi $t2, $0, 10 # y=10
addi $t3, $0, 10 # z=10
addi $t4, $0, 5 # m = 5
addi $t5, $0, 6 # n = 6
add $t6, $t4, $t5 # m+n = 5+6
add $t7, $s1, $s2 # t?ng c?a i và j

start: 
slt $t0, $t6, $t7 # 0 m+n< i+j
bne $t0, $zero, else # branch to else if m+n >= i+j
# ki?m tra xem j($s2) < i($s1), n?u không gán $t0=0
# n?u $t0 khác 0 r? sang else
addi $t1, $t1, 1 # then part: x=x+1 
addi $t3, $zero, 1 # z=1 
j endif # skip “else” part 
else: addi $t2, $t2,-1 # begin else part: y=y-1 
add $t3, $t3, $t3 # z=2*z 
endif:
