; Operaciones aritméticas imples
; C = A + B
; F = D - E

.data
	A: .word 10
	B: .word 8
	C: .word 0
	D: .word 7
	E: .word 5
	F: .word 0

.text
main:
	ld r1, A(r0)
	ld r2, B(r0)
	ld r4, D(r0)
	dadd r3,r2,r1
	ld r5, E(r0)
	sd r3, C(r0)
	dsub r6,r4,r5
	sd r6, F(r0)

	halt

