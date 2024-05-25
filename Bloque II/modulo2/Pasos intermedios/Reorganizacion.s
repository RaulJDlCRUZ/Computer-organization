.data

X: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09
	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09
Y: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09
	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09

.text

main:
	daddi r3,r0,20
	daddi r4,r0,0
	daddi r1,r0,X
	daddi r2,r0,Y

loop:
	l.d f0, 0(r1)
	l.d f2, 0(r2)
	l.d f8, 8(r1)
	l.d f10, 8(r2)
	l.d f14, 16(r1)
	l.d f16, 16(r2)
	l.d f20, 24(r1)
	l.d f22, 24(r2) #Las instrucciones de carga en registro las colocamos todas seguidas
	
	add.d f4,f0,f2
    add.d f6,f6,f4
	
	add.d f12,f8,f10
	add.d f6,f6,f12

	add.d f18,f14,f16
    add.d f6,f6,f18
	
	add.d f24,f20,f22
    add.d f6,f6,f24 #Lo mismo para las sumas y acumulaciones en f6

	daddi r1,r1,32
	daddi r2,r2,32
	daddi r4,r4,4
	
	bne r4,r3,loop

	halt
	