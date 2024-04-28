# 20226096_OnQuangTung_C6
.data
 s: .space 100
 message1: .asciiz "Nhap string: "
 message2: .asciiz "Nhap char: "
 message3: .asciiz "\nSo lan suat hien cua no la: "
 endline: .ascii "\n"

.text

#--------- input ---------
 li $v0, 4
 la $a0, message1 # Nhap string
 syscall
 li $v0, 8
 la $a0, s
 li $a1, 1000
 syscall
 # Change uppercase to lowercase
 la $s0, s
 la $t7, endline
 lb $t7, 0($t7)
 UtoL:
 lb $t2, 0($s0) # $t2 = s[i]
 beq $t2, $t7, end_UtoL # end loop if s[i] == "\n"
 andi $t2, $t2, 0xFFDF # Change uppercase to lowercase
 sb $t2, 0($s0)
 addi $s0, $s0, 1 # next char
 j UtoL
 end_UtoL:
 
 li $v0, 4
 la $a0, message2 # Nhap char
 syscall
 
 li $v0, 12
 syscall
 andi $s2, $v0, 0xFFDF # Change uppercase to lowercase and store at $s2
 		       # 0xFFDF = 1111111111011111    	
                       # <-> +32 Ascii

 
 #--------- traversal ---------
 li $s7, 0 # result
 la $s0, s
 la $t7, endline
 lb $t7, 0($t7)
 loop:
 lb $t2, 0($s0) # $t2 = s[i]
 beq $t2, $t7, endloop # end loop if s[i] == "\n"
 jal check
 addi $s0, $s0, 1 # next char
 j loop
 endloop: 
 
 print:
 li $v0, 4
 la $a0, message3
 syscall
 li $v0, 1
 move $a0, $s7 # print result
 syscall
 
 exit:
 li $v0, 10
 syscall
 
 check:
 beq $t2, $s2, update # update if current char = input char
 j return
 
 update:
 addi $s7, $s7, 1
 
 return: 
 jr $ra