#@autores: Raul Jimenez de la Cruz y Pablo Blazquez Sanchez

#Aqui voy a almacenar cada uno de los datos iniciales: arrays y cadenas de texto
.data
	#Arrays. Son direcciones de memoria consecutivas.
	#Tener en cuenta tam. palabra = 4 bytes, entonces el iterador incrementara en el array de 4 en 4 posiciones de memoria
	lista1:	.word 2, 8, 10, 22, 15, 4, 9, 3, 8, 1				#a
	lista2:	.word 0, 9,  5,  6, 24, 2, 1, 7, 3, 8				#b
	lista3:	.space 40 #c: 10 espacios en el array * tam palabra = 40 BYTES
	#Cadena de texto final. Utilizo asciiz para tener al final el null-terminator (\0)
	mayor: 		.asciiz "El numero mayor del vector c es:"

#Aqui ira el metodo main, con cada una de sus etiquetas y sub-rutinas
.text
	.globl main
main:
	#cargo en los registros el VALOR (=palabra) del iterador y auxiliar (0), y en otros tres registros LA DIRECCION DE MEMORIA DE LOS ARRAYS
	li $t0 0 #iterador
	li $t1 0 #aux
	la $t2 lista1
	la $t3 lista2
	la $t4 lista3 #los tres vectores
	j while #el programa pasara de manera incondicional al primer bucle
while:
	beq $t0 10 seguir #Condicion parada: iterador == 10 (INMEDIATO; hay 10 elementos de array, del 0 al 9 == DIRECCIONES DE MEMORIA)
	lw $t5 ($t2)
	lw $t6 ($t3)
	#nada mas empezar el bucle actualizo en otros tres registros temporales el CONTENIDO de las direcciones de memoria de cada lista
	# ...(equivale a un indirecto a registro -> [.2] y [.3] segun IEEE 694)
	jal  comparar
	#salto incondicional, almaceno el registro $ra (o $31) para poder volver aqui (SUBRUTINA)
	# ...a otra etiqueta donde comparo los valores (contenido) de las direcciones de memoria de lista1 y lista2
	addi $t2 $t2 4
	addi $t3 $t3 4
	addi $t4 $t4 4
    #aumento las direcciones de memoria de lista1, 2 y 3. Es de 4 en 4 al ser palabras de 4 bytes
	addi $t0 $t0 1 	#i++
	j while 	#salto incondicional a etiqueta while (seguir con el bucle)
comparar:
	bge $t5 $t6 mayor1	#Si el elemento de la lista1 >= lista2 salto a la etiqueta mayor1
	sw $t6 ($t4)		#De lo contrario (lista1 < lista2), en el espacio de memoria de la lista3 almaceno el valor de lista2
	jr $ra			    #salto a $ra ($31). Esto implica volver al bucle while (donde lo habiamos dejado)
	mayor1:
		sw $t5 ($t4)	#Guardar en el espacio de memoria de lista3 el elemento de lista 1
		jr $ra		    #volvemos a donde lo dejamos, en el bucle while
#hemos salido del primer bucle, asi que vamos a asignar el valor del primer elemento del tercer array a aux y el iterador a 1:
seguir:
	sub $t4 $t4 40 #Quitar 40 direcciones de memoria para puntar al primer elemento del array (lista3[0])
	li $t0 1 #Cargar inmediato 1
	lw $t1 ($t4) #Indirecto a registro para tener contenido de dirección de memoria de $t4
	addi $t4 $t4 4 #Cargo la direccion del siguiente elemento del array (lista3[1]) para poder comparar en el bucle
	j while2 #saltamos incondicionalmente al segundo bucle:
while2:
	beq $t0 10 fin #si el iterador = 10, saltamos a la etiqueda donde se muestra el resultado y finaliza el programa
	lw $t7 ($t4) #guardo el CONTENIDO de la DIRECCION de lista3 para despues compararlo con el auxiliar
	jal comparar2 #salto para comparar, y guardo instruccion en $31
	addi $t0 $t0 1
	addi $t4 $t4 4 #aumento de iterador y direccion de memoria
	j while2 #vuelvo al bucle
comparar2:
	bge $t7 $t1 mayor2 #elemento actual de lista3 >= auxiliar?
	jr $ra #si no, vuelvo al bucle y no hago nada
	mayor2:
		lw $t1 ($t4) #Contenido de dirección de memoria == elemento actual a la variable auxiliar ($t1)
		jr $ra
fin:
	li $v0 4
	la $a0 mayor
	syscall	#Imprimir el texto que indicara al usuario cual sera el numero mayor entre lista1 y lista2 (print ascii)
	li $v0 1
	move $a0 $t1
	syscall	#Imprimir el numero entero correspondiente al mayor
	li $v0 10
	syscall #Salir. Equivale a System.exit(0) en Java o return 0 en main() de C.