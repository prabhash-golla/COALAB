## Group Number : 50
## 22CS10063 Sadda Suchith Reddy
## 22CS30027 Golla Meghanandh Manvith Prabhash

.data
msg1: .asciiz "Enter the string : \n"    # Message to prompt the user for input
msg2: .asciiz "The reversed string : "   # Message to display before the reversed string

.text
.globl main

main:
    # Display the input prompt message
    la $a0, msg1          # Load the address of msg1 into $a0
    li $v0, 4             # Load the syscall code for print_string into $v0
    syscall               # Make the syscall to print the string

    # Read the user input
    li $v0, 8             # Load the syscall code for read_string into $v0
    syscall               # Make the syscall to read the string
    move $t0, $a0         # Move the address of the input string to $t0
    move $t1, $a1         # Move the address of the buffer to $t1

    # Display the reversed string message
    la $a0, msg2          # Load the address of msg2 into $a0
    li $v0, 4             # Load the syscall code for print_string into $v0
    syscall               # Make the syscall to print the string

    # Call the reversed function to print the reversed string
    jal reversed          # Jump and link to the reversed function
    j quit                # Jump to quit to exit the program

reversed:
    lb $t4, 0($t0)        # Load the byte at address $t0 into $t4
    beqz $t4, stop        # If $t4 is zero (end of string), jump to stop
    addi $sp, $sp, -8     # Decrease the stack pointer by 8 (make space on the stack)
    sw $ra, 0($sp)        # Save the return address on the stack
    sw $t4, 4($sp)        # Save the current character on the stack
    addi $t0, $t0, 1      # Move to the next character in the string
    jal reversed          # Recursively call reversed

stop:
    lw $ra, 0($sp)        # Load the return address from the stack
    lw $t4, 4($sp)        # Load the saved character from the stack
    move $a0, $t4         # Move the character to $a0 for printing
    li $v0, 11            # Load the syscall code for print_char into $v0
    syscall               # Make the syscall to print the character
    addi $sp, $sp, 8      # Restore the stack pointer (pop the stack)
    jr $ra                # Return to the caller

quit:
    li $v0, 10            # Load the syscall code for exit into $v0
    syscall               # Make the syscall to exit the program
