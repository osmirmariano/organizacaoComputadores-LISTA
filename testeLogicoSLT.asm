#Faça um programa em assembly que leia dois número do usuário via teclado (e armazene nos respecitvos registradores \$t0, \$t1), 
#em seguida fa¸ca um teste e armazene no registrador \$t2 o resultado do teste lógico, de forma que \$t2 terá o valor 1 se 
#\$t0$>$\$t1 e \$t2 terá o valor 0 se \$t1$\geq$\$t0.

	.data
pergunta: .asciiz "Informe um valor inteiro: " 
	.text
	.globl inicio
inicio:
	jal le_inteiro_do_teclado  # chama função para ler	
	j chama
	
	
le_inteiro_do_teclado:
	li $v0, 4
	la $a0, pergunta
	syscall
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	li $v0, 5
	syscall
	add $t1, $zero, $v0
	j voltar
voltar: 
	jr $ra	
chama:
	ble $t0, $t1, nMaior#ver ainda o voltar
	add $t2, $zero, 1
nMaior:
	ble $t1, $t0, encerra
	add $t2, $zero, $zero
encerra: