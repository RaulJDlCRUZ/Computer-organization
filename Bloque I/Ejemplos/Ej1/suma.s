.data
    a: .word 10
    b: .word 5
    c: .space 4
.text
    lw $t0 a #$t0 = 10
    lw $t1 b #$t1 = 5
    add $a0 $t0 $t1 #$a0 = 15
    sw $a0 c
    li $v0 1
    syscall #print_int