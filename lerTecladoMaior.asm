#Fa�a um programa em assembly que leia dois n�meros do usu�rio via teclado (e armazene nos respecitvos registradores \$t0, \$t1,
#em seguida fa�a um teste e imprima uma mensagem dizendo qual dos dois n�meros � maior: �\$t0$>$\$t1�, �\$t1$>$\$t0� ou �\$t1 = = \$t0�
	.data
pergunta: .asciiz "Informe um valor inteiro: " 
msg1:	.asciiz "A � maior que C"
msg2:	.asciiz "C � maior que A"
msg3: 	.asciiz "A � igual a C"
	.text
	.globl inicio
inicio:
	jal le_inteiro_do_teclado  # chama fun��o para ler
	#la  $t0, 0($v0)		   # carrega o inteiro lido em $t7
	#jal le_inteiro_do_teclado  # chama fun��o para ler
	#la  $t1, 0($v1)	
	j chama
	
	
le_inteiro_do_teclado:
	li $v0, 4
	la $a0, pergunta
	syscall
	li $v0, 5
	syscall
	add $t2, $zero, $v0
	li $v0, 5
	syscall
	add $t3, $zero, $v0
	j voltar
voltar: 
	jr $ra	
	
chama:
	
	ble $t2, $t3, Amaior #Maior
	la $a0, msg1
	li $v0, 4
	syscall
	#jr $ra
	
Amaior:
	ble $t3, $t2,  Bmaior#Maior
	la $a0, msg2
	li $v0, 4
    	syscall
    	#jr $ra
    	
Bmaior:
	bne $t2, $t3, encerra
	la $a0, msg3
	li $v0, 4
    	syscall
    	#jr $ra
encerra:
	
