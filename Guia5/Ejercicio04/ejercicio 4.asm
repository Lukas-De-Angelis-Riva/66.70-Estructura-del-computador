!EJERCICIO PRACTICO 4
!Escriba un programa en código ARC que declare dos variables de 32 bits en memoria RAM y que
!intercambie el contenido entre ellas. Utilizar el mínimo número de registros que le sea posible.

	.begin
	.org 2048
	
	x:1 	!Declaro variables
	y:2

	ld [x], %r1		!Cargo los registros
	ld[y], %r2
	
	st %r2,[x]		!Intercambio de lugar
	st %r1, [y]	

	

	.end
