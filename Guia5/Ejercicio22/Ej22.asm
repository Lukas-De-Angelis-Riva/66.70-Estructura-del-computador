	.begin
	.org 2048
	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro
	.macro pull pila, reg
	
		ld pila, reg
		add pila, 4, pila
	.endmacro

	add %r0, 4000, %r14

	ld [mapa], %r1
	push %r14, %r1

	call obtenerMaximo

fin:	ba fin
mapa:	b0101000h				!Lo cambie para poder modificar facilmente los valores de la memoria desde la 'ide'
	.end


!r1 -> largo del arreglo
!r2 -> direccion del elemento
!r3 -> Elemento actual
!r4 -> Maximo actual
	.begin
	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro
	.macro pull pila, reg
	
		ld pila, reg
		add pila, 4, pila
	.endmacro

obtenerMaximo:
	add %r0, 8, %r1
	pull %r14, %r2	
	ld %r2, %r4
oMaxLoop:
	addcc %r1, %r0, %r0			!Me fijo si termine de iterar o no
	be oMaxFin
	ld %r2, %r4				!Cargo el proximo elemento a revisar
	subcc %r3, %r4, %r0			!Lo resto con el maximo actual
	bneg esMayor				!Si la resta da negativa -> r4 > r3, por lo que pasa a ser el mayor actual
	ba esMenor				!En caso contrario, el mayor actual es mayor al revisado
esMayor:
	add %r4, %r0, %r3
esMenor:
	add %r2, 4, %r2
	subcc %r1, 1, %r1
	ba oMaxLoop
oMaxFin:
	push %r14, %r3
	jmpl %r15 + 4, %r0

	.end
