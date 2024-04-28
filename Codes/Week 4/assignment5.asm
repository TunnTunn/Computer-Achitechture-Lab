.text 
li $s0, 6 # a = 6
li $s1, 2 # b = 8
andi $t1, $s1, 0xffffffff # tmp = 8
li $t2, 1 # value 1
andi $s2, $s0, 0xffffffff # res = $s0

loop:
beq  $t1, $t2, endloop # endloop if tmp = 1
srl $t1, $t1, 1 # temp/=2
sll $s2, $s2, 1 # res*=2
j loop
endloop: