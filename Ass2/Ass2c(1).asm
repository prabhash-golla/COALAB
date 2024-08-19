## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy

## solution considering that we have to find longest increasing subarray of given array 

.text
main:
	la $t0,array1       # load address of array1 into $t0
	lw $t1,size         # load size of the array into $t2
	addi $t1,$t1,-1
	li $t2,0            # initialize $t2 to 0 
	li $s0,1
	li $t6,0
	li $s1,1            # initialize $s1 to 1 
loop:
	bge $t2,$t1,print   # if $t3 >= size-1, go to calculate LIS
	mul $t3,$t2,4       # $t4 = $t2 * 4 (to calculate offset)
	add $t3,$t3,$t0     # $t3 = base address of array1 + offset
	lw $t4,0($t3)       # load array1[$t2] into $t5
	lw $t5,4($t3)       # load array1[$t2+1] into $t6
	bgt $t4,$t5,continue1
	add $s0,$s0,1
	blt $s1,$s0,update_s1
	j continue
	
update_s1:
	addi $s1,$s0,0      # $s1 = $s0
	addi $t6,$t2,2
	sub $t6,$t6,$s1

continue:
	addi $t2,$t2,1
	j loop       

continue1:
	add $t2,$t2,1
	li $s0,1
	j loop     

	
print:
	addi $t3, $t6,0          # $t3 = $t6

	la $a0 , ans_msg    # loads address of ans_msg into $a0
	li $v0 , 4          # loads print string syscall command
	syscall             # makes a system call
	
	move $a0 , $s1      # loads the max length into $a0
	li $v0 , 1          # loads print integer syscall command
	syscall             # makes a system call

	li $v0, 4           # loads print space command
	la $a0, space
	syscall             # makes a system call

	la $a0 , lis_msg    # loads address of ans_msg into $a0
	li $v0 , 4          # loads print string syscall command
	syscall             # makes a system call
	
	add $s1,$s1,$t3
	
	
print_loop:
	bge $t3, $s1, exit 
	mul $t4, $t3, 4
	add $t4, $t4, $t0
	lw $a0, 0($t4)
	li $v0,1
	syscall 
	addi $t3, $t3, 1    # move to the next element
	

	li $v0, 4           # loads print space command
	la $a0, space
	syscall             # makes a system call

	j print_loop        # repeat printing


exit:
	li $v0, 10          # load exit command into $v0
	syscall             # makes a system call



.data
array1:  .word 1, 34, 643, -99, 43118, 96, 321, 83, 8
size:    .word 9
ans_msg: .asciiz "The max length of increasing sub sequence is : "
lis_msg: .asciiz "\nThe longest increasing subsequnce of the give array is : "
space:   .asciiz " "
