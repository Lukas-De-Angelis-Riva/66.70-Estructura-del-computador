!Ejercicio 7A
!Sumar dos numeros pasandolos por registros
!Utilizar modulo principal y subrutina

.begin
.org 2048

	ld [unNumero], %r1
	ld [otroNumero], %r2
	call sumar
	unNumero:5
	otroNumero:50
	resultado:0
.end

.begin
.org 2080
sumar:
	addcc %r1,%r2,%r3 
	st %r3, [resultado]
	jmpl %r15,4,%r0

.end

