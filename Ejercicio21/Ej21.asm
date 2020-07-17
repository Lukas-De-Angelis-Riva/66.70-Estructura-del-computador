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

	add %r0, array, %r1
	push %r14, %r1

	add %r0, 30, %r1
	push %r14, %r1

	call obtenerSuma

	pull %r14, %r2

	add %r0, array, %r1
	push %r14, %r1

	add %r0, 30, %r1
	push %r14, %r1

	addcc %r2, 1, %r0
	be overFlow

	andcc %r2, 00000001h, %r0
	be par
	ba impar


overFlow:

	add %r0, 0, %r1
	call llenarArrayConr1
	ba fin

par:
	
	ld [enCasoPar], %r1
	call llenarArrayConr1
	ba fin

impar:
	ba fin


fin:	ba fin


enCasoPar: 0000ffffh
	.org 4000
array:21312
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
0ffffff0h
12031
32103201
31231
13212
1231203
310231
1231
3210
12312
123
955
495					!La suma da 90844388
	.end
	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro

	.macro pull pila, reg

		ld pila, reg
		add pila, 4, pila

	.endmacro
.begin
					!r1 -> largo
					!r2 -> direccion
					!r3 -> elemento actual
					!r4 -> suma parcial

obtenerSuma:
	pull %r14, %r1
	pull %r14, %r2

	add %r0, %r0, %r4
sumaLoop:				!Loop de sumar
	addcc %r0, %r1, %r0		!Me fijo si ya termine la suma
	be finObtenerSuma		!Si termine de iterar, entonces termino
	ld %r2, %r3			!Cargo el proximo elemento del arreglo
	addcc %r4, %r3, %r4		!Sumo la suma parcail con el elemento actual
	bvs oSumaOverflow		!Si hubo overflow termino de iterar
	sub %r1, 1, %r1		!Le resto uno al iterador
	add %r2, 4, %r2		!Voy al proximo elemento a sumar
	ba sumaLoop
finObtenerSuma:			!Fin
	push %r14, %r4
	jmpl %r15, 4, %r0
oSumaOverflow:			!Caso overflow
	sub %r0, 1, %r4
	push %r14, %r4
	jmpl %r15, 4, %r0
.end



.begin


llenarArrayConr1:

	pull %r14, %r2		!r2 -> largo
	pull %r14, %r3		!r3 -> direccion

llenarLoop:

	addcc %r0, %r2, %r0		!Me fijo si termine de iterar
	be finLlenar			!En caso de r1 ser 0, termino
	st %r1, %r3			!Guardo r1 en el arreglo
	add %r3, 4, %r3		!Voy al proximo elemento del arreglo
	sub %r2, 1, %r2		!Voy bajando el iterador
	ba llenarLoop

finLlenar:
	jmpl %r15 + 4, %r0
.end
