#Fazer um programa leia um vetor, mostre todos os n�meros pares desse vetor, depois mostre todos
#os n�meros �mpares e diga se no vetor h� mais n�meros pares ou n�meros �mpares.
	.data
vetor:  .word 0,1,2,3,4,5,6,7,8,9
	.text
	la $s0, 0 	#Indice do vetor[x]
	li $t0, 0	#Inicializa contador com 0
	li $t1, 10 	#Inicializa contador com 10
loop:
	lw $t2, vetor($s0) #carregando valor da mem�ria vetor[x]
	div $t0, $t0, $t2
	mul $t3, $t0, $t2
	beq $t3, $zero, nPar
	li $v0, 4
	syscall
	
	addi $s0, $s0, 4 #Incrementando s0 mais 4 bytes
	addi $t1, $t1, -1 #decrementando o ind�ce
	bne $t1, $zero, loop #Condi��o para continuar
nPar:
	mul $t3, $t0, $t2
	beq $t3, $zero, label
	li $v0, 4
	syscall
	jr $ra
label:
	