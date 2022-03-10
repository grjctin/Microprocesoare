.data
	
.text
.globl main
main:
	geti $t9   #citim n
	li $t1,2   
	puti $t1   #afisam 2
	addi $t9,$t9,-1
next_number:
	addi $t1,$t1,1
	li $t0,2     #divizorii pe care ii verific
	div $t1,$t0  
	mflo $t2	     #$t2 = jumatatea nrului pe care il verific
next_div:
	div $t1,$t0
	mfhi $t3
	beqz $t3,next_number   #daca restul e 0 treci la urm numar de verificat
	addi $t0,$t0,1
	blt $t0,$t2,next_div    
	puti $t1
	addi $t9, $t9, -1     #decrementam n
	bgtz $t9,next_number
	done
	