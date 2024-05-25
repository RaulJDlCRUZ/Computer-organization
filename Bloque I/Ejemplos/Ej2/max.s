.data
    a: .word 12
    b: .word 3
    max: .space 4
    mayor: .asciiz "El mayor de los dos numeros es:"
    igual: .asciiz "Son iguales"
.text
    main:
    lw $t0 a
    lw $t1 b
    beq $t0 $t1 iguales
    la $a0 mayor
    li $v0 4
    syscall
    li $v0 1
    bge $t0 $t1 mayorPrimero
    move $a0 $t1
    syscall
    mayorPrimero: 
        move $a0 $t0
        syscall
        b fin
    iguales: 
        la $a0 igual
        li $v0 4
        syscall
        b fin
    fin: li $v0 10 #exit
        syscall