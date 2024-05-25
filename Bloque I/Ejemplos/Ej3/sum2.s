.data
    max: .byte 10
.text
    .globl main
main:
    lb $t0 max
    move $t1 $zero
    move $a0 $zero
    b while
while: beq $t1 $t0 fin_while
    addu $a0 $a0 $t1
    addi $t1 $t1 1
    b while
fin_while: li $v0 1
    syscall
