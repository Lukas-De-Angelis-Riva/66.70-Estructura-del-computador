	.begin
	.org 2048
prog2:
	ld %r14,%r2		!Acceso a memoria RAM
	ld [value], %r1	!Acceso a memoria RAM
	add %r2,%r1,%r2	!Operacion de registro
	st %r2,%r14		!Acceso a memoria RAM
	jmpl %r15, 4, %r0	!Operacion de registro
value: 25			! 3 ram + 2reg
	.end
