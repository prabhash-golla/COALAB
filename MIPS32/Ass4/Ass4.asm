## Group Number : 50
## 22CS30027 Golla Meghanandh Manvith Prabhash
## 22CS10063 Sadda Suchith Reddy
## Registers Used :
## $t0 for storing M
## $t1 for storing d
## $t2 for storing N
## $t3 for Array storing the Bianry representation

.text
.globl main

main:
    # Print message to enter M
    la $a0, num1_msg        # Load address of "Enter M : " message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the message

    # Read integer input for M
    li $v0, 5               # Load read integer syscall command into $v0
    syscall                 # Make the syscall to read an integer
    move $t0, $v0           # Store the input value in $t0 (M)

    # Print message to enter d
    la $a0, num2_msg        # Load address of "Enter d : " message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the message

    # Read integer input for d
    li $v0, 5               # Load read integer syscall command into $v0
    syscall                 # Make the syscall to read an integer
    move $t1, $v0           # Store the input value in $t1 (d)

    # Print message to enter N
    la $a0, num3_msg        # Load address of "Enter N : " message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the message

    # Read integer input for N
    li $v0, 5               # Load read integer syscall command into $v0
    syscall                 # Make the syscall to read an integer
    move $t2, $v0           # Store the input value in $t2 (N)

    # Convert d to binary
    move $a0, $t1           # Move d to $a0 for DecimalToBinary call
    la $t3, array           # Load address of array into $t3
    li $t4, 0               # Initialize index for array in $t4

    jal DecimalToBinary     # Call DecimalToBinary function

    # Print a newline
    la $a0, nextline_msg    # Load address of newline message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the newline

    # Print message before showing the result of exponentiation
    la $a0, num4_msg        # Load address of "The Exponentiation value of M power d mod N is : " message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the message

    # Compute M^d mod N
    jal ModExp
    move $t9, $v0           # Store the result in $t9

    # Print the result
    move $a0, $t9           # Move the result to $a0 for printing
    li $v0, 1               # Load print integer syscall command into $v0
    syscall                 # Make the syscall to print the result
 
    # Print a newline
    la $a0, nextline_msg    # Load address of newline message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the newline

    j exit                  # Exit the program

ModExp:
    li $t9, 1               # Initialize result to 1
    move $t5, $t0           # Set t5 to M (base)
    move $t6, $ra           # Save return address
    addi $t4, $t4, -1       # Decrement index to start from last bit

Loop:
    bltz $t4, Next          # If index is less than 0, jump to Next
    mul $t7, $t4, 4         # Calculate offset for current bit
    add $t7, $t7, $t3       # Calculate address of current bit in array
    lw $t8, 0($t7)          # Load the current bit from array
    blez $t8, continue1     # If bit is 0, skip multiplication

    move $a0, $t5           # Move base to $a0
    move $a1, $t9           # Move result to $a1
    jal Multiply            # Call Multiply to multiply base and result
    move $t9, $v0           # Store result in $t9
    div $t9, $t2            # Divide result by N
    mfhi $t9                # Store remainder in $t9

continue1:
    move $a0, $t5           # Move base to $a0
    jal Square              # Call Square to square the base
    move $t5, $v0           # Store base in $t5
    div $t5, $t2            # Divide base by N
    mfhi $t5                # Store remainder in $t5
    addi $t4, $t4, -1       # Decrement index
    j Loop                  # Jump to Loop

Next:
    move $v0, $t9           # Store result in $v0
    move $ra, $t6           # Restore return address
    jr $ra                  # Return to caller

Square:
    mul $v0, $a0, $a0       # v0 = a0 * a0
    jr $ra                  # Return to caller

Multiply:
    mul $v0, $a0, $a1       # v0 = a0 * a1
    jr $ra                  # Return to caller

exit:
    li $v0, 10              # Load exit command into $v0
    syscall                 # Make the syscall to exit

DecimalToBinary:
    andi $t5, $a0, 1        # Get the LSB of the number
    srl $a0, $a0, 1         # Shift the number right by 1
    addi $sp, $sp, -8       # Adjust stack pointer
    sw $t5, 4($sp)          # Store LSB on the stack
    sw $ra, 0($sp)          # Store return address on the stack

    bnez $a0, continue      # If $a0 is not zero, continue recursion

    # Base case: print the binary representation message
    la $a0, print_msg       # Load address of binary representation message into $a0
    li $v0, 4               # Load print string syscall command into $v0
    syscall                 # Make the syscall to print the message

    j BinaryReturn          # Jump to BinaryReturn

continue:
    jal DecimalToBinary     # Recursive call

BinaryReturn:
    lw $s0, 4($sp)          # Load saved LSB from stack
    lw $ra, 0($sp)          # Load saved return address from stack
    mul $t5, $t4, 4         # Calculate offset for storing in array
    add $t5, $t5, $t3       # Get address to store the bit
    sw $s0, 0($t5)          # Store the bit in array
    addi $t4, $t4, 1        # Increment index
    addi $sp, $sp, 8        # Restore stack pointer

    move $a0, $s0           # Move the bit to $a0 for printing
    li $v0, 1               # Load print integer syscall command into $v0
    syscall                 # Make the syscall to print the bit

    jr $ra                  # Return to caller

.data
num1_msg: .asciiz "Enter M : "
num2_msg: .asciiz "Enter d : "
num3_msg: .asciiz "Enter N : "
num4_msg: .asciiz "The Exponentiation value of M power d mod N is : "
print_msg: .asciiz "The Binary representation of d is : "
space_msg: .asciiz " "
nextline_msg: .asciiz "\n"
array: .space 128
