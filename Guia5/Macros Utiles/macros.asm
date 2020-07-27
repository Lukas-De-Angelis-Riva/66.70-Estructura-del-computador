	.begin

	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro

	.macro pull pila, reg
	
		ld pila, reg
		add pila, 4, pila
	.endmacro


	.org 2048
	add %r0, 3000, %r14

	ld [x], %r1
	ld [y], %r2
	add %r1, %r2, %r3
	push %r14, %r3
	pull %r14, %r5

	jmpl %r15, 4, %r0

x:	9
y:	10
	.end

