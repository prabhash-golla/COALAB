## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy
## Registers Used :
## $t0 for storing num
## $t1 for storing present prime number
## $t2 for storing 1
## $t3 for storing num % k
.text
main:
	la $a0 , num_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
	li $v0 , 5 # loads read int syscall command
	syscall # makes a system call
	move $t0 , $v0 # store the value in $t0
	li $t1 , 2 # initialize t1 with 2
	li $t2 , 1 
	la $a0 , ans_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
for2:
	rem $t3,$t0,$t1 # load the remainder , num % k into $t3
	bnez $t3,remaining

	move $a0 , $t1 # loads address of entering number msg in $a0
	li $v0 , 1 # loads print string syscall command
	syscall # makes a system call

	la $a0 , space_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call

	div $t0,$t1
	mflo $t0
	b for2
remaining:
	addi $t1,$t1,1
	b for_odd
remaining2:
	addi $t1,$t1,2
	b for_odd
for_odd:
	beq $t0,$t2,exit
	rem $t3,$t0,$t1 # load the remainder , num % k into $t3
	bnez $t3,remaining2

	move $a0 , $t1 # loads address of entering number msg in $a0
	li $v0 , 1 # loads print string syscall command
	syscall # makes a system call

	la $a0 , space_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call

	div $t0,$t1
	mflo $t0
	b for_odd

exit: #### exit the program ####
	la $a0 , endline_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call

	li $v0 , 10 # load exit command into $v0
	syscall # makes a system call
.data ##### data for storing strings ######
num_msg: .asciiz "Enter a positive Integer\n"
ans_msg: .asciiz "The Prime factorization is : \n"
space_msg: .asciiz " "
endline_msg: .asciiz "\n"