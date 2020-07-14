!Ejercicio 6A
!Sumar dos numeros pasandolos por registros

.begin
.org 2048

	ld [unNumero], %r1
	ld [otroNumero], %r2
	call sumar

sumar:
	addcc %r1,%r2,%r3 
	st %r3, [resultado]
	jmpl %r15,4,%r0
	
	unNumero:5
	otroNumero:50
	resultado:0
.end

