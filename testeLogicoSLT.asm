#Fa�a um programa em assembly que leia dois n�mero do usu�rio via teclado (e armazene nos respecitvos registradores \$t0, \$t1), 
#em seguida fa�ca um teste e armazene no registrador \$t2 o resultado do teste l�gico, de forma que \$t2 ter� o valor 1 se 
#\$t0$>$\$t1 e \$t2 ter� o valor 0 se \$t1$\geq$\$t0.

	.data
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