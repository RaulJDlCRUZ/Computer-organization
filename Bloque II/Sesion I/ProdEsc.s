; Producto escalar de dos vectores X e Y de doble precisión
; R7 determina el número de componentes
; R4 determina los bytes que ocupan dichos componentes
; El resultado almacena en F4

.data

X: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09 
Y:	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09 

.text
	; se asume que los registros se inicializan a cero

main:	daddi r7,r0,10	; r7 <-- número componentes vectores
	dsll r4,r7,3 	; r4 <-- r7*8 (desplaz. a izda 3 posiciones)
	
bucle:
	l.d f0, X(r1)	; f0 <-- X(i)
	l.d f2, Y(r1)	; f2 <-- Y(i)
	mul.d f2,f0,f2	; f2 <-- X(i)*Y(i)
	add.d f4,f4,f2	; f4 <-- Suma de los X(i)*Y(i) calculados
	daddi r1,r1,8	; X(r1) e Y(r1) apuntan al siguente componente
	dsub r2,r4,r1	; r2 <-- r4-r1
	bnez r2,bucle	; if r1!=r4 then volver al bucle else salir	

	halt
