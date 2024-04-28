.text
li $s1, 0x7fffffff 
li $s2, 1

START:
li $t0, 0 #default status: No OVERFLOW
addu $s3, $s1, $s2 # $s3 = $s1 + $s2

xor $t1, $s1, $s2 #Test if $s1 and $s2 have the same sign
bltz $t1, EXIT #If not, exit

xor $t2, $s1, $s3 #Test if $s1 and $s3 have the same sign
bgtz $t2, EXIT #If yes, EXIT

OVERFLOW:
li $t0,1 #the result is overflow

EXIT: