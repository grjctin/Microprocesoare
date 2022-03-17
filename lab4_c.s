.data
.text
.globl main
main:
	geti $t0  #citim n
	div $t8,$t0,2   #t8=n/2
	addi $t8,$t8,1
	#puti $t8
	li $t1,1  #suma divizorilor
	li $t2,1  #contor
for:
	addi $t2,$t2,1
	div $t0,$t2
	mfhi $t3
	beq $t8,$t2 sfarsit1 	#daca contorul=n/2 iesi
	bnez $t3,for
	add $t1,$t1,$t2
	j for
sfarsit1:
	bne $t0,$t1,sfarsit2
	putc 'd'  #afiseaza mesaj da
	putc 'a'
	j sfarsit3
sfarsit2:
	putc 'n'
	putc 'u'
sfarsit3:
	done
	