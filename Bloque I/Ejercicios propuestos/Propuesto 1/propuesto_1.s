.data
a:  .space 400        # Espacio para 100 enteros (4 bytes cada uno)
b:  .space 400

.text
    .globl main
main:
    la   $t0, a       # Cargar direcciones base de arrays
    la   $t1, b
    li   $t2, 0       # Inicializar el índice i a 0

loop:
    beq  $t2, 100, end_loop  # Si i == 100, salir del bucle

    sll  $t3, $t2, 2         # Calcular el desplazamiento: i * 4
    add  $t4, $t0, $t3       # Direccies efectivas de arrays + desplazamiento
    add  $t5, $t1, $t3

    lw   $t6, 0($t4)         # Cargar a[i] en $t6
    lw   $t7, 0($t5)

    add  $t6, $t6, $t7       # a[i] = a[i] + b[i]
    sw   $t6, 0($t4)         # Almacenar el resultado en a[i]

    addi $t2, $t2, 1         # Incrementar i
    j    loop                # Volver al comienzo del bucle

end_loop:
    li   $v0, 10             # Código de salida para sys_exit
    syscall                  # Llamada al sistema para terminar el programa
