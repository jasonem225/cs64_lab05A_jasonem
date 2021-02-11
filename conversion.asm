# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    move $t0, $a0 # variable x
    move $t1, $a1 # variable y
    li $t2, 0 # variable z
    li $t3, 0 # variable i
    li $t4, 5 # int 5 for loop
    li $t5, 3 # int 3 for if statement
    li $t6, 2 # int 2 for mult
loop: 
    bge $t3, $t4, loop_exit
    move $t7, $t0
    mult $t7, $t6
    mflo $t7
    add $t2, $t2, $t7
    sub $t2, $t2, $t1
    blt $t0, $t5, less_than
    addi $t1, $t1, -1
less_than:
    addi $t0, $t0, 1
    addi $t3, $t3, 1
    j loop
loop_exit:
    move $v0, $t2
    jr $ra

main:
    li $t0, 5
    li $t1, 7
    move $a0, $t0
    move $a1, $t1
    jal conv
    move $a0, $v0
    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall
