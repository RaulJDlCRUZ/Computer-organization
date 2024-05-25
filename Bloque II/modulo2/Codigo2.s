#Sumar valores de dos vectores. El resultado se guarda en el registro F6
#@autores: Pablo Blazquez Sanchez, Raul Jimenez de la Cruz
.data

X: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09
	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09
Y: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09
	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09

.text

main:
	daddi r1,r0,X	#; r1 como registro base X
	daddi r2,r0,Y	#; r2 como registro base Y
	daddi r3,r0,20	#; r3 <-- Numero de elementos de cada vector (2x10)
	daddi r4,r0,0 	#; r0 <-- contador // iterador
loop:
	l.d f0, 0(r1)	#; F0 <-- X(i)
	l.d f2, 0(r2)	#; F2 <-- Y(i)
	l.d f8, 8(r1)
	add.d f4,f0,f2	#; F4 <-- X(i) + Y(i) (suma elementos vector X e Y)
	
	l.d f10, 8(r2)
	l.d f14, 16(r1)
	add.d f12,f8,f10
	add.d f6,f6,f4  #; F6 <-- F6+f4 (acumulo en f6)
	
	l.d f16, 16(r2)
	
	daddi r1,r1,32 	#Incremento direcciones de memoria r1. 8*4=32
	l.d f20, -8(r1) #Como queria acceder al elemento con desplazamiento 24, empleo -8 tras incremento
	add.d f18,f14,f16
	add.d f6,f6,f12
	
	l.d f22, 24(r2)
	daddi r2,r2,32
	add.d f24,f20,f22
	add.d f6,f6,f18
	
	daddi r4,r4,4 #aumento iterador. Incremento dirs de 4 en 4
    
	bne r4,r3,loop	#; salto si r4!=20 (que es r3)
	add.d f6,f6,f24
	halt
	