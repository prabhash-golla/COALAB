## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy

## solution considering that we have to find loggest increassing subsequense of given array i.e.... LIS problem

.text
main:
	la $t0,array1       # load address of array1 into $t0
	la $t1,array2       # load address of array2 into $t1
	lw $t2,size         # load size of the array into $t2
	li $t3,0            # initialize $t3 to 0 (loop counter)
	li $s1,0            # initialize $s1 to 0 (to store the max length)

loop1:
	bge $t3,$t2,calculate_lis  # if $t3 >= size, go to calculate LIS
	li $t4,0            # initialize $t4 to 0 (inner loop counter)
	mul $t5,$t3,4       # $t5 = $t3 * 4 (to calculate offset)
	add $t5,$t5,$t0     # $t5 = base address of array1 + offset
	lw $t6,0($t5)       # load array1[$t3] into $t6
	li $s0,1            # initialize $s0 to 1 (length of LIS ending at $t6)

loop2: 
	bge $t4,$t3,incrementt3  # if $t4 >= $t3, exit inner loop

	mul $t7,$t4,4       # $t7 = $t4 * 4 (to calculate offset)
	add $t7,$t7,$t0     # $t7 = base address of array1 + offset
	lw $t8,0($t7)       # load array1[$t4] into $t8
	ble $t6,$t8,incrementt4  # if array1[$t3] <= array1[$t4], skip

	mul $t7,$t4,4       # $t7 = $t4 * 4 (to calculate offset)
	add $t7,$t7,$t1     # $t7 = base address of array2 + offset
	lw $t9,0($t7)       # load array2[$t4] into $t9
	
	blt $t9,$s0,incrementt4  # if array2[$t4] < $s0, skip
	addi $s0,$t9,1      # $s0 = array2[$t4] + 1

incrementt4:
	addi $t4,$t4,1      # increment inner loop counter
	j loop2             # repeat inner loop

incrementt3:
	mul $t5,$t3,4       # $t5 = $t3 * 4 (to calculate offset)
	add $t5,$t5,$t1     # $t5 = base address of array2 + offset
	sw $s0,0($t5)       # store $s0 in array2[$t3]

	blt $s1,$s0,update_s1  # if $s1 < $s0, update $s1
	j continue_loop1

update_s1:
	addi $s1,$s0,0      # $s1 = $s0

continue_loop1:
	addi $t3,$t3,1      # increment outer loop counter
	j loop1             # repeat outer loop

calculate_lis:
	move $s2, $s1       # $s2 = max length of LIS (remaining_length)
	li $s3, 2147483647  # $s3 = INT_MAX (Present_element)
	addi $t3, $t2, -1   # $t3 = size - 1 (start from the end)

mark_lis:
	blt $t3, $zero, print_lis  # if $t3 < 0, go to print LIS

	mul $t5, $t3, 4     # $t5 = $t3 * 4 (to calculate offset)
	add $t5, $t5, $t0   # $t5 = base address of array1 + offset
	lw $t6, 0($t5)      # load array1[$t3] into $t6

	mul $t7, $t3, 4     # $t7 = $t3 * 4 (to calculate offset)
	add $t7, $t7, $t1   # $t7 = base address of array2 + offset
	lw $t8, 0($t7)      # load array2[$t3] into $t8

	bne $t8, $s2, skip_marking  # if array2[$t3] != remaining_length, skip
	bge $t6, $s3, skip_marking  # if array1[$t3] >= Present_element, skip

	li $t8, 0           # mark array2[$t3] as 0
	sw $t8, 0($t7)      # store 0 in array2[$t3]
	move $s3, $t6       # Present_element = array1[$t3]
	addi $s2, $s2, -1   # remaining_length -= 1

skip_marking:
	addi $t3, $t3, -1   # move to the previous element
	j mark_lis          # repeat marking

print_lis:
	li $t3, 0           # $t3 = 0 (start from the beginning)

	la $a0 , ans_msg    # loads address of ans_msg into $a0
	li $v0 , 4          # loads print string syscall command
	syscall             # makes a system call
	
	move $a0 , $s1      # loads the max length into $a0
	li $v0 , 1          # loads print integer syscall command
	syscall             # makes a system call

	la $a0 , lis_msg    # loads address of ans_msg into $a0
	li $v0 , 4          # loads print string syscall command
	syscall             # makes a system call

print_loop:
	

	bge $t3, $t2, exit  # if $t3 >= size, exit

	mul $t5, $t3, 4     # $t5 = $t3 * 4 (to calculate offset)
	add $t5, $t5, $t1   # $t5 = base address of array2 + offset
	lw $t6, 0($t5)      # load array2[$t3] into $t6

	bne $t6, $zero, continue_print  # if array2[$t3] != 0, skip

	mul $t5, $t3, 4     # $t5 = $t3 * 4 (to calculate offset)
	add $t5, $t5, $t0   # $t5 = base address of array1 + offset
	lw $a0, 0($t5)      # load array1[$t3] into $a0
	li $v0, 1           # loads print integer syscall command
	syscall             # makes a system call
	li $v0, 4           # loads print space command
	la $a0, space
	syscall             # makes a system call

continue_print:
	addi $t3, $t3, 1    # move to the next element
	j print_loop        # repeat printing

exit:
	li $v0, 10          # load exit command into $v0
	syscall             # makes a system call

.data
array1:  .word 1, 34, 643, -99, 43118, 96, 321, 83, 8
array2:  .word 1, 0, 0, 0, 0, 0, 0, 0, 0
size:    .word 9
ans_msg: .asciiz "The max length of increasing sub sequence is : "
lis_msg: .asciiz "\nThe longest increasing subsequnce of the give array is : "
space:   .asciiz " "
