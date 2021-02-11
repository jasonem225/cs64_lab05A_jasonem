# simpleFunction.asm by Ziad Matni (c) 2021 for CS64
#
# This is just a simple example of a function call in MIPS Assembly
# The function, funcX, takes the argument, and adds 5 to it,
# then returns that sum to the main function.
# The main function then prints this integer sum.
#
.text
funcX:
    li $v0, 5
    add $v0, $v0, $a0
    jr $ra

main:
    li $a0, 7
    jal funcX

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall
