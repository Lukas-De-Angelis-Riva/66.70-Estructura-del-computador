
	.begin
	.org 2048
prog3:
	ld %r14,%r2		!Acceso a memoria RAM
	add %r0, 25,%r1	!Operacion de registro
	add %r2,%r1,%r2	!Operacion de registro
	st %r2,%r14		!Acceso a memoria RAM
	jmpl %r15, 4, %r0	!Operacion de registro
				!2Ram + 3Reg	
	.end
