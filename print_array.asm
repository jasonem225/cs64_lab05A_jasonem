# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
array_content: .asciiz "The contents of the array are:\n"
newline: .asciiz "\n"
array: .word 1 2 3 4 5 6 7 8 9 10
alength: .word 10

.text
printA:
    # TODO: Write your function code here
    li $t0, 0 # variable i for loop count and index
    move $t1, $a0 # location of array
    move $t2, $a1 # length of array
loop:
    bge $t0, $t2, loop_exit
    sll $t3, $t0, 2
    add $t4, $t1, $t3
    lw $t5, 0($t4)

    # print int
    li $v0, 1
    move $a0, $t5
    syscall

    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    # increment count
    addi $t0, $t0, 1
    j loop
loop_exit:
    jr $ra

main:
    li $v0, 4
    la $a0, array_content
    syscall
    la $a0, array
    la $t0, alength
    lw $t1, 0($t0)
    move $a1, $t1
    jal printA

exit:
    li $v0, 10
    syscall
