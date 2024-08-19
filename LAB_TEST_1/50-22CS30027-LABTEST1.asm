# Roll No. 22CS30027
# Group No. 50
# Name: Golla Meghanandh Manvith Prabhash

# Registers Used in the code:
# $S0 - N
# $S1 - R
# $S3 - N!
# $S4 - R!
# $S5 - (N-R)!
# $S6 - NCR

# factorial not called recursivly
.text
.globl main

main:
    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt1      # loading prompt1
    syscall               # making syscall

    li  $v0,5             # loading v0 for input a number
    syscall               # making syscall
    move $s0,$v0          # storing N in $s0 

    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt2      # loading prompt2
    syscall               # making syscall

    li  $v0,5             # loading v0 for input a number
    syscall               # making syscall
    move $s1,$v0          # storing R in $s1 

    move $a0,$s0          # Passing N as the first argument
    move $a1,$s1          # Passing R as the second argument  
    sub $a2,$s0,$s1       # Passing N-R as the third argument

    jal Combination       # Function call for Caliculating

    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt3      # loading prompt3
    syscall               # making syscall

    move $a0,$s0          # Loading N for printing  
    li $v0,1              # Loading v0 for printing integer
    syscall               # making syscall

    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt4      # loading prompt4
    syscall               # making syscall

    move $a0,$s1          # Loading R for printing  
    li $v0,1              # Loading v0 for printing integer
    syscall               # making syscall

    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt5      # loading prompt5
    syscall               # making syscall

    move $a0,$s6          # Loading NCR for printing  
    li $v0,1              # Loading v0 for printing integer
    syscall               # making syscall

    li $t0,0
    li $t1,1

    jal perfectnumber     # function to find sum of all  Perfect Divisiors 

    beq $t0,$s6,perfect   # Check wether the number is perfect of not

    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt7      # loading prompt7
    syscall               # making syscall

    j exit

perfect:
    li  $v0, 4            # loading v0 for printing a string
    la  $a0, prompt6      # loading prompt6
    syscall               # making syscall 

    j exit

exit:
    li $v0,10
    syscall

# Functions

# Function for the Caliculating of NCR
Combination:

    move $t9,$ra

    jal factorial
    move $s3,$v0

    move $a0,$a1
    jal factorial
    move $s4,$v0

    move $a0,$a2
    jal factorial
    move $s5,$v0

    mul $t0,$s4,$s5
    div $s3,$t0

    mflo $s6

    jr $t9

    
# Function for checkiong wether it is a perfect Number
perfectnumber:
    bge $t1,$a0,next
    rem $t2,$a0,$t1

    beqz $t2,addit
    j incrementt1
addit:
    add $t0,$t0,$t1

incrementt1:
    addi $t1,$t1,1
    j perfectnumber

next:
    jr $ra



# Function for Caliculation of factorial
factorial:
   move $t0,$a0
   li $t1,1
   li $t2,1
   j fact_loop

fact_loop:
    bgt $t2,$t0,done_factorial
    mul $t1,$t1,$t2
    addi $t2,$t2,1
    j fact_loop

done_factorial:

    move $v0,$t1
    jr $ra

.data
    prompt1: .asciiz "Enter the numbers N : "
    prompt2: .asciiz "Enter the number R : "
    prompt3: .asciiz "The value of C("
    prompt4: .asciiz ","
    prompt5: .asciiz ") is "
    prompt6: .asciiz "\nThe value is a perfect number"
    prompt7: .asciiz "\nThe value is not a perfect number"






    


