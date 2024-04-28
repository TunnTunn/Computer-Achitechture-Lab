.data
string: .space 20
mess1: .asciiz "Get char number "
mess2: .asciiz ": "
mess3: .asciiz "The reversed string is: "
endline: .asciiz "\n"

.text
li $s0, 0 # i = 0
li $s1, 20 # maximum chars
li $s2, 10 # char "\n"
la $s3, string # address of string[0]

read_char:
	beq $s0, $s1, end_read_char # if i = 20, exit
	# Print "Get char number "
	li $v0, 4
	la $a0, mess1
	syscall 
	
	# Print i
	li $v0, 1
	addi $t1, $s0, 1
	move $a0, $t1
	syscall
	
	# Print ": "
	li $v0, 4
	la $a0, mess2
	syscall
	
	# Read char
	li $v0, 12 # $v0 is storing the input char
	syscall
	move $t1, $v0 # move to $t1
	beq $v0, $s2, end_read_char # if char = "\n", exit
	
	# Print "\n"
	li $v0, 4
	la $a0, endline
	syscall
	
	# Store char in string[i]
	add $t0, $s3, $s0 # $t0 = *string[i] = $s3 + $s0 = *string[0] +i
	sb $t1, 0($t0)# store the input char at *string[i]
	addi $s0, $s0, 1 # i = i + 1
	j read_char
end_read_char:

# Print "The reversed string is: "
li $v0, 4
la $a0, mess3
syscall

# Print string: for(n->0)
print_string:
	li $v0, 11
	lb $a0, 0($t0)
	syscall
	beq $t0, $s3, end_print_string
	subi $t0, $t0, 1
	j print_string
end_print_string:

# Exit
li $v0, 10
syscall