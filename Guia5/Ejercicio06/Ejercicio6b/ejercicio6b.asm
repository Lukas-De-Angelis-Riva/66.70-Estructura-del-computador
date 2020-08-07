!Ejercicio 6A
!Sumar dos numeros pasandolos por registros

.begin
.org 2048

	ld [unNumero], %r1
	ld [otroNumero], %r2

	addcc %r14, -4, %r14

	st %r1,%r14

	addcc %r14, -4, %r14

	st %r2,%r14		

	call sumar

sumar:

	ld %r14,%r3
	addcc %r14, 4, %r14

	ld %r14,%r4
	addcc %r14, 4, %r14

	addcc %r3,%r4,%r5

	jmpl %r15,4,%r0
	unNumero:5
	otroNumero:50

.end

