.data
.text
.globl main
main:
citiren:
	geti $a0   #citim n
	bltz $a0,citiren
	move $t4,$a0   #salvam n
citirek:
	geti $t8    #citim k
	bltz $t8,citirek
	blt $a0,$t8,citirek
	
	li $t0,1   #t0 = n!
	jal factorial 
	move $t1,$t0   #t1=n!
	
	li $t0,1
	move $a0,$t8   
	jal factorial
	move $t2,$t0   #t2=k!
	
	li $t0,1
	sub $a0,$t4,$t8   #a0 = n-k
	jal factorial
	move $t3,$t0   #t3 = (n-k)!
	
	mul $t5,$t3,$t2   #t5 = k!(n-k)!
	div $t5,$t1,$t5   #t5 = Ckn
	puti $t5
	done
	
factorial:
	beqz $a0, finalfact
multiply:
	mul $t0,$t0,$a0    
	addi $a0,$a0,-1    
	bgtz $a0,multiply
finalfact:
	jr $ra   #t0 = n!
	
	