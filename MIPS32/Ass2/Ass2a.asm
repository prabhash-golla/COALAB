## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy
## Registers Used :
## $t0 for storing num
## $t1 for storing 256
## $t2 for storing the Quotient
## $t3 for storing the Reminder
.text
main:
	la $a0 , num_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
	li $v0 , 5 # loads read int syscall command
	syscall # makes a system call
	li $t1,256 # load 256 to t1
	li $t2,0 # load 0 to t12
	move $t0 , $v0 # store the value in $t0

loop:
	blt $t0,255,exit #check if the numeber is less than 255
	srl $t4,$t0,8  #shift right by 8 bits
	add $t2,$t2,$t4 #Quotient at present iteration
	andi $t5,$t0,255 # getting the reminder on dividing with 256
	add $t0,$t5,$t4 # find the new number for the loop
	j loop


exit: #### exit the program ####
	la $a0 , ans_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
	
	move $a0 , $t2 # loads address of entering number msg in $a0
	li $v0 , 1 # loads print integer syscall command
	syscall # makes a system call

	la $a0 , rem_msg # loads address of entering number msg in $a0
	li $v0 , 4 # loads print string syscall command
	syscall # makes a system call
	
	move $a0 , $t0 # loads address of entering number msg in $a0
	li $v0 , 1 # loads print integer syscall command
	syscall # makes a system call

	li $v0 , 10 # load exit command into $v0
	syscall # makes a system call


.data ##### data for storing strings ######
num_msg: .asciiz "Enter a Positive Integer : "
ans_msg: .asciiz "The Quotient is : "
rem_msg: .asciiz "\nThe Reminder is : "