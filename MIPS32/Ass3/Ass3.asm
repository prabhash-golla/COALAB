## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy


.text

main:

    li $s0, 10                      # N

    la $a0, print_input
    li $v0, 4
    syscall
    
    addi $s3, $0, 0             # s2 is 4
    jal input_array

    jal init_heapify

    addi $s3, $0, 0 
    
    la $a0, output
    li $v0, 4
    syscall

    jal print_output

    li $v0, 10
    syscall

input_array:
    li $t0, 4
    mul $t1, $s0, $t0
    bge $s3, $t1, input_return      # t0 loop counter
    
    li $v0, 5                       # Input array element
    syscall

    sw $v0, array($s3)              # storing $v0 in array pos
    addi $s3, $s3, 4

    j input_array

input_return:
    jr $ra

print_output:
    li $t0, 4
    mul $t1, $s0, $t0
    bge $s3, $t1, print_return      # t0 loop counter
    
    lw $a0, array($s3)
    li $v0, 1                       # Input array element
    syscall

    la $a0, print_space
    li $v0, 4
    syscall

    addi $s3, $s3, 4

    j print_output

print_return:
    jr $ra

init_heapify:
    li $s1, 4

heapifyloop:    
    add $a0, $s1, $0
    blt $s1, $0, heapify_return

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal heapify

    addi $s1 $s1, -1
    j heapifyloop

heapify_return:
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra

heapify:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    move $s2, $a0           # i

    mul $t1, $a0, 2
    
    addi $t2, $t1, 1        # l
    addi $t3, $t1, 2        # r

st_check:
    bge $t2, $s0, return

    mul $t4, $a0, 4
    lw $t5, array($t4)

    mul $t6, $t2, 4
    lw $t7, array($t6)

    bge $t5, $t7, nd_check
    add $a0, $t2, $0

nd_check:
    bge $t3, $s0, check

    mul $t4, $a0, 4
    lw $t5, array($t4)

    mul $t6, $t3, 4
    lw $t7, array($t6)

    bge $t5, $t7, check
    add $a0, $t3, $0

check:
    beq $a0, $s2, return

swaprecursion:
    mul $t2, $a0, 4
    lw $t0, array($t2)

    mul $t3, $s2, 4
    lw $t1, array($t3)

    sw $t1, array($t2)
    sw $t0, array($t3)

    jal heapify

return:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


.data 
    array: .space 40
    output: .asciiz "Array after heapify function: "
    print_space: .asciiz " "
    print_input: .asciiz "Enter 10 elements one by one: \n"