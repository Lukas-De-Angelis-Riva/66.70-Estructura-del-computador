

! 2 Accesos a memoria ram.
! 3 Operaciones de registros. 

	.begin
prog1:
	.org 2048
	x .equ 25	 	!Directiva
	ld %r14,%r2 		!Acceso a memoria RAM.
	add %r0, x,%r1 	!Operacion de registro.
	add %r2,%r1,%r2    	!Operacion de registro.
	st %r2,%r14          !Acceso a memoria RAM.
	jmpl %r14 + 4, %r0	!Operacion de registro.
	.end
