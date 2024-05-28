; Add constant value to a vector.
; The result is stored in the same vector.

.data

X: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09
	.double 1.10, 1.11, 1.12, 1.13, 1.14, 1.15, 1.16, 1.17, 1.18, 1.19

Cvalue:	.double 0.55

.text

main:	daddi r2,r0,20		; r2 <-- Number of vector components to process
	dsll  r2,r2,3		; End of the vector in memory
	l.d f2, Cvalue(r0) 	; f2 <-- The constant value to add
	daddi r1,r0,X	        ; r1 will be my base register

loop:
	l.d f0, 0(r1)	; F0 <-- X(i)
	add.d f4,f0,f2	; F4 <-- X(i) + Cvalue
	s.d f4, 0(r1)	; store result
	daddi r1,r1,8	; i = i+1
	bne r1,r2,loop	; branch if r1!=r2

	halt
