## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy
## Registers Used :
## $t0 for storing array pointer
## $t1 for storing array size
## $t2 for storing k
## $t3 for storing outer loop iterator
## $t4 for storing inner loop iterator
## $t3 for storing outer loop iterator
.text
main:
	la $t0,array
	lw $t1,size
	lw $t2,k
	li $t3,0

loop1:
	bge $t3,$t1,exit
	li $t4,0
	sub $t5,$t1,$t3

loop2:
	addi $t6,$t5,-1
	bge $t4,$t6,increment
	sll $t7,$t4,2
	add $t8,$t0,$t7
	lw $t9,0($t8)
	lw $a1,4($t8)
	bge $t9,$a1,ns
	sw $a1,0($t8)
	sw $t9,4($t8)

ns :
	addi $t4,$t4,1
	j loop2

increment:
	addi $t3,$t3,1
	j loop1

exit: #### exit the program ####
	addi $t2,$t2,-1
	sll $t7,$t2,2
	add $t8,$t0,$t7
	lw $t9,0($t8)
	lw $t2,k
	sub $t6,$t1,$t2
	sll $t7,$t6,2
	add $t8,$t0,$t7
	lw $a1,0($t8)

	la $a0 , ans_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
	
	move $a0 , $t9 # loads address of entering number msg in $a0
	li $v0 , 1 # loads print integer syscall command
	syscall # makes a system call

	la $a0 , rem_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
	
	move $a0 , $a1 # loads address of entering number msg in $a0
	li $v0 , 1 # loads print integer syscall command
	syscall # makes a system call

	li $v0 , 10 # load exit command into $v0
	syscall # makes a system call


.data ##### data for storing strings ######
array: .word 91,65,5,8,1046,400,-3,2,78
size: .word 9
k: .word 1
num_msg: .asciiz "Enter a Positive Integer : "
ans_msg: .asciiz "The kth largest elment  is : "
rem_msg: .asciiz "\nThe kth smallest elemt  is : "