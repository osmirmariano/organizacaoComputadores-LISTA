		.data
msg1:	.asciiz "A é maior que C"
msg2:	.asciiz "C é maior que A"
msg3: 	.asciiz "A é igual a C"

a: 	.word 2
c: 	.word 2
	
	.text
	lw $a0, a
	lw $a1, c
	li $v0, 1
	blt $a0, $a1, menor #Menor
	bgt $a0, $a1, maior #Maior
	beq $a0, $a1, iguais #Iguais
menor:
	la $a0, msg2
	li $v0, 4
    	syscall
    	jr $ra
maior:
	la $a0, msg1
	li $v0, 4
    	syscall
    	jr $ra
iguais:
	la $t0, msg3
	li $v0, 4
    	syscall
    	jr $ra
	
	
#	lw $a0, x
#	li $v0, 1
#	syscall
#	la $a0, msg
#	li $v0, 4 
#	syscall
#	jr $ra