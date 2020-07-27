	.begin

	.macro push pila, reg
		add pila, -4, pila
		st reg, pila
	.endmacro

	.macro pull pila, reg
		ld pila, reg
		add pila, 4, pila
	.endmacro

stack	.equ 4000
n	.equ 30

	add %r0, stack, %r14

	add %r0, n, %r1
	call sumatoria
fin:	ba fin

!r1 -> n
sumatoria:
	push %r14, %r15			! Me guardo en el stack el r15
	add %r0, 0, %r2			! Pongo en 0 el acumulado
	call sumatoriaRecursiva		! Llamo a la sumatoria recursiva
	pull %r14, %r15			! Me traigo el r15 que guarde a r15
	jmpl %r15 + 4, %r0			! return


!r1 -> i : {n, n-1, n-2, ..., 3, 2, 1, 0}
!r2 -> acumulado
sumatoriaRecursiva:
	push %r14, %r15
	addcc %r1, %r0, %r0			! i
	be corteRecursivo			! if (i == 0)
						! if (i != 0)
	add %r2, %r1, %r2			! acumulado = acumulado + i;
	sub %r1, 1, %r1			! i = i - 1;
	call sumatoriaRecursiva
corteRecursivo:
	pull %r14, %r15
	jmpl %r15 + 4, %r0
	.end
