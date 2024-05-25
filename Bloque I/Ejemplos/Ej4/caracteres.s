.data
    cadena: .asciiz "Esto es una cadena"
.text
    .globl main
main:
    la $t0 cadena 
    move $a0 $zero
    b while
while:
    lb $t1 ($t0)
    beqz $t1 fin_while
    addi $t0 $t0 1
    addi $a0 $a0 1
    b while 
fin_while:
    li $v0 1
    syscall