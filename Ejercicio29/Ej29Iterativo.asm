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
	 add %r0, 0, %r2			! Acumulado = 0
loop:
	addcc %r1, 0, %r0			! i?
	be finSum				! if(i == 0){go to finSum}
	add %r2, %r1, %r2			! if(i != 0)
	sub %r1, 1, %r1			! i = i - 1
	ba loop				! go to loop
finSum:
	jmpl %r15 + 4, %r0			! return
	.end
