
!Modulo principal.

	.begin
	.org 2048
	
	ld [x], %r1
	ld [y], %r2


	add %r15, %r0, %r30		!Guardo la referencia a la rutina que ha invocado este modulo.
	call sumar			!Llamo a la subrutina que suma.
	
	jmpl %r30 + 4, %r0		!Vuelvo de la rutina.


x:	40
y:	100

	.end

						
!Modulo secundario.
!Recibe dos numeros en %r1 y en %r2 y los suma.
!Sobreescribe el registro %r3 y devuelve en el la suma de los numeros.

	.begin
	.org 3000
sumar:	
	add %r1, %r2, %r3		!Realizo la suma 
	jmpl %r15 + 4, %r0
	.end

