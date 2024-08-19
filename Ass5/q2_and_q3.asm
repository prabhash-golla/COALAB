## Group Number : 50
## 22CS10063 Sadda Suchith Reddy
## 22CS30027 Golla Meghanandh Manvith Prabhash

.data 
array: .space 400               # Space for the matrix (assuming a max of 100 elements)
transpose: .space 400           # Space for the transpose of the matrix
input1: .asciiz "Enter the value of n : "   # Prompt for number of rows
input2: .asciiz "Enter the value of m : "   # Prompt for number of columns
input3: .asciiz "Enter the value of a : "   # Prompt for the value of a
input4: .asciiz "Enter the value of b : "   # Prompt for the value of b
input5: .asciiz " "             # Space between matrix elements
input6: .asciiz "\n"            # Newline character
input7: .asciiz "The Matrix is : \n"    # Message before printing the matrix
input8: .asciiz "The Transpose Matrix is : \n"  # Message before printing the transpose matrix

.text
.globl main

main:
    # Input part
    la $a0, input1              # Load address of input1 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the string

    li $v0, 5                   # Load syscall code for read_int into $v0
    syscall                     # Read the integer
    move $t0, $v0               # Move the input value to $t0 (n)

    la $a0, input2              # Load address of input2 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the string

    li $v0, 5                   # Load syscall code for read_int into $v0
    syscall                     # Read the integer
    move $t1, $v0               # Move the input value to $t1 (m)
    
    la $a0, input3              # Load address of input3 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the string

    li $v0, 5                   # Load syscall code for read_int into $v0
    syscall                     # Read the integer
    move $t2, $v0               # Move the input value to $t2 (a)

    la $a0, input4              # Load address of input4 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the string

    li $v0, 5                   # Load syscall code for read_int into $v0
    syscall                     # Read the integer
    move $t3, $v0               # Move the input value to $t3 (b)

    # Initialize values
    li $s0, 0                   # Set row index to 0
    la $a3, array               # Load address of array into $a3
    la $a2, transpose           # Load address of transpose into $a2
    li $t5, 1                   # Initialize t5 to 1
    li $t6, 1                   # Initialize t6 to 1
    li $t7, 1                   # Initialize t7 to 1

    # Print the matrix message
    la $a0, input7              # Load address of input7 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the string

    # Build the matrix
    jal build_matrix            # Call build_matrix function
    li $s0, 0                   # Reset row index to 0

    # Transpose the matrix
    jal Transpose_matrix        # Call Transpose_matrix function
    li $s0, 0                   # Reset row index to 0

    # Print the transpose matrix message
    la $a0, input8              # Load address of input8 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the string

    # Print the transpose matrix
    jal PrintMatrix             # Call PrintMatrix function

quit:
    li $v0, 10                  # Load syscall code for exit into $v0
    syscall                     # Exit the program

ptr:
    jr $ra                      # Return from the current procedure

# Function to build the matrix
build_matrix:
    bge $s0, $t0, ptr           # If row index >= n, return
    li $s1, 0                   # Set column index to 0
    li $t6, 1                   # Reset t6 to 1
loop:
    bge $s1, $t1, increment     # If column index >= m, go to increment
    mul $a0, $t5, $t6           # Calculate a0 = t5 * t6
    mul $a0, $a0, $t7           # Calculate a0 = a0 * t7
    mul $t9, $s0, $t1           # Calculate t9 = s0 * m
    mul $t9, $t9, 4             # Calculate t9 = t9 * 4 (byte offset for row)
    mul $t8, $s1, 4             # Calculate t8 = s1 * 4 (byte offset for column)
    add $t8, $t9, $t8           # Calculate t8 = t9 + t8 (total offset)
    add $t8, $t8, $a3           # Calculate t8 = t8 + base address of array
    sw $a0, 0($t8)              # Store the value at the calculated address
    li $v0, 1                   # Load syscall code for print_int into $v0
    syscall                     # Print the integer
    la $a0, input5              # Load address of input5 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the space

    mul $t7, $t7, -1            # Toggle t7 between 1 and -1
    mul $t6, $t6, $t3           # Calculate t6 = t6 * b
    addi $s1, $s1, 1            # Increment column index
    j loop                      # Jump to loop

increment:
    la $a0, input6              # Load address of input6 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the newline
    mul $t5, $t5, $t2           # Calculate t5 = t5 * a
    addi $s0, $s0, 1            # Increment row index
    j build_matrix              # Jump to build_matrix

# Function to transpose the matrix
Transpose_matrix:
    bge $s0, $t0, ptr           # If row index >= n, return
    li $s1, 0                   # Set column index to 0
loopt:
    bge $s1, $t1, incrementt    # If column index >= m, go to incrementt

    mul $t9, $s0, $t1           # Calculate t9 = s0 * m
    mul $t9, $t9, 4             # Calculate t9 = t9 * 4 (byte offset for row)
    mul $t8, $s1, 4             # Calculate t8 = s1 * 4 (byte offset for column)
    add $t8, $t9, $t8           # Calculate t8 = t9 + t8 (total offset)
    add $t8, $t8, $a3           # Calculate t8 = t8 + base address of array
    lw $t7, 0($t8)              # Load the value from the calculated address

    mul $t9, $s1, $t0           # Calculate t9 = s1 * n
    mul $t9, $t9, 4             # Calculate t9 = t9 * 4 (byte offset for row in transpose)
    mul $t8, $s0, 4             # Calculate t8 = s0 * 4 (byte offset for column in transpose)
    add $t8, $t9, $t8           # Calculate t8 = t9 + t8 (total offset in transpose)
    add $t8, $t8, $a2           # Calculate t8 = t8 + base address of transpose
    sw $t7, 0($t8)              # Store the value in the transpose matrix

    addi $s1, $s1, 1            # Increment column index
    j loopt                     # Jump to loopt

incrementt:
    addi $s0, $s0, 1            # Increment row index
    j Transpose_matrix          # Jump to Transpose_matrix

# Function to print the transpose matrix
PrintMatrix:
    bge $s0, $t1, ptr           # If row index >= m, return
    li $s1, 0                   # Set column index to 0
loopp:
    bge $s1, $t0, incrementp    # If column index >= n, go to incrementp

    mul $t9, $s0, $t0           # Calculate t9 = s0 * n
    mul $t9, $t9, 4             # Calculate t9 = t9 * 4 (byte offset for row in transpose)
    mul $t8, $s1, 4             # Calculate t8 = s1 * 4 (byte offset for column in transpose)
    add $t8, $t9, $t8           # Calculate t8 = t9 + t8 (total offset in transpose)
    add $t8, $t8, $a2           # Calculate t8 = t8 + base address of transpose
    lw $a0, 0($t8)              # Load the value from the transpose matrix

    li $v0, 1                   # Load syscall code for print_int into $v0
    syscall                     # Print the integer
    la $a0, input5              # Load address of input5 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the space

    addi $s1, $s1, 1            # Increment column index
    j loopp                     # Jump to loopp

incrementp:
    la $a0, input6              # Load address of input6 into $a0
    li $v0, 4                   # Load syscall code for print_string into $v0
    syscall                     # Print the newline
    addi $s0, $s0, 1            # Increment row index
    j PrintMatrix               # Jump to PrintMatrix
