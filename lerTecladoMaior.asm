	.data
msg1:	.asciiz "A é maior que C"
msg2:	.asciiz "C é maior que A"
msg3: 	.asciiz "A é igual a C"
	.text
	.globl inicio
inicio:
	jal le_inteiro_do_teclado  # chama função para ler
	la  $t0, 0($v0)		   # carrega o inteiro lido em $t7
	#jal le_inteiro_do_teclado  # chama função para ler
	la  $t1, 0($v1)	
	jal chama
	
	
le_inteiro_do_teclado:
	li $v0, 5
	li $v1, 5	# código para ler um inteiro
	syscall		# executa a chamada do SO para ler
	jr $ra		# volta para o lugar de onde foi chamado (no caso, jal le_inteiro_do_teclado)
	
chama:
	li $v0, 1
	la $a0, ($t0)
	la $a1, ($t1)
	
	ble $a0, $a1, Amaior #Maior
	la $a0, msg1
	li $v0, 4
	syscall
	jr $ra
	
Amaior:
	ble $a1, $a0,  Bmaior#Maior
	la $a0, msg2
	li $v0, 4
    	syscall
    	jr $ra
    	
Bmaior:
	la $a0, msg3
	li $v0, 4
    	syscall
    	jr $ra
    		
	