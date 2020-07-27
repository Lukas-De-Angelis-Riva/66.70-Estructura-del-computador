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

	direccion .equ 1200
	largo .equ 6
	stack .equ 3000
	
	add %r0, stack, %r14

	add %r0, direccion, %r1
	push %r14, %r1
	add %r0, largo, %r1
	push %r14, %r1

	call obtenerExtremos

	pull %r14, %r1			!Por hacer algo
	pull %r14, %r2
	add %r1, %r2, %r3

fin:	ba fin
	.end




!Recibe por stack el largo del arreglo y la direccion del arreglo
	.begin
	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro
	.macro pull pila, reg
	
		ld pila, reg
		add pila, 4, pila
	.endmacro
obtenerExtremos:
	add %r15, %r0, %r30

	call obtenerMaximo			!Obtengo el maximo
	pull %r14, %r5			!Lo dejo en r5 para poner la pila en buen estado para obtener minimo
	call obtenerMinimo			!Obtengo el minimo
	push %r14, %r5			!Subo a la pila el maximo
	
	jmpl %r30 + 4, %r0			!Termine
	.end




!r1 -> largo del array
!r2 -> direccion del array
!r3 -> maximo parcial / minimo parcial
!r4 -> iterador
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
	pull %r14, %r1
	pull %r14, %r2
	push %r14, %r2			!Me dejo la pila identica a como vino
	push %r14, %r1

	ld %r2, %r3				!Cargo el primer elemento del arreglo en r3, siendo el maximo actual
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



obtenerMinimo:				
	pull %r14, %r1			!Saco todo de la pila
	pull %r14, %r2
	
	ld %r2, %r3				!Idem a mayor, cargo el menor actual
oMinLoop:
	addcc %r1, %r0, %r0			
	be oMinFin				!Me fijo si termine de iterar o no
	ld %r2, %r4				!Cargo el que voy a revisar
	subcc %r4, %r3, %r0			!Si el r4 - r3 < 0 -> r4 es menor a r3, por lo que pasa a ser menor actual
	bneg oMinEsMenor			
	ba oMinEsMayor			!En caso contrario, r3 sigue siendo el menor
oMinEsMenor:
	add %r4, %r0, %r3
oMinEsMayor:
	add %r2, 4, %r2
	subcc %r1, 1, %r1
	ba oMinLoop
oMinFin:
	push %r14, %r3
	jmpl %r15 + 4, %r0
.end
