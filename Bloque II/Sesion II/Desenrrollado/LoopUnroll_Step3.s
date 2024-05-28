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
	daddi r1,r0,X	; r1 will be my base register

loop:
	l.d f0, 0(r1)	; F0 <-- X(i)			;1st iteration
	l.d f6, 8(r1)	; F6 <-- X(i+1)			;2nd iteration
	l.d f10, 16(r1)	; F10 <-- X(i+2)		;3rd iteration
	l.d f14, 24(r1)	; F14 <-- X(i+3)		;4th iteration

	add.d f4,f0,f2	; F4 <-- X(i) + Cvalue
	add.d f8,f6,f2	; F4 <-- X(i+1) + Cvalue
	add.d f12,f10,f2	; F4 <-- X(i+2) + Cvalue
	add.d f16,f14,f2	; F4 <-- X(i+3) + Cvalue

	s.d f4, 0(r1)	; store result
	s.d f8, 8(r1)	; store result
	s.d f12, 16(r1)	; store result
	s.d f16, 24(r1)	; store result

	daddi r1,r1,32	; i = i+4	;notice that the number of iterations must be multiple of 4
	bne r1,r2,loop	; branch if r1!=r2

	halt
