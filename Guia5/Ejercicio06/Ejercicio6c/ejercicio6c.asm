!Ejercicio 6C
!Sumar dos numeros pasandolos por area reservada de memoria

.begin
.org 2048

	ld [unNumero], %r1
	ld [otroNumero], %r2

	st %r1,[elementosSuma]

	st %r2,[elementosSuma+4]		

	call sumar

sumar:

	ld [elementosSuma],%r3
	ld [elementosSuma+4],%r4	

	addcc %r3,%r4,%r5

	st %r5, [elementosSuma+8]

	jmpl %r15,4,%r0

	unNumero:5
	otroNumero:50
	elementosSuma: .dwb 3

.end

