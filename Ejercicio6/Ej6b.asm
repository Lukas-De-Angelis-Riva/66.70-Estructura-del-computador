
	.begin
	.org 2048
prog:
	ld [stackPointer], %r14
	ld [x], %r1
	ld [y], %r2
	addcc %r14, -4, %r14
	st %r1, %r14
	addcc %r14, -4, %r14
	st %r2, %r14


	addcc %r15, %r0, %r30
	call sbradd

	st %r14, [z]

	addcc %r14, 12, %r14

	jmpl %r30 + 4, %r0

x:	4
y:	9
z:	0
stackPointer:	6000 !Es para asignar un valor a r14 y que tenga sentido pasar cosas por el stack.



!sbradd recibe los parametros a sumar por la pila, es decir:
!Sumando1:	%r14.
!Sumando2:	%r14 + 4
!Suma:		%r14 - 4

!Se utilizan los registros r1 y r2, estos seran sobreescritos.

sbradd:

	ld %r14, %r1
	ld %r14 +4, %r2

	addcc %r1, %r2, %r2
	addcc %r14, -4, %r14
	
	st %r1, %r14
	jmpl %r15+4, %r0

.end
