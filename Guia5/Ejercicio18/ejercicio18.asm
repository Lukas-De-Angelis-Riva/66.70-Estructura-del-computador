!Ejercicio 18 
!Escribir una rutina que lee del stack un valor de 32 bits, cuenta la cantidad de 1´s comprendidos
!en su representación binaria y devuelve ese valor por stack.

.begin
.org 2048
	
	ld [unNumero],%r1
	
	add %r1,%r0,%r2
	add %r0,%r0,%r3
	
	unNumero: 3100003Fh				!0011 0001 | 0000 0000 0000 0000 | 0011 1111 

loop:
	addcc %r2,%r0,%r0
	be finalizar
	bneg aumentarContador
shift:	
	sll %r2,1,%r2
	ba loop

aumentarContador:
	add %r3,1,%r3
	ba shift

finalizar:
	add %r14,-4,%r14
	st %r3,%r14
	jmpl %r15+4,%r0
.end

