!Ejercicio 8
!Sumar dos numeros pasandolos por registros
!Utilizar macros

.begin
.org 2048

.macro	sumar unNumero,otroNumero,resultado
		addcc unNumero,otroNumero,resultado

.endmacro

	ld [unNumero], %r1
	ld [otroNumero], %r2	

	sumar %r1,%r2,%r3

	st %r3,[resultado]

	unNumero:5
	otroNumero:50
	resultado:0
.end




