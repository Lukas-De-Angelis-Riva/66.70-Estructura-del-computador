!EJERCICIO PRACTICO 4
!Escriba un programa en código ARC que declare dos variables de 32 bits en memoria RAM y que
!intercambie el contenido entre ellas. Utilizar el mínimo número de registros que le sea posible.
	.begin
	.org 2048
	ld [x], %r1
	st %r1, [z]
	ld [y], %r1
	st %r1, [x]
	ld [z], %r1
	st %r1, [y]
x:	15
y:	9
z:	0
	.end
